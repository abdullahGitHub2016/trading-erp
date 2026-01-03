<?php

namespace App\Http\Controllers;

use App\Models\ChartOfAccount;
use App\Models\Journal;
use App\Models\Ledger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class AccountingController extends Controller
{
    // ==========================================
    // 1. CHART OF ACCOUNTS
    // ==========================================

    public function indexCOA()
    {
        return Inertia::render('Accounting/ChartOfAccounts/Index', [
            'accounts' => ChartOfAccount::orderBy('code')->get()
        ]);
    }

    public function storeCOA(Request $request)
    {
        $request->validate([
            'code' => 'required|unique:chart_of_accounts,code',
            'name' => 'required|string|max:255',
            'type' => 'required|in:Asset,Liability,Equity,Revenue,Expense',
        ]);

        ChartOfAccount::create($request->all());

        return back()->with('success', 'New account added to Chart of Accounts.');
    }

    // ==========================================
    // 2. JOURNAL VOUCHERS (Manual Entries)
    // ==========================================

    public function indexJournal()
    {
        return Inertia::render('Accounting/Journals/Index', [
            'journals' => Journal::with('ledgers.account')->orderBy('date', 'desc')->paginate(10)
        ]);
    }

    public function createJournal()
    {
        return Inertia::render('Accounting/Journals/Create', [
            'accounts' => ChartOfAccount::orderBy('code')->get()
        ]);
    }

    public function storeJournal(Request $request)
    {
        $request->validate([
            'date' => 'required|date',
            'description' => 'required|string',
            'items' => 'required|array|min:2', // At least one Debit and one Credit
            'items.*.chart_of_account_id' => 'required|exists:chart_of_accounts,id',
        ]);

        // ERP Logic: Total Debits must equal Total Credits
        $totalDebit = collect($request->items)->sum('debit');
        $totalCredit = collect($request->items)->sum('credit');

        if (abs($totalDebit - $totalCredit) > 0.001) {
            return back()->withErrors(['items' => 'The journal is not balanced. Total Debits must equal Total Credits.']);
        }

        return DB::transaction(function () use ($request) {
            $journal = Journal::create([
                'date' => $request->date,
                'reference_no' => 'JV-' . strtoupper(uniqid()),
                'description' => $request->description,
            ]);

            foreach ($request->items as $item) {
                Ledger::create([
                    'journal_id' => $journal->id,
                    'chart_of_account_id' => $item['chart_of_account_id'],
                    'transaction_date' => $request->date,
                    'debit' => $item['debit'] ?? 0,
                    'credit' => $item['credit'] ?? 0,
                    'description' => $request->description,
                ]);
            }

            return redirect('/accounting/journals')->with('success', 'Journal Voucher posted successfully.');
        });
    }

    // ==========================================
    // 3. GENERAL LEDGER (Account Statement)
    // ==========================================

    public function showLedger($id, Request $request)
    {
        $account = ChartOfAccount::findOrFail($id);

        $query = Ledger::where('chart_of_account_id', $id)
            ->with('journal')
            ->orderBy('transaction_date', 'asc');

        // Optional: Filter by date range
        if ($request->start_date && $request->end_date) {
            $query->whereBetween('transaction_date', [$request->start_date, $request->end_date]);
        }

        $entries = $query->get();

        return Inertia::render('Accounting/Ledger/Show', [
            'account' => $account,
            'entries' => $entries,
            'filters' => $request->only(['start_date', 'end_date'])
        ]);
    }
}
