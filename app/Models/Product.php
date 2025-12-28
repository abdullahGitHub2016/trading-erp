<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory; // 1. Import the trait

class Product extends Model
{
    use HasFactory; // 2. Use the trait inside the class
    protected $fillable = [
        'name',
        'sku',
        'category_id',
        'unit_id',
        'purchase_price',
        'sale_price'
    ];

    // This allows you to do $product->category->name in your Vue frontend
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function unit(): BelongsTo
    {
        return $this->belongsTo(Unit::class);
    }
}
