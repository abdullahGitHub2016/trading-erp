<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        $user = User::updateOrCreate(
            ['email' => 'demo@localhost.com'],
            [
                'name' => 'Admin User',
                'password' => bcrypt('demodemo'),
                'email_verified_at' => now(),
            ]
        );

        $user->assignRole('Admin');
    }
}
