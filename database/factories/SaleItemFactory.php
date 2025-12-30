<?php

namespace Database\Factories;

use App\Models\Sale;
use App\Models\Product;
use App\Models\SaleItem;
use Illuminate\Database\Eloquent\Factories\Factory;

class SaleItemFactory extends Factory
{
    protected $model = SaleItem::class;

    public function definition(): array
    {
        // Get a random product to get its real price or simulate one
        $unitPrice = $this->faker->randomFloat(2, 50, 2000);
        $quantity = $this->faker->numberBetween(1, 10);

        return [
            'sale_id' => Sale::factory(), // Creates a parent sale automatically
            'product_id' => Product::factory(), // Creates a product automatically
            'quantity' => $quantity,
            'unit_price' => $unitPrice,
            'item_total' => $unitPrice * $quantity, // Architectural standard: Store the calculated total
        ];
    }
}
