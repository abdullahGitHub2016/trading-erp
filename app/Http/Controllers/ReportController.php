<?php

namespace App\Http\Controllers;

use App\Models\Ledger;
use App\Models\ChartOfAccount;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{
    /**
     * Trial Balance: Ensures Total Debits = Total Credits
     */
    public function trialBalance()
{
    // Sum debits and credits for each account
    $accounts = ChartOfAccount::with(['ledgers' => function($query) {
        $query->select('chart_of_account_id',
            DB::raw('SUM(debit) as total_debit'),
            DB::raw('SUM(credit) as total_credit'))
            ->groupBy('chart_of_account_id');
    }])->get();

    return Inertia::render('Reports/TrialBalance', [
        'accounts' => $accounts
    ]);
}

    /**
     * Profit & Loss (Income Statement): Revenue - Expenses
     */
    public function incomeStatement()
    {
        // 1. Fetch Revenue Accounts (e.g., ID 9)
        $revenue = Ledger::whereHas('account', function($q) {
            $q->where('type', 'Revenue');
        })->sum('credit') - Ledger::whereHas('account', function($q) {
            $q->where('type', 'Revenue');
        })->sum('debit');

        // 2. Fetch Expense Accounts
        $expenses = Ledger::whereHas('account', function($q) {
            $q->where('type', 'Expense');
        })->sum('debit') - Ledger::whereHas('account', function($q) {
            $q->where('type', 'Expense');
        })->sum('credit');

        return Inertia::render('Reports/IncomeStatement', [
            'revenue' => $revenue,
            'expenses' => $expenses,
            'net_profit' => $revenue - $expenses
        ]);
    }
}
