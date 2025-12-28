<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Artisan;

class ErpRolePermissionSeeder extends Seeder
{
    public function run(): void
    {
        // VERY IMPORTANT: clear cached permissions
        Artisan::call('permission:cache-reset');

        // -----------------------------
        // PERMISSIONS
        // -----------------------------
        $permissions = [

            // Products & Stock
            'product.view',
            'product.create',
            'product.update',
            'product.delete',
            'stock.view',

            // Purchases
            'purchase.view',
            'purchase.create',
            'purchase.update',
            'purchase.delete',

            // Sales
            'sale.view',
            'sale.create',
            'sale.update',
            'sale.delete',

            // Reports
            'report.stock',
            'report.sales',
            'report.purchase',
            'report.profit',

            // Users & Roles
            'user.view',
            'user.create',
            'user.update',
            'user.delete',
            'role.manage',
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate([
                'name' => $permission,
                'guard_name' => 'web',
            ]);
        }

        // -----------------------------
        // ROLES
        // -----------------------------
        $admin = Role::firstOrCreate([
            'name' => 'Admin',
            'guard_name' => 'web',
        ]);

        $manager = Role::firstOrCreate([
            'name' => 'Manager',
            'guard_name' => 'web',
        ]);

        $storekeeper = Role::firstOrCreate([
            'name' => 'Storekeeper',
            'guard_name' => 'web',
        ]);

        $sales = Role::firstOrCreate([
            'name' => 'Sales',
            'guard_name' => 'web',
        ]);

        $accountant = Role::firstOrCreate([
            'name' => 'Accountant',
            'guard_name' => 'web',
        ]);

        // -----------------------------
        // ASSIGN PERMISSIONS TO ROLES
        // -----------------------------

        // Admin → everything
        $admin->syncPermissions(Permission::all());

        // Manager
        $manager->syncPermissions([
            'product.view',
            'product.create',
            'product.update',
            'stock.view',

            'purchase.view',
            'purchase.create',
            'purchase.update',

            'sale.view',
            'sale.create',
            'sale.update',

            'report.stock',
            'report.sales',
            'report.purchase',
        ]);

        // Storekeeper
        $storekeeper->syncPermissions([
            'product.view',
            'stock.view',
        ]);

        // Sales
        $sales->syncPermissions([
            'product.view',
            'sale.view',
            'sale.create',
        ]);

        // Accountant
        $accountant->syncPermissions([
            'report.stock',
            'report.sales',
            'report.purchase',
            'report.profit',
        ]);
    }
}
