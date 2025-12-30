<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Category;
use App\Models\Unit;
use App\Models\Product;
use App\Models\Customer;
use App\Models\Sale;
use App\Models\SaleItem;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    // database/seeders/DatabaseSeeder.php

public function run(): void
{
    // 1. Core Data
    $this->call([
        ErpRolePermissionSeeder::class,
        UserSeeder::class,
        CategorySeeder::class,
        UnitSeeder::class,
    ]);

    // 2. Master Data (Dependencies)
    \App\Models\Supplier::factory(10)->create(); // Create these FIRST
    \App\Models\Customer::factory(10)->create();
    \App\Models\Product::factory(20)->create();

    // 3. Transaction Data (Children)
    \App\Models\Purchase::factory(10)->create(); // Now this will find suppliers
    \App\Models\Sale::factory(10)->create();
}
}
