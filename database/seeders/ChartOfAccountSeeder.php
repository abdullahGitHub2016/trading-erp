<?php

namespace Database\Seeders;

use App\Models\ChartOfAccount;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;

class ChartOfAccountSeeder extends Seeder
{
    public function run(): void
    {
        // Standard Accounting Categories for ERP
        $accounts = [
            // --- ASSETS (1000 range) ---
            ['name' => 'Cash on Hand', 'code' => '1000', 'type' => 'asset'],
            ['name' => 'Bank Account', 'code' => '1010', 'type' => 'asset'],
            ['name' => 'Accounts Receivable', 'code' => '1200', 'type' => 'asset'],
            ['name' => 'Inventory Asset', 'code' => '1300', 'type' => 'asset'],

            // --- LIABILITIES (2000 range) ---
            ['name' => 'Accounts Payable', 'code' => '2000', 'type' => 'liability'],
            ['name' => 'Sales Tax Payable', 'code' => '2100', 'type' => 'liability'],

            // --- EQUITY (3000 range) ---
            ['name' => 'Owner Equity', 'code' => '3000', 'type' => 'equity'],
            ['name' => 'Retained Earnings', 'code' => '3100', 'type' => 'equity'],

            // --- REVENUE (4000 range) ---
            ['name' => 'Sales Revenue', 'code' => '4000', 'type' => 'revenue'],
            ['name' => 'Service Income', 'code' => '4100', 'type' => 'revenue'],

            // --- EXPENSES (5000 range) ---
            ['name' => 'Cost of Goods Sold (COGS)', 'code' => '5000', 'type' => 'expense'],
            ['name' => 'Office Expenses', 'code' => '5100', 'type' => 'expense'],
            ['name' => 'Salary Expense', 'code' => '5200', 'type' => 'expense'],
            ['name' => 'Rent Expense', 'code' => '5300', 'type' => 'expense'],
        ];

        foreach ($accounts as $account) {
            ChartOfAccount::updateOrCreate(
                ['code' => $account['code']], // Unique Identifier
                [
                    'name' => $account['name'],
                    'type' => $account['type']
                ]
            );
        }
    }
}
