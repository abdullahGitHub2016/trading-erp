<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;


class UnitFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            // Uses unique() to prevent duplicate unit names during seeding
            'name' => $this->faker->unique()->randomElement([
                'pcs',    // Pieces
                'kg',     // Kilograms
                'g',      // Grams
                'box',    // Box
                'pkt',    // Packet
                'mtr',    // Meter
                'ltr',    // Liter
                'dz',     // Dozen
            ]),
        ];
    }
}
