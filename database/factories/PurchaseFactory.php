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
    // database/factories/PurchaseFactory.php

public function definition(): array
{
    return [
        'purchase_no'   => 'PO-' . strtoupper($this->faker->bothify('??###')),

        // FIX: Try to get a supplier, or create one if the table is empty
        'supplier_id'   => \App\Models\Supplier::inRandomOrder()->first()?->id
                           ?? \App\Models\Supplier::factory(),

        'purchase_date' => $this->faker->date(),
        'total_amount'  => 0,
        'status'        => 'pending',
        'created_by'    => \App\Models\User::first()?->id ?? \App\Models\User::factory(),
    ];
}
}
