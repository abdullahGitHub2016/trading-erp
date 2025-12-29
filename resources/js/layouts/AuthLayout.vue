<script setup lang="ts">
import { usePage, Link } from '@inertiajs/vue3';
import { computed, ref, watch } from 'vue';
import {
    LayoutDashboard,
    Package,
    Shield,
    LogOut,
    ChevronLeft,
    ChevronRight,
    AlertTriangle,
    X
} from 'lucide-vue-next'; //

import { ShoppingCart, ShoppingBag, ReceiptText } from 'lucide-vue-next';

import Toast from '@/components/Toast.vue';

// Define all possible keys that might come from Laravel
interface FlashProps {
    message?: string | null;
    success?: string | null;
    error?: string | null;
}

const page = usePage();
const isExpanded = ref(true); // Default to collapsed

const showToast = ref(false);
const toastMessage = ref('');
const toastType = ref('success'); // 'success' or 'error'

// Watch for changes in the Inertia flash property
watch(
    // Cast the page props to our interface so TS knows 'success' exists
    () => page.props.flash as unknown as FlashProps,
    (flash: FlashProps) => {
        // Now TS will allow flash.success
        const messageToShow = flash.success || flash.message;

        if (messageToShow) {
            toastMessage.value = messageToShow;
            toastType.value = 'success';
            triggerToast();
        } else if (flash.error) {
            toastMessage.value = flash.error;
            toastType.value = 'error';
            triggerToast();
        }
    },
    { deep: true, immediate: true }
);

function triggerToast() {
    showToast.value = true;
    // Automatically hide after 3 seconds
    setTimeout(() => {
        showToast.value = false;
    }, 3000);
}


defineProps({
    show: Boolean,
    title: { type: String, default: 'Confirm Deletion' },
    message: { type: String, default: 'Are you sure you want to delete this item? This action cannot be undone.' }
});

defineEmits(['close', 'confirm']);

const isAuthenticated = computed(() => !!page.props.auth.user);

const isUrlActive = (path: string) => {
    return window.location.pathname.startsWith(path);
};
// Dynamic Breadcrumbs based on the URL
const breadcrumbs = computed(() => {
    const paths = window.location.pathname.split('/').filter(p => p && p !== 'admin');
    return paths.map((path, index) => ({
        name: path.charAt(0).toUpperCase() + path.slice(1),
        href: '/' + paths.slice(0, index + 1).join('/')
    }));
});
</script>


<template>
    <div class="min-h-screen bg-slate-50 flex">
        <Toast />
        <aside v-if="isAuthenticated" :class="[
            isExpanded ? 'w-64' : 'w-20',
            'bg-white border-r min-h-screen transition-all duration-300 flex flex-col'
        ]">
            <div class="h-16 flex items-center justify-between px-4 border-b">
                <div v-if="isExpanded" class="flex items-center gap-2 overflow-hidden whitespace-nowrap">
                    <div class="p-1 bg-blue-600 rounded text-white shrink-0">
                        <Shield class="w-5 h-5" />
                    </div>
                    <span class="font-bold text-slate-900 tracking-tight">TRD<span
                            class="text-blue-600">ERP</span></span>
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
                    :class="[isUrlActive('/dashboard') ? 'bg-slate-100 text-blue-600' : 'text-slate-700 hover:bg-slate-100', 'flex items-center gap-3 p-2 rounded transition-all group']">
                    <LayoutDashboard class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded" class="whitespace-nowrap">Dashboard</span>
                </Link>

                <Link v-if="page.props.auth.user.permissions.includes('product.view')" href="/products"
                    :class="[isUrlActive('/products') ? 'bg-slate-100 text-blue-600' : 'text-slate-700 hover:bg-slate-100', 'flex items-center gap-3 p-2 rounded transition-all group']">
                    <Package class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded" class="whitespace-nowrap">Products</span>
                </Link>
                <Link v-if="page.props.auth.user.permissions.includes('purchase.view')" href="/purchases"
                    :class="[isUrlActive('/purchases') ? 'bg-slate-100 text-blue-600' : 'text-slate-700 hover:bg-slate-100', 'flex items-center gap-3 p-2 rounded transition-all group']">

                    <ShoppingCart class="w-5 h-5 shrink-0" />

                    <span v-if="isExpanded" class="whitespace-nowrap">Purchases</span>
                </Link>

                <Link v-if="page.props.auth.user.roles.includes('Admin')" href="/admin/roles"
                    :class="[isUrlActive('/admin/roles') ? 'bg-blue-50 text-blue-600 font-medium' : 'text-slate-700 hover:bg-slate-100', 'flex items-center gap-3 p-2 rounded transition-all group']"
                    title="Role Management">
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
                    <Link href="/logout" method="post" as="button"
                        class="text-red-500 text-sm flex items-center gap-1 hover:underline">
                        <LogOut class="w-4 h-4" /> Logout
                    </Link>
                </div>
            </header>

            <main class="p-6">
                <nav class="flex items-center space-x-2 text-xs font-bold text-slate-400 mb-6 uppercase tracking-wider">
                    <Link href="/dashboard" class="hover:text-blue-600">Dashboard</Link>
                    <span v-if="page.url.startsWith('/products')">
                        <span class="mx-2">/</span>
                        <span class="text-slate-900">Products</span>
                    </span>
                </nav>
                <slot />
                <Transition name="fade">
                    <Toast v-if="showToast" :message="toastMessage" :type="toastType" @close="showToast = false" />
                </Transition>
            </main>
        </div>
    </div>
</template>
