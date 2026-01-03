<script setup lang="ts">
import { ref } from 'vue';
import { Head, Link, router } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import {
    Plus, Pencil, Trash2, AlertCircle,
    CheckCircle2, Clock, XCircle
} from 'lucide-vue-next';

interface Purchase {
    id: number;
    purchase_no: string;
    supplier?: { name: string };
    purchase_date: string;
    total_amount: number;
    status: 'pending' | 'received' | 'cancelled';
}

const props = defineProps<{
    purchases: {
        data: Purchase[];
        links: Array<{
            url: string | null;
            label: string;
            active: boolean;
        }>;
    }
}>();

// --- Delete Modal State ---
const isDeleteModalOpen = ref(false);
const itemToDelete = ref<number | null>(null);

const openDeleteModal = (id: number) => {
    itemToDelete.value = id;
    isDeleteModalOpen.value = true;
};

const closeDeleteModal = () => {
    isDeleteModalOpen.value = false;
    itemToDelete.value = null;
};

const confirmDelete = () => {
    if (itemToDelete.value) {
        // Using string path to avoid Ziggy helper issues
        router.delete(`/purchases/${itemToDelete.value}`, {
            onSuccess: () => closeDeleteModal(),
        });
    }
};

// --- Helpers ---
const getStatusStyle = (status: string) => {
    switch (status) {
        case 'received': return 'bg-emerald-50 text-emerald-700 border-emerald-100';
        case 'pending': return 'bg-amber-50 text-amber-700 border-amber-100';
        case 'cancelled': return 'bg-red-50 text-red-700 border-red-100';
        default: return 'bg-slate-50 text-slate-700 border-slate-100';
    }
};

const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(value);
};
</script>

<template>
    <Head title="Purchase Orders" />
    <AuthLayout>
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-8">
            <div>
                <h1 class="text-2xl font-bold text-slate-900 tracking-tight">Purchase Management</h1>
                <p class="text-slate-500 text-sm">Track inventory intake and supplier payments.</p>
            </div>

            <div class="flex items-center gap-3">
                <Link
                    v-if="$page.props.auth?.user?.permissions?.includes('purchase.create')"
                    href="/purchases/create"
                    class="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-5 py-2.5 rounded-xl font-bold transition shadow-lg shadow-blue-200"
                >
                    <Plus class="w-4 h-4" /> Create Purchase
                </Link>
            </div>
        </div>

        <div class="bg-white border border-slate-200 rounded-2xl overflow-hidden shadow-sm">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-slate-50 border-b border-slate-200 text-[11px] uppercase font-black text-slate-500 tracking-widest">
                        <th class="p-4 w-48">PO Number</th>
                        <th class="p-4">Supplier</th>
                        <th class="p-4">Date</th>
                        <th class="p-4 text-right">Total Amount</th>
                        <th class="p-4 text-center">Status</th>
                        <th class="p-4 text-right">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                    <tr v-for="purchase in purchases.data" :key="purchase.id" class="hover:bg-slate-50/50 transition-colors">
                        <td class="p-4 font-bold text-blue-600">{{ purchase.purchase_no }}</td>
                        <td class="p-4">
                            <div class="font-semibold text-slate-800">{{ purchase.supplier?.name || 'Unknown' }}</div>
                        </td>
                        <td class="p-4 text-slate-500 text-sm italic">
                            {{ purchase.purchase_date }}
                        </td>
                        <td class="p-4 text-right font-black text-slate-900">
                            {{ formatCurrency(purchase.total_amount) }}
                        </td>
                        <td class="p-4">
                            <span :class="[getStatusStyle(purchase.status), 'mx-auto flex items-center justify-center gap-1.5 w-max px-3 py-1 border rounded-full text-[10px] font-black uppercase tracking-tight']">
                                <Clock v-if="purchase.status === 'pending'" class="w-3 h-3" />
                                <CheckCircle2 v-if="purchase.status === 'received'" class="w-3 h-3" />
                                <XCircle v-if="purchase.status === 'cancelled'" class="w-3 h-3" />
                                {{ purchase.status }}
                            </span>
                        </td>
                        <td class="p-4">
                            <div class="flex items-center justify-end gap-1">
                                <Link :href="`/purchases/${purchase.id}/edit`" class="p-2 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition">
                                    <Pencil class="w-4 h-4" />
                                </Link>
                                <button
                                    @click="openDeleteModal(purchase.id)"
                                    class="p-2 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition"
                                >
                                    <Trash2 class="w-4 h-4" />
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr v-if="purchases.data.length === 0">
                        <td colspan="6" class="p-12 text-center text-slate-400">
                            No purchases found. Click "Create Purchase" to start.
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="mt-6 flex justify-center items-center gap-1">
            <template v-for="(link, k) in purchases.links" :key="k">
                <span
                    v-if="link.url === null"
                    v-html="link.label"
                    class="px-4 py-2 text-sm text-slate-400 border border-slate-100 rounded-lg cursor-not-allowed"
                ></span>
                <Link
                    v-else
                    :href="link.url"
                    v-html="link.label"
                    class="px-4 py-2 text-sm rounded-lg border transition-colors"
                    :class="link.active
                        ? 'bg-blue-600 text-white border-blue-600 font-bold'
                        : 'bg-white text-slate-600 border-slate-200 hover:bg-slate-50'"
                />
            </template>
        </div>

        <div v-if="isDeleteModalOpen" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm">
            <div class="bg-white rounded-3xl max-w-md w-full p-8 shadow-2xl">
                <div class="w-16 h-16 bg-red-100 text-red-600 rounded-full flex items-center justify-center mb-6 mx-auto">
                    <AlertCircle class="w-8 h-8" />
                </div>
                <h3 class="text-xl font-bold text-center text-slate-900 mb-2">Delete Purchase?</h3>
                <p class="text-center text-slate-500 mb-8">
                    Are you sure you want to delete purchase <span class="font-bold">#{{ itemToDelete }}</span>?
                </p>

                <div class="grid grid-cols-2 gap-3">
                    <button @click="closeDeleteModal" class="px-6 py-3 bg-slate-100 text-slate-600 rounded-xl font-bold">Cancel</button>
                    <button @click="confirmDelete" class="px-6 py-3 bg-red-600 text-white rounded-xl font-bold">Delete</button>
                </div>
            </div>
        </div>
    </AuthLayout>
</template>
