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
    /**
     * Display a listing of purchases.
     */
    public function index()
    {
        return Inertia::render('Purchases/Index', [
            'purchases' => Purchase::with('supplier')->orderBy('id', 'desc')->paginate(10)
        ]);
    }

    /**
     * Show the form for creating a new purchase.
     */
    public function create()
    {
        return Inertia::render('Purchases/Create', [
            'suppliers' => Supplier::select('id', 'name')->get(),
            'products' => Product::select('id', 'name', 'purchase_price', 'stock_quantity')->get()
        ]);
    }

    /**
     * Store a newly created purchase and automate ledger entries.
     */
    public function store(Request $request)
    {
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'items' => 'required|array|min:1',
            'total' => 'required|numeric',
        ]);

        return DB::transaction(function () use ($request) {
            $purchaseNo = 'PO-' . time();

            $purchase = Purchase::create([
                'purchase_no'   => $purchaseNo,
                'supplier_id'   => $request->supplier_id,
                'purchase_date' => now(),
                'total_amount'  => $request->total,
                'status'        => 'received',
                'created_by'    => Auth::id(),
            ]);

            $this->createAccountingEntries($purchase, $request->total);

            foreach ($request->items as $item) {
                $product = Product::find($item['product_id']);
                if ($product) {
                    $product->increment('stock_quantity', $item['qty']);
                    $product->update(['purchase_price' => $item['unit_price']]);
                }
            }

            return redirect('/purchases')->with('success', 'Purchase recorded!');
        });
    }

    /**
     * Show the form for editing the specified purchase.
     */
    public function edit($id)
    {
        return Inertia::render('Purchases/Edit', [
            'purchase' => Purchase::with('supplier')->findOrFail($id),
            'suppliers' => Supplier::all(),
            'products' => Product::all()
        ]);
    }

    /**
     * Update the purchase and recalculate ledger entries.
     */
    public function update(Request $request, $id)
    {
        return DB::transaction(function () use ($request, $id) {
            $purchase = Purchase::findOrFail($id);

            // 1. Reverse old accounting entries
            Journal::where('journalable_id', $purchase->id)
                   ->where('journalable_type', Purchase::class)
                   ->delete();

            // 2. Update Purchase record
            $purchase->update([
                'supplier_id' => $request->supplier_id,
                'total_amount' => $request->total,
            ]);

            // 3. Create new accounting entries for the updated amount
            $this->createAccountingEntries($purchase, $request->total);

            return redirect('/purchases')->with('success', 'Purchase and Ledger updated!');
        });
    }

    /**
     * Helper method to handle Double-Entry logic.
     */
    private function createAccountingEntries($purchase, $total)
    {
        $journal = Journal::create([
            'date'             => now(),
            'reference_no'     => $purchase->purchase_no,
            'description'      => 'Purchase Entry - ' . $purchase->purchase_no,
            'journalable_id'   => $purchase->id,
            'journalable_type' => Purchase::class,
        ]);

        // DEBIT: Inventory Asset (ID 4)
        $journal->ledgers()->create([
            'chart_of_account_id' => 4,
            'debit'               => $total,
            'credit'              => 0
        ]);

        // CREDIT: Cash on Hand (ID 1)
        $journal->ledgers()->create([
            'chart_of_account_id' => 1,
            'debit'               => 0,
            'credit'              => $total
        ]);
    }

    /**
     * Remove the purchase and its financial history.
     */
    public function destroy($id)
    {
        DB::transaction(function () use ($id) {
            $purchase = Purchase::findOrFail($id);
            Journal::where('journalable_id', $purchase->id)
                   ->where('journalable_type', Purchase::class)
                   ->delete();
            $purchase->delete();
        });

        return redirect('/purchases')->with('success', 'Purchase deleted.');
    }
}
