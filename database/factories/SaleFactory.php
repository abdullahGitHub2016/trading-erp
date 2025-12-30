<?php

namespace Database\Factories;

use App\Models\Customer;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Sale>
 */
class SaleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
{
    return [
        'invoice_no' => 'INV-' . $this->faker->unique()->numberBetween(1000, 9999),
        'customer_id' => \App\Models\Customer::pluck('id')->random(),
        // This ensures the user exists:
        'user_id' => \App\Models\User::first()?->id ?? \App\Models\User::factory(),
        'sale_date' => now(),
        'subtotal' => 1000,
        'grand_total' => 1000,
        'paid_amount' => 1000,
    ];
}
}
