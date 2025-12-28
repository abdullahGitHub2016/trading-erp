<script setup lang="ts">
import { usePage, Link } from '@inertiajs/vue3';
import { computed } from 'vue';

const page = usePage();

// Check if the user is logged in
const isAuthenticated = computed(() => !!page.props.auth.user);
</script>

<template>
    <div class="min-h-screen bg-slate-50 flex">

        <aside v-if="isAuthenticated" class="w-64 bg-white border-r min-h-screen">
            <nav class="p-4 space-y-2">
                <Link href="/dashboard" class="block p-2 hover:bg-slate-100 rounded">Dashboard</Link>
                <Link href="/products" class="block p-2 hover:bg-slate-100 rounded">Products</Link>
            </nav>
        </aside>

        <div class="flex-1">
            <header class="bg-white border-b h-16 flex items-center justify-between px-6">
                <div class="flex items-center gap-2">
    <div class="p-1.5 bg-blue-600 rounded-lg text-white">
        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-indigo-600">
  <circle cx="12" cy="12" r="10" />
  <path d="M12 2a14.5 14.5 0 0 0 0 20 14.5 14.5 0 0 0 0-20" />
  <path d="M2 12h20" />
</svg>
    </div>
    <span class="text-xl font-bold text-slate-900 tracking-tight">
        TRD<span class="text-blue-600">ERP</span>
    </span>
</div>

                <div v-if="isAuthenticated" class="flex items-center gap-4">
                    <span class="text-sm font-medium">{{ page.props.auth.user.name }}</span>
                    <Link href="/logout" method="post" as="button" class="text-red-500 text-sm">Logout</Link>
                </div>

                <div v-else class="space-x-4">
                    <Link href="/login" class="text-sm font-medium">Login</Link>
                    <Link href="/register" class="px-4 py-2 bg-blue-600 text-white rounded-md text-sm">Register</Link>
                </div>
            </header>

            <main class="p-6">
                <slot />
            </main>
        </div>
    </div>
</template>
