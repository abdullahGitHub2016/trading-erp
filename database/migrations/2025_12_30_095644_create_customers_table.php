<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();

            // Basic Information
            $table->string('name');
            $table->string('email')->nullable()->unique();
            $table->string('phone')->nullable();
            $table->text('address')->nullable();

            // Financial Tracking (Architectural Standard)
            // opening_balance: Debt they had BEFORE using this ERP
            $table->decimal('opening_balance', 15, 2)->default(0.00);

            // current_balance: Calculated as (Opening + Sales - Payments)
            // Keeping this column helps with fast performance in the UI
            $table->decimal('current_balance', 15, 2)->default(0.00);

            // Status & Metadata
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            // Indexing for faster search in the "Sales" dropdown
            $table->index('name');
            $table->index('phone');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('customers');
    }
};
