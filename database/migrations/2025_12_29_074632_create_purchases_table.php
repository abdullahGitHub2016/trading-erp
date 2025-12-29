<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
{
    Schema::create('purchases', function (Blueprint $table) {
        $table->id();
        $table->string('purchase_no')->unique(); // e.g., PO-1001
        $table->foreignId('supplier_id')->constrained()->onDelete('cascade');
        $table->date('purchase_date');
        $table->decimal('total_amount', 15, 2);
        $table->enum('status', ['pending', 'received', 'cancelled'])->default('pending');
        $table->foreignId('created_by')->constrained('users');
        $table->text('note')->nullable();
        $table->timestamps();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchases');
    }
};
