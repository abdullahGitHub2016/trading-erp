<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Journal extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'reference_no',
        'description',
        'journalable_id',
        'journalable_type',
    ];

    /**
     * Relationship: A Journal has many Ledger entries (Debits and Credits).
     */
    public function ledgers(): HasMany
    {
        return $this->hasMany(Ledger::class);
    }

    /**
     * Relationship: Link this journal to a Sale, Purchase, or Expense.
     * This allows us to call $journal->journalable to see the original invoice.
     */
    public function journalable(): MorphTo
    {
        return $this->morphTo();
    }
}
