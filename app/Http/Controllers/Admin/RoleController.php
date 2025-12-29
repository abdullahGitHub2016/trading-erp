<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;
use Inertia\Inertia;

class RoleController extends Controller
{
    // app/Http/Controllers/Admin/RoleController.php
    public function index()
    {
        $allPermissions = \Spatie\Permission\Models\Permission::all();

        // Group permissions by the prefix (e.g., "product", "sale")
        $groupedPermissions = $allPermissions->groupBy(function ($perm) {
            return explode('.', $perm->name)[0];
        });

        return Inertia::render('Admin/Roles/Index', [
            'roles' => \Spatie\Permission\Models\Role::with('permissions')->get(),
            'groupedPermissions' => $groupedPermissions,
        ]);
    }
    public function togglePermission(Request $request, Role $role)
    {
        if ($request->assign) {
            $role->givePermissionTo($request->permission);
        } else {
            $role->revokePermissionTo($request->permission);
        }

        return back();
    }
    public function store(Request $request)
    {
        $request->validate(['name' => 'required|unique:roles,name']);
        Role::create(['name' => $request->name]);
        return back();
    }

    // app/Http/Controllers/Admin/RoleController.php

    public function update(Request $request, $id)
    {
        $role = Role::findOrFail($id);

        // Spatie handles the sync automatically
        $role->syncPermissions($request->permissions);

        // Force clear the cache so the change is immediate
        app()->make(\Spatie\Permission\PermissionRegistrar::class)->forgetCachedPermissions();

        return back();
    }
}
