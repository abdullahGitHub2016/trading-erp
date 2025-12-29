<?php

namespace Database\Factories;

use App\Models\Supplier;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Purchase>
 */
class PurchaseFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'purchase_no'   => 'PO-' . strtoupper($this->faker->bothify('??###')),
            'supplier_id'   => \App\Models\Supplier::inRandomOrder()->first()->id, // Pick from existing
            'purchase_date' => $this->faker->date(),
            'total_amount'  => 0, // Will be calculated by items
            'status'        => 'pending',
            'created_by'    => 1, // Usually the admin ID
        ];
    }
}
