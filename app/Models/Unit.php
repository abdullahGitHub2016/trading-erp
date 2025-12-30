<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory; // 1. Import the trait

class Unit extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'short_name'];

    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }
}
