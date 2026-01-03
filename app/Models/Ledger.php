<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ledger extends Model
{
    protected $fillable = [
        'journal_id',
        'chart_of_account_id',
        'reference_type',
        'reference_id',
        'debit',
        'credit',
        'transaction_date',
        'description'
    ];

    public function journal() {
        return $this->belongsTo(Journal::class);
    }

    public function account() {
        return $this->belongsTo(ChartOfAccount::class, 'chart_of_account_id');
    }
}
