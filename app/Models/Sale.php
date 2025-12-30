<?php

namespace App\Models;

use App\Models\Ledger;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Sale extends Model
{
    protected $guarded = [];
    use HasFactory;

    public function items() {
        return $this->hasMany(SaleItem::class);
    }

    public function customer() {
        return $this->belongsTo(Customer::class);
    }

    public function seller() {
        return $this->belongsTo(User::class, 'user_id');
    }

    // This pulls all accounting entries for this specific sale
    public function ledgerEntries() {
        return $this->hasMany(Ledger::class, 'reference_id')->where('reference_type', 'Sale');
    }
}
