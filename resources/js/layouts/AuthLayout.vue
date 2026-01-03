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
    BookText,
    ListTree,
    Scale,
    BarChart3,
    LibraryBig
} from 'lucide-vue-next';

import Toast from '@/components/Toast.vue';

interface FlashProps {
    message?: string | null;
    success?: string | null;
    error?: string | null;
}

const page = usePage();
const isExpanded = ref(true);

const showToast = ref(false);
const toastMessage = ref('');
const toastType = ref<'success' | 'error'>('success');

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
    setTimeout(() => { showToast.value = false; }, 3000);
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
                    <span class="font-bold text-slate-900 tracking-tight uppercase">TRD<span class="text-blue-600">ERP</span></span>
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
                <p v-if="isExpanded" class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-2">Main Operations</p>

                <Link href="/dashboard" :class="[isUrlActive('/dashboard') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                    <LayoutDashboard class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Dashboard</span>
                </Link>

                <Link v-if="page.props.auth.user.permissions.includes('product.view')" href="/products" :class="[isUrlActive('/products') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                    <Package class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Products</span>
                </Link>

                <Link v-if="page.props.auth.user.permissions.includes('purchase.view')" href="/purchases" :class="[isUrlActive('/purchases') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                    <ShoppingCart class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Purchases</span>
                </Link>

                <Link v-if="page.props.auth.user.permissions.includes('sale.view')" href="/sales" :class="[isUrlActive('/sales') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                    <ShoppingBag class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Sales</span>
                </Link>

                <div class="pt-4">
                    <p v-if="isExpanded" class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-2">Bookkeeping</p>

                    <Link href="/accounting/chart-of-accounts" :class="[isUrlActive('/accounting/chart-of-accounts') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                        <ListTree class="w-5 h-5 shrink-0" />
                        <span v-if="isExpanded">Chart of Accounts</span>
                    </Link>

                    <Link href="/accounting/journals" :class="[isUrlActive('/accounting/journals') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                        <BookText class="w-5 h-5 shrink-0" />
                        <span v-if="isExpanded">Journal Vouchers</span>
                    </Link>

                    <Link href="/accounting/ledger" :class="[isUrlActive('/accounting/ledger') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                        <LibraryBig class="w-5 h-5 shrink-0" />
                        <span v-if="isExpanded">General Ledger</span>
                    </Link>
                </div>

                <div class="pt-4">
                    <p v-if="isExpanded" class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-2">Reports</p>

                    <Link href="/reports/trial-balance" :class="[isUrlActive('/reports/trial-balance') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                        <Scale class="w-5 h-5 shrink-0" />
                        <span v-if="isExpanded">Trial Balance</span>
                    </Link>

                    <Link href="/reports/income-statement" :class="[isUrlActive('/reports/income-statement') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                        <BarChart3 class="w-5 h-5 shrink-0" />
                        <span v-if="isExpanded">Profit & Loss</span>
                    </Link>
                </div>

                <div v-if="page.props.auth.user.permissions.includes('role.manage')" class="pt-4 border-t mt-4">
                    <p v-if="isExpanded" class="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-2 px-2">System</p>
                    <Link href="/admin/roles" :class="[isUrlActive('/admin/roles') ? 'bg-blue-50 text-blue-700' : 'text-slate-600 hover:bg-slate-50', 'flex items-center gap-3 p-2 rounded-lg transition-all font-medium']">
                        <Shield class="w-5 h-5 shrink-0" />
                        <span v-if="isExpanded">Roles & Permissions</span>
                    </Link>
                </div>
            </nav>

            <div class="p-4 border-t">
                <Link href="/logout" method="post" as="button" class="w-full flex items-center gap-3 p-2 rounded-lg text-red-500 hover:bg-red-50 transition-all font-medium">
                    <LogOut class="w-5 h-5 shrink-0" />
                    <span v-if="isExpanded">Logout</span>
                </Link>
            </div>
        </aside>

        <div class="flex-1 flex flex-col min-w-0">
            <header class="bg-white border-b h-16 flex items-center justify-between px-6 sticky top-0 z-10">
                <div class="flex items-center gap-2">
                    <span class="text-xl font-bold text-slate-900 tracking-tight">TRD<span>ERP</span></span>
                </div>
                <div class="flex items-center gap-4">
                    <span class="text-sm font-medium text-slate-700">{{ page.props.auth.user.name }}</span>
                </div>
            </header>

            <main class="p-8">
                <slot />
                <Transition name="toast">
                    <Toast v-if="showToast" :message="toastMessage" :type="toastType" @close="showToast = false" />
                </Transition>
            </main>
        </div>
    </div>
</template>

<style scoped>
.toast-enter-active, .toast-leave-active { transition: all 0.3s ease; }
.toast-enter-from { opacity: 0; transform: translateY(20px); }
.toast-leave-to { opacity: 0; transform: scale(0.95); }
</style>
