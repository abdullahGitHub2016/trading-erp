<?php

use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\SaleController;

use App\Http\Controllers\SupplierController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;
use App\Http\Controllers\ReportController;





Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::get('dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::resource('products', ProductController::class)->middleware(['auth'])->middleware('permission:product.view');;

/*
Route::middleware(['auth'])->group(function () {

    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');

    // Product Routes with permission checks
    Route::group(['middleware' => ['permission:product.view']], function () {
        Route::get('/products', [ProductController::class, 'index'])->name('products.index');
    });

    Route::group(['middleware' => ['permission:product.create']], function () {
        Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
        Route::post('/products', [ProductController::class, 'store'])->name('products.store');
    });

    Route::group(['middleware' => ['permission:product.update']], function () {
        Route::get('/products/{product}/edit', [ProductController::class, 'edit'])->name('products.edit');
        Route::put('/products/{product}', [ProductController::class, 'update'])->name('products.update');
    });

    Route::group(['middleware' => ['permission:product.delete']], function () {
        Route::delete('/products/{product}', [ProductController::class, 'destroy'])->name('products.destroy');
    });

});

*/



Route::middleware(['auth', 'verified'])->group(function () {
    // Only users with the 'admin' role can access these routes
    Route::middleware(['role:Admin'])->prefix('admin')->group(function () {
        Route::post('/admin/roles/{role}/toggle', [RoleController::class, 'togglePermission'])->name('roles.toggle-permission');
        Route::post('/roles', [RoleController::class, 'store'])->name('roles.store');
        // This handles the GET request to show the page
        Route::get('/roles', [RoleController::class, 'index'])->name('roles.index');

        // THIS IS THE MISSING PIECE: It handles the PUT request to update permissions
        // The {role} parameter must match what you send from the frontend
        Route::put('/roles/{role}', [RoleController::class, 'update'])->name('roles.update');
    });

    // Product Routes
    Route::resource('products', ProductController::class);

    // New Purchase Routes
    Route::resource('purchases', PurchaseController::class);

    // New Supplier Routes
    Route::resource('suppliers', SupplierController::class);

    // New Supplier Routes
    Route::resource('suppliers', SupplierController::class);

    // New Supplier Routes
    Route::resource('sales', SaleController::class);

    // Accounting Reports
    Route::get('/reports/trial-balance', [ReportController::class, 'trialBalance'])->name('reports.trial_balance');
    Route::get('/reports/income-statement', [ReportController::class, 'incomeStatement'])->name('reports.income_statement');
});




require __DIR__ . '/settings.php';
