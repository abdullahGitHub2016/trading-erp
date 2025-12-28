<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@example.com',
        ]);

        // 1. Create specific categories and units first
        $categories = \App\Models\Category::factory()->count(10)->create();
        $units = \App\Models\Unit::factory()->count(4)->create();

        // 2. Create 50 products using those existing categories/units
        \App\Models\Product::factory()->count(50)->create([
            'category_id' => fn() => $categories->random()->id,
            'unit_id' => fn() => $units->random()->id,
        ]);
    }
}
