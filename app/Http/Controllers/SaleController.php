<?php

namespace App\Http\Controllers;

use App\Models\Sale;
use App\Models\SaleItem;
use App\Models\Customer;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class SaleController extends Controller
{
    public function index()
    {
        return Inertia::render('Sales/Index', [
            'sales' => Sale::with('customer')->orderBy('id', 'desc')->get()
        ]);
    }

    public function create()
    {
        return Inertia::render('Sales/Create', [
            'customers' => Customer::select('id', 'name')->get(),
            'products' => Product::select('id', 'name', 'sale_price', 'stock_quantity')->get()
        ]);
    }
public function edit($id)
{
    return Inertia::render('Sales/Edit', [
        'sale' => Sale::with('items.product')->findOrFail($id),
        'customers' => Customer::all(),
        'products' => Product::select('id', 'name', 'sale_price', 'stock_quantity')->get()
    ]);
}

public function update(Request $request, $id)
{
    DB::transaction(function () use ($request, $id) {
        $sale = Sale::findOrFail($id);

        // 1. Restore old stock before deleting old items
        foreach ($sale->items as $oldItem) {
            $product = Product::find($oldItem->product_id);
            if ($product) {
                $product->increment('stock_quantity', $oldItem->quantity);
            }
        }

        // 2. Delete old items
        $sale->items()->delete();

        // 3. Update Sale Header
        $sale->update([
            'customer_id' => $request->customer_id,
            'subtotal'    => $request->total,
            'grand_total' => $request->total,
            'paid_amount' => $request->total,
        ]);

        // 4. Insert new items and reduce new stock
        foreach ($request->items as $item) {
            SaleItem::create([
                'sale_id'    => $sale->id,
                'product_id' => $item['id'],
                'quantity'   => $item['qty'],
                'unit_price' => $item['sale_price'],
                'item_total' => $item['qty'] * $item['sale_price'],
            ]);

            $product = Product::find($item['id']);
            $product->decrement('stock_quantity', $item['qty']);
        }
    });

    return redirect('/sales')->with('success', 'Sale updated successfully!');
}

    public function store(Request $request)
    {
        // Validate to ensure 'total' is not null before it hits the DB
$request->validate([
        'customer_id' => 'required|exists:customers,id',
        'items' => 'required|array|min:1',
        'total' => 'required|numeric',
    ]);

        DB::transaction(function () use ($request) {
            $sale = Sale::create([
                'invoice_no'    => 'INV-' . strtoupper(uniqid()),
                'customer_id'   => $request->customer_id,
                'user_id'       => Auth::id(),
                'sale_date'     => now()->format('Y-m-d'),
                'subtotal'      => $request->total,    // Mapped from 'total' in Vue
                'grand_total'   => $request->total,
                'paid_amount'   => $request->total,
                'due_amount'    => 0,
            ]);

            foreach ($request->items as $item) {
                SaleItem::create([
                    'sale_id'    => $sale->id,
                    'product_id' => $item['id'],
                    'quantity'   => $item['qty'],
                    'unit_price' => $item['sale_price'],
                    'item_total' => $item['qty'] * $item['sale_price'],
                ]);

                // Update stock if column exists
                $product = Product::find($item['id']);
                if ($product && isset($product->stock_quantity)) {
                    $product->decrement('stock_quantity', $item['qty']);
                }
            }
        });

        return redirect('/sales')->with('success', 'Sale created successfully!');
    }

    public function destroy($id)
    {
        Sale::findOrFail($id)->delete();
        return redirect('/sales')->with('success', 'Sale deleted!');
    }
}
