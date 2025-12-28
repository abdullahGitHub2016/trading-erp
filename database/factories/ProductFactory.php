<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->word(),
            'sku' => $this->faker->unique()->bothify('PROD-####'), // matches your unique sku constraint
            'category_id' => \App\Models\Category::factory(),
            'unit_id' => \App\Models\Unit::factory(),
            'purchase_price' => $this->faker->randomFloat(2, 5, 100), // matches decimal(10,2)
            'sale_price' => $this->faker->randomFloat(2, 10, 200),     // matches decimal(10,2)
        ];
    }
}
