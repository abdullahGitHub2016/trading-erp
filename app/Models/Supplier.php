<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory; // 1. Import the trait
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory; // 2. Use the trait inside the class

    protected $fillable = [
        'name',
        'email',
        'phone',
        'address'
    ];
}
