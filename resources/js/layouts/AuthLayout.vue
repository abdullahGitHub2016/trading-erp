<script setup lang="ts">
import { usePage, Link } from '@inertiajs/vue3';
import { computed, ref, watch } from 'vue';
import {
    LayoutDashboard,
    Package,
    Shield,
    Truck,
    LogOut,
    ChevronLeft,
    ChevronRight,
    ShoppingCart,
    ShoppingBag,
    BarChart3,
    Scale
} from 'lucide-vue-next';

import Toast from '@/components/Toast.vue';

// Define flash message types
interface FlashProps {
    message?: string | null;
    success?: string | null;
    error?: string | null;
}

const page = usePage();
const isExpanded = ref(true);

// Toast State
const showToast = ref(false);
const toastMessage = ref('');
const toastType = ref<'success' | 'error'>('success');

// Watch for flash messages from Laravel
watch(
    () => page.props.flash as unknown as FlashProps,
    (flash: FlashProps) => {
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
    setTimeout(() => {
        showToast.value = false;
    }, 3000);
}

const isAuthenticated = computed(() => !!page.props.auth.user);

const isUrlActive = (path: string): boolean => {
    return window.location.pathname.startsWith(path);
};
</script>

<template>
    <div class="min-h-screen bg-slate-50 flex">
        <aside v-if="isAuthenticated" :class="[
            isExpanded ? 'w-64' : 'w-20',
            'bg-white border-r min-h-screen transition-all duration-300 flex flex-col shadow-sm'
        ]">
            <div class="h-16 flex items-center justify-between px-4 border-b text-blue-600">
                <div v-if="isExpanded" class="flex items-center gap-2 overflow-hidden whitespace-nowrap">
                    <div class="p-1 bg-blue-600 rounded text-white shrink-0">
                        <Shield class="w-5 h-5" />
                    </div>
                    <span class="font-bold text-slate-900 tracking-tight">TRD<span
                            class="text-blue-600">ERP</span></span>
                </div>
                <div v-else class="mx-auto">
                    <Shield class="w-6 h-6" />
                </div>

                <button @click="isExpanded = !isExpanded" class="p-1 hover:bg-slate-100 rounded-md">
                    <ChevronLeft v-if="isExpanded" class="w-4 h-4 text-slate-400" />
                    <ChevronRight v-else class="w-4 h-4 text-slate-400" />
                </button>
            </div>

            <nav class="p-4 space-y-1 flex-1 overflow-y-auto">
                <p v-if="isExpanded" class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-2">Main Menu</p>

                <Link href="/dashboard"
                    :class="[isUrlActive('/dashboard') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium group']">
                    <LayoutDashboard class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Dashboard</span>
                </Link>

                <Link v-if="page.props.auth.user.permissions.includes('product.view')" href="/products"
                    :class="[isUrlActive('/products') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium group']">
                    <Package class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Products</span>
                </Link>

                <Link v-if="page.props.auth.user.permissions.includes('purchase.view')" href="/purchases"
                    :class="[isUrlActive('/purchases') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium group']">
                    <ShoppingCart class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Purchases</span>
                </Link>

                <Link v-if="page.props.auth.user.permissions.includes('sale.view')" href="/sales"
                    :class="[isUrlActive('/sales') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium group']">
                    <ShoppingBag class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Sales</span>
                </Link>

                <div class="pt-4">
                    <p v-if="isExpanded" class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-2">Final Accounts</p>

                    <Link href="/reports/trial-balance"
                        :class="[isUrlActive('/reports/trial-balance') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium group']">
                        <Scale class="w-5 h-5 shrink-0 text-slate-400 group-hover:text-blue-600" />
                        <span v-if="isExpanded">Trial Balance</span>
                    </Link>

                    <Link href="/reports/income-statement"
                        :class="[isUrlActive('/reports/income-statement') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium group']">
                        <BarChart3 class="w-5 h-5 shrink-0 text-slate-400 group-hover:text-blue-600" />
                        <span v-if="isExpanded">Profit & Loss</span>
                    </Link>
                </div>

                <div class="pt-4">
                    <p v-if="isExpanded" class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-2">Settings</p>
                    <Link v-if="page.props.auth.user.permissions.includes('role.manage')" href="/admin/roles"
                        :class="[isUrlActive('/admin/roles') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium group']">
                        <Shield class="w-5 h-5 shrink-0" />
                        <span v-if="isExpanded">Roles & Permissions</span>
                    </Link>
                </div>
            </nav>
        </aside>

        <div class="flex-1 flex flex-col min-w-0">
            <header class="bg-white border-b h-16 flex items-center justify-between px-6 sticky top-0 z-10">
                <div class="flex items-center gap-2">
                    <span v-if="!isAuthenticated"
                        class="text-xl font-bold text-slate-900 tracking-tight">TRD<span>ERP</span></span>
                </div>
                <div v-if="isAuthenticated" class="flex items-center gap-4">
                    <span class="text-sm font-medium text-slate-700">{{ page.props.auth.user.name }}</span>
                    <Link href="/logout" method="post" as="button"
                        class="text-red-500 text-sm flex items-center gap-1 hover:underline">
                        <LogOut class="w-4 h-4" /> Logout
                    </Link>
                </div>
            </header>

            <main class="p-6 relative">
                <slot />

                <Transition name="toast">
                    <Toast v-if="showToast" :message="toastMessage" :type="toastType" @close="showToast = false" />
                </Transition>
            </main>
        </div>
    </div>
</template>

<style scoped>
.toast-enter-active,
.toast-leave-active {
    transition: all 0.3s ease;
}

.toast-enter-from {
    opacity: 0;
    transform: translateY(20px);
}

.toast-leave-to {
    opacity: 0;
    transform: scale(0.95);
}
</style>
