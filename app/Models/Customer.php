<?php

namespace App\Models;

use App\Models\Ledger;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function sales() {
        return $this->hasMany(Sale::class);
    }

    public function ledgerEntries() {
        return $this->hasMany(Ledger::class, 'reference_id')->where('reference_type', 'Customer');
    }
}
