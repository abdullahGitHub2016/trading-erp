<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\Journal;
use App\Models\Ledger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class PurchaseController extends Controller
{
    public function index()
    {
        return Inertia::render('Purchases/Index', [
            'purchases' => Purchase::with('supplier')->orderBy('id', 'desc')->paginate(10)
        ]);
    }

    public function create()
    {
        return Inertia::render('Purchases/Create', [
            'suppliers' => Supplier::select('id', 'name')->get(),
            'products' => Product::select('id', 'name', 'purchase_price', 'stock_quantity')->get()
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'items' => 'required|array|min:1',
            'total_amount' => 'required|numeric',
        ]);

        return DB::transaction(function () use ($request) {
            $purchase = Purchase::create([
                'purchase_no'   => 'PO-' . time(),
                'supplier_id'   => $request->supplier_id,
                'purchase_date' => $request->purchase_date ?? now(),
                'total_amount'  => $request->total_amount,
                'status'        => 'received',
                'created_by'    => Auth::id(),
            ]);

            // Save line items to purchase_items table
            foreach ($request->items as $item) {
                $purchase->items()->create([
                    'product_id' => $item['product_id'],
                    'quantity'   => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'subtotal'   => $item['subtotal'],
                ]);

                // Update stock and last purchase price
                $product = Product::find($item['product_id']);
                if ($product) {
                    $product->increment('stock_quantity', $item['quantity']);
                    $product->update(['purchase_price' => $item['unit_price']]);
                }
            }

            $this->createAccountingEntries($purchase, $request->total_amount);

            return redirect('/purchases')->with('success', 'Purchase recorded!');
        });
    }

/**
 * Show the form for editing the specified purchase.
 */
public function edit($id)
{
    return Inertia::render('Purchases/Edit', [
        // Load items relationship
        'purchase' => Purchase::with(['supplier', 'items'])->findOrFail($id),
        'suppliers' => Supplier::all(),
        // Explicitly select purchase_price to match the Vue interface
        'products' => Product::select('id', 'name', 'purchase_price', 'stock_quantity')->get()
    ]);
}

/**
 * Update the purchase and handle items.
 */
public function update(Request $request, $id)
{
    $request->validate([
        'supplier_id' => 'required',
        'items' => 'required|array',
        'total_amount' => 'required|numeric',
    ]);

    return DB::transaction(function () use ($request, $id) {
        $purchase = Purchase::with('items')->findOrFail($id);

        // 1. Reverse stock for old items
        foreach ($purchase->items as $oldItem) {
            Product::where('id', $oldItem->product_id)->decrement('stock_quantity', $oldItem->quantity);
        }

        // 2. Clean up old children
        $purchase->items()->delete();
        Journal::where('journalable_id', $purchase->id)
               ->where('journalable_type', Purchase::class)
               ->delete();

        // 3. Update main Purchase
        $purchase->update([
            'supplier_id' => $request->supplier_id,
            'purchase_date' => $request->purchase_date,
            'total_amount' => $request->total_amount,
        ]);

        // 4. Save new items and update stock
        foreach ($request->items as $item) {
            $purchase->items()->create([
                'product_id' => $item['product_id'],
                'quantity'   => $item['quantity'],
                'unit_price' => $item['unit_price'],
                'subtotal'   => $item['subtotal'],
            ]);

            Product::where('id', $item['product_id'])->increment('stock_quantity', $item['quantity']);
        }

        // 5. Re-create accounting entries
        $this->createAccountingEntries($purchase, $request->total_amount);

        return redirect('/purchases')->with('success', 'Purchase updated successfully!');
    });
}

    private function createAccountingEntries($purchase, $total)
    {
        $journal = Journal::create([
            'date'             => now(),
            'reference_no'     => $purchase->purchase_no,
            'description'      => 'Purchase Entry - ' . $purchase->purchase_no,
            'journalable_id'   => $purchase->id,
            'journalable_type' => Purchase::class,
        ]);

        // Fix: Added transaction_date to satisfy DB constraints
        $journal->ledgers()->create([
            'chart_of_account_id' => 4,
            'transaction_date'    => now(),
            'debit'               => $total,
            'credit'              => 0
        ]);

        $journal->ledgers()->create([
            'chart_of_account_id' => 1,
            'transaction_date'    => now(),
            'debit'               => 0,
            'credit'              => $total
        ]);
    }

    public function destroy($id)
    {
        DB::transaction(function () use ($id) {
            $purchase = Purchase::with('items')->findOrFail($id);

            // Reverse stock before deleting
            foreach ($purchase->items as $item) {
                Product::where('id', $item->product_id)->decrement('stock_quantity', $item->quantity);
            }

            Journal::where('journalable_id', $purchase->id)
                   ->where('journalable_type', Purchase::class)
                   ->delete();

            $purchase->delete();
        });

        return redirect('/purchases')->with('success', 'Purchase deleted.');
    }
}
