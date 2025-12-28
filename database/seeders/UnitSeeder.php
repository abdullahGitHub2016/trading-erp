<?php

namespace Database\Seeders;

use \App\Models\Unit;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
public function run(): void
{
    $units = ['pcs', 'kg', 'box', 'liter'];
    foreach ($units as $name) {
        Unit::create(['name' => $name]);
    }
}
}
