<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Category;
use App\Models\Unit;
use App\Models\Product;


class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
public function run(): void
{
    $categories = Category::all();
    $units = Unit::all();

    Product::create([
        'name' => 'Sample Product',
        'sku' => 'PROD-001',
        'category_id' => $categories->random()->id,
        'unit_id' => $units->random()->id,
        'purchase_price' => 100.00,
        'sale_price' => 150.00,
    ]);
}
}
