<?php

namespace Database\Seeders;

use App\Models\Purchase;
use App\Models\PurchaseItem;
use App\Models\Supplier;
use App\Models\Product;
use Illuminate\Database\Seeder;

class PurchaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Create 5 Purchases
        Purchase::factory(5)->create()->each(function ($purchase) {

            // 2. For each Purchase, create 3-5 random items
            $items = PurchaseItem::factory(rand(3, 5))->create([
                'purchase_id' => $purchase->id,
                'product_id' => Product::inRandomOrder()->first()->id ?? Product::factory(),
            ]);

            // 3. Update the Purchase total_amount based on items subtotal
            $purchase->update([
                'total_amount' => $items->sum('subtotal')
            ]);
        });
    }
}
