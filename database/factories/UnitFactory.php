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
        'name' => $this->faker->unique()->word(),
        // Use unique() modifier before the generator
        'short_name' => $this->faker->unique()->bothify('??-###'), // Generates unique like "PK-123"
    ];
}
}
