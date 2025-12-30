<?php

namespace Database\Seeders;

use App\Models\Unit;
use Illuminate\Database\Seeder;

class UnitSeeder extends Seeder
{
    public function run(): void
    {
        $units = [
            ['name' => 'Piece', 'short_name' => 'PCS'],
            ['name' => 'Kilogram', 'short_name' => 'KG'],
            ['name' => 'Gram', 'short_name' => 'G'],
            ['name' => 'Litre', 'short_name' => 'L'],
            ['name' => 'Box', 'short_name' => 'BX'],
            ['name' => 'Meter', 'short_name' => 'M'],
        ];

        foreach ($units as $unit) {
            // updateOrCreate prevents duplicate errors if you run it twice
            Unit::updateOrCreate(
                ['short_name' => $unit['short_name']], 
                ['name' => $unit['name']]
            );
        }
    }
}