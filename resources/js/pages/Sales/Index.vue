<script setup>
import { router, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';

// DefineProps: 'sales' is now an Object (the Paginator), not an Array
defineProps({
    sales: Object
});

const deleteSale = (id) => {
    if (confirm('Are you sure you want to delete this sale?')) {
        router.delete(`/sales/${id}`);
    }
};
</script>

<template>
    <AuthLayout>
        <div class="container mx-auto p-4">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold text-slate-800">Sales History</h1>
                <button @click="router.get('/sales/create')"
                    class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded shadow transition">
                    + Create Sale
                </button>
            </div>

            <div class="bg-white rounded-lg shadow overflow-hidden">
                <table class="w-full border-collapse">
                    <thead>
                        <tr class="bg-slate-50 border-b">
                            <th class="p-4 text-left font-semibold text-slate-600">Invoice</th>
                            <th class="p-4 text-left font-semibold text-slate-600">Customer</th>
                            <th class="p-4 text-left font-semibold text-slate-600">Amount</th>
                            <th class="p-4 text-center font-semibold text-slate-600">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="sale in sales.data" :key="sale.id" class="border-b hover:bg-slate-50 transition">
                            <td class="p-4 text-slate-700 font-medium">{{ sale.invoice_no }}</td>
                            <td class="p-4 text-slate-600">{{ sale.customer?.name || 'N/A' }}</td>
                            <td class="p-4 text-slate-600">${{ parseFloat(sale.grand_total).toLocaleString() }}</td>
                            <td class="p-4 text-center space-x-2">
                                <button @click="router.get(`/sales/${sale.id}/edit`)"
                                    class="bg-amber-500 hover:bg-amber-600 text-white px-3 py-1 rounded text-sm transition">
                                    Edit
                                </button>
                                <button @click="deleteSale(sale.id)"
                                    class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded text-sm transition">
                                    Delete
                                </button>
                            </td>
                        </tr>
                        <tr v-if="sales.data.length === 0">
                            <td colspan="4" class="p-8 text-center text-slate-500">No sales found.</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div v-if="sales.links.length > 3" class="mt-6 flex flex-wrap justify-center gap-2">
                <template v-for="(link, k) in sales.links" :key="k">
                    <div v-if="link.url === null"
                         class="px-4 py-2 text-slate-400 border border-slate-200 rounded cursor-not-allowed bg-slate-50"
                         v-html="link.label" />

                    <Link v-else
                          :href="link.url"
                          class="px-4 py-2 border rounded transition-colors duration-200"
                          :class="{
                              'bg-blue-600 text-white border-blue-600': link.active,
                              'bg-white text-slate-600 border-slate-200 hover:bg-slate-100': !link.active
                          }"
                          v-html="link.label" />
                </template>
            </div>
        </div>
    </AuthLayout>
</template>
