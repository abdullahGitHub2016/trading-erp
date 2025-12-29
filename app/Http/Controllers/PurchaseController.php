<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use App\Models\Supplier;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class PurchaseController extends Controller
{
    public function index()
    {
        $purchases = Purchase::with('supplier')
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        return Inertia::render('Purchases/Index', [
            'purchases' => $purchases
        ]);
    }

    public function create()
    {
        return Inertia::render('Purchases/Create', [
            'suppliers' => Supplier::select('id', 'name')->get(),
            'products'  => Product::select('id', 'name', 'purchase_price as price')->get(),
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'purchase_date' => 'required|date',
            'items' => 'required|array|min:1',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.quantity' => 'required|numeric|min:1',
            'items.*.unit_price' => 'required|numeric|min:0',
        ]);

        DB::transaction(function () use ($request) {
            $purchase = Purchase::create([
                'purchase_no' => 'PO-' . time(),
                'supplier_id' => $request->supplier_id,
                'purchase_date' => $request->purchase_date,
                'total_amount' => $request->total_amount,
                'status' => 'pending',
                'created_by' => Auth::id(),
            ]);

            foreach ($request->items as $item) {
                $purchase->items()->create([
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'subtotal' => $item['quantity'] * $item['unit_price'],
                ]);
            }
        });

        return redirect()->route('purchases.index')->with('success', 'Purchase created successfully!');
    }

    public function edit(Purchase $purchase)
    {
        return Inertia::render('Purchases/Edit', [
            'purchase' => $purchase->load('items'),
            'suppliers' => Supplier::select('id', 'name')->get(),
            'products'  => Product::select('id', 'name', 'purchase_price as price')->get(),
        ]);
    }

    public function update(Request $request, Purchase $purchase)
    {
        $request->validate([
            'supplier_id' => 'required|exists:suppliers,id',
            'purchase_date' => 'required|date',
            'items' => 'required|array|min:1',
        ]);

        DB::transaction(function () use ($request, $purchase) {
            $purchase->update([
                'supplier_id' => $request->supplier_id,
                'purchase_date' => $request->purchase_date,
                'total_amount' => $request->total_amount,
            ]);

            // Sync items: Delete old ones and insert new ones
            $purchase->items()->delete();

            foreach ($request->items as $item) {
                $purchase->items()->create([
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity'],
                    'unit_price' => $item['unit_price'],
                    'subtotal' => $item['quantity'] * $item['unit_price'],
                ]);
            }
        });

        return redirect()->route('purchases.index')->with('success', 'Purchase updated successfully!');
    }

    public function destroy(Purchase $purchase)
    {
        DB::transaction(function () use ($purchase) {
            $purchase->items()->delete();
            $purchase->delete();
        });

        return redirect()->route('purchases.index')->with('success', 'Purchase deleted!');
    }
}
