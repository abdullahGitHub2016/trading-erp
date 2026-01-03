<?php

namespace App\Http\Controllers;

use App\Models\Sale;
use App\Models\Product;
use App\Models\Journal;
use App\Models\Ledger;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class SaleController extends Controller
{
    public function index()
    {
        return Inertia::render('Sales/Index', [
            'sales' => Sale::with('customer')->orderBy('id', 'desc')->paginate(10)
        ]);
    }

    public function create()
    {
        return Inertia::render('Sales/Create', [
            'customers' => Customer::all(),
            'products' => Product::where('stock_quantity', '>', 0)->get()
        ]);
    }

    public function edit($id)
    {
        $sale = Sale::with(['customer', 'items.product'])->findOrFail($id);

        return Inertia::render('Sales/Edit', [
            'sale' => $sale,
            'customers' => Customer::all(),
            'products' => Product::all(),
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'customer_id' => 'required|exists:customers,id',
            'items' => 'required|array|min:1',
            'grand_total' => 'required|numeric',
        ]);

        return DB::transaction(function () use ($request, $id) {
            $sale = Sale::with('items')->findOrFail($id);

            // 1. Restore Stock (Reverse the old sale impact)
            foreach ($sale->items as $oldItem) {
                Product::find($oldItem->product_id)->increment('stock_quantity', $oldItem->quantity);
            }

            // 2. Update the Sale Header
            $sale->update([
                'customer_id' => $request->customer_id,
                'subtotal'    => $request->grand_total,
                'grand_total' => $request->grand_total,
                'paid_amount' => $request->grand_total,
                'sale_date'   => now(), // or keep original: $sale->sale_date
            ]);

            // 3. Delete old items and insert new items
            $sale->items()->delete();
            foreach ($request->items as $item) {
                $sale->items()->create([
    'product_id' => $item['product_id'],
    'quantity'   => $item['qty'],
    'unit_price' => $item['unit_price'],
    'item_total' => $item['qty'] * $item['unit_price'], // Use this name!
]);

                // Deduct new stock
                Product::find($item['product_id'])->decrement('stock_quantity', $item['qty']);
            }

            // 4. Update Accounting (Journal & Ledgers)
            $journal = Journal::where('journalable_id', $sale->id)
                ->where('journalable_type', Sale::class)
                ->first();

            if ($journal) {
                $journal->update([
                    'reference_no' => $sale->invoice_no,
                    'description'  => 'Updated Sale - ' . $sale->invoice_no,
                ]);

                // Delete old ledger rows and recreate them with new amounts
                $journal->ledgers()->delete();

                // DEBIT: Cash on Hand (ID 1)
                $this->createLedgerEntry($journal, 1, $sale->grand_total, 0, "Updated Cash for $sale->invoice_no");

                // CREDIT: Sales Revenue (ID 9)
                $this->createLedgerEntry($journal, 9, 0, $sale->grand_total, "Updated Revenue for $sale->invoice_no");
            }

            return redirect()->route('sales.index')->with('success', 'Sale and Ledger updated successfully.');
        });
    }

    public function store(Request $request)
    {
        $request->validate([
            'customer_id' => 'required|exists:customers,id',
            'items' => 'required|array|min:1',
            'grand_total' => 'required|numeric',
        ]);

        return DB::transaction(function () use ($request) {
            // 1. Generate Invoice Number immediately
            $invoiceNo = 'INV-' . strtoupper(bin2hex(random_bytes(4)));

            // 2. Create the Sale Record
            $sale = Sale::create([
                'invoice_no'      => $invoiceNo,
                'customer_id'     => $request->customer_id,
                'user_id'         => Auth::id(), // Use user_id instead of created_by
                'sale_date'       => now(),      // Required field
                'subtotal'        => $request->grand_total, // Required field
                'tax_amount'      => 0,
                'discount_amount' => 0,
                'grand_total'     => $request->grand_total,
                'paid_amount'     => $request->grand_total,
                'due_amount'      => 0,
                'status'          => 'completed',
            ]);

            // 3. Create Journal Entry (The Header)
            $journal = Journal::create([
                'date' => now(),
                'reference_no' => $invoiceNo,
                'description' => 'Sale Transaction - ' . $invoiceNo,
                'journalable_id' => $sale->id,
                'journalable_type' => Sale::class,
            ]);

            // 4. Record Double-Entry Accounting
            // DEBIT: Cash on Hand (ID 1) - Increase Asset
            // To this (Ensure it uses the correct DB property):
            $this->createLedgerEntry($journal, 1, $sale->grand_total, 0, "Cash received for $invoiceNo");

            // CREDIT: Sales Revenue (ID 9) - Increase Income
            $this->createLedgerEntry($journal, 9, 0, $sale->total_amount, "Revenue from $invoiceNo");

            // 5. Inventory & COGS Logic
            $totalCogs = 0;
            // Inside the DB::transaction block
            foreach ($request->items as $item) {
                $product = Product::find($item['product_id']);
                if ($product) {
                    $lineTotal = ($item['qty'] ?? 0) * ($item['unit_price'] ?? 0);

                    // MATCHING YOUR DB: 'item_total'
                    $sale->items()->create([
                        'product_id' => $product->id,
                        'quantity'   => $item['qty'],
                        'unit_price' => $item['unit_price'],
                        'item_total' => $lineTotal,
                    ]);

                    // Stock reduction
                    $product->decrement('stock_quantity', $item['qty']);
                }
            }

            // 6. Record Inventory Accounting (COGS)
            // Ensure Ledger uses 'grand_total' (from your previous Sale describe)
            $this->createLedgerEntry($journal, 1, $sale->grand_total, 0, "Cash received for $invoiceNo");
            // CREDIT: Inventory Asset (ID 4) - Decrease Asset
            $this->createLedgerEntry($journal, 4, 0, $totalCogs, "Inventory reduction for $invoiceNo");

            return redirect()->route('sales.index')->with('success', 'Sale completed and Ledger updated.');
        });
    }

    /**
     * Helper to ensure all DB constraints (journal_id, reference_type, etc.) are met.
     */
    private function createLedgerEntry($journal, $accountId, $debit, $credit, $desc)
    {
        return Ledger::create([
            'journal_id' => $journal->id,
            'chart_of_account_id' => $accountId,
            'debit' => $debit ?? 0, // Fallback to 0 if null
            'credit' => $credit ?? 0, // Fallback to 0 if null
            'description' => $desc,
            'transaction_date' => now(),
            'reference_type' => Journal::class,
            'reference_id' => $journal->id,
        ]);
    }
}
