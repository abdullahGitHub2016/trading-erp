<script setup lang="ts">
import { usePage, Link } from '@inertiajs/vue3';
import { computed, ref } from 'vue';
import {
    LayoutDashboard,
    Package,
    Shield,
    LogOut,
    ChevronLeft,
    ChevronRight
} from 'lucide-vue-next'; //

const page = usePage();
const isExpanded = ref(false); // Default to collapsed

const isAuthenticated = computed(() => !!page.props.auth.user);

const isUrlActive = (path: string) => {
    return window.location.pathname.startsWith(path);
};

</script>

<template>
    <div class="min-h-screen bg-slate-50 flex">
        <aside
            v-if="isAuthenticated"
            :class="[
                isExpanded ? 'w-64' : 'w-20',
                'bg-white border-r min-h-screen transition-all duration-300 flex flex-col'
            ]"
        >
            <div class="h-16 flex items-center justify-between px-4 border-b">
                <div v-if="isExpanded" class="flex items-center gap-2 overflow-hidden whitespace-nowrap">
                    <div class="p-1 bg-blue-600 rounded text-white shrink-0">
                        <Shield class="w-5 h-5" />
                    </div>
                    <span class="font-bold text-slate-900 tracking-tight">TRD<span class="text-blue-600">ERP</span></span>
                </div>
                <div v-else class="mx-auto text-blue-600">
                    <Shield class="w-6 h-6" />
                </div>

                <button @click="isExpanded = !isExpanded" class="p-1 hover:bg-slate-100 rounded-md ml-auto">
                    <ChevronLeft v-if="isExpanded" class="w-4 h-4 text-slate-400" />
                    <ChevronRight v-else class="w-4 h-4 text-slate-400" />
                </button>
            </div>

            <nav class="p-4 space-y-2 flex-1 overflow-hidden">
        <Link href="/dashboard"
            :class="[isUrlActive('/dashboard') ? 'bg-slate-100 text-blue-600' : 'text-slate-700 hover:bg-slate-100', 'flex items-center gap-3 p-2 rounded transition-all group']"
        >
            <LayoutDashboard class="w-5 h-5 shrink-0" />
            <span v-if="isExpanded" class="whitespace-nowrap">Dashboard</span>
        </Link>

        <Link
            v-if="page.props.auth.user.permissions.includes('product.view')"
            href="/products"
            :class="[isUrlActive('/products') ? 'bg-slate-100 text-blue-600' : 'text-slate-700 hover:bg-slate-100', 'flex items-center gap-3 p-2 rounded transition-all group']"
        >
            <Package class="w-5 h-5 shrink-0" />
            <span v-if="isExpanded" class="whitespace-nowrap">Products</span>
        </Link>

        <Link
            v-if="page.props.auth.user.roles.includes('Admin')"
            href="/admin/roles"
            :class="[isUrlActive('/admin/roles') ? 'bg-blue-50 text-blue-600 font-medium' : 'text-slate-700 hover:bg-slate-100', 'flex items-center gap-3 p-2 rounded transition-all group']"
            title="Role Management"
        >
            <Shield class="w-5 h-5 shrink-0" />
            <span v-if="isExpanded" class="whitespace-nowrap">Role Management</span>
        </Link>

    </nav>
        </aside>

        <div class="flex-1 flex flex-col min-w-0">
            <header class="bg-white border-b h-16 flex items-center justify-between px-6 sticky top-0 z-10">
                <div class="flex items-center gap-2">
                    <span v-if="!isAuthenticated" class="text-xl font-bold text-slate-900 tracking-tight">
                        TRD<span class="text-blue-600">ERP</span>
                    </span>
                </div>

                <div v-if="isAuthenticated" class="flex items-center gap-4">
                    <span class="text-sm font-medium text-slate-700">{{ page.props.auth.user.name }}</span>
                    <Link href="/logout" method="post" as="button" class="text-red-500 text-sm flex items-center gap-1 hover:underline">
                        <LogOut class="w-4 h-4" /> Logout
                    </Link>
                </div>
            </header>

            <main class="p-6">
                <slot />
            </main>
        </div>
    </div>
</template>
