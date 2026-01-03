<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChartOfAccount extends Model
{
    use HasFactory;

    protected $table = 'chart_of_accounts'; // Force table name if not pluralized correctly

    protected $fillable = ['code', 'name', 'type'];

    public function ledgers()
    {
        return $this->hasMany(Ledger::class, 'chart_of_account_id');
    }
}
