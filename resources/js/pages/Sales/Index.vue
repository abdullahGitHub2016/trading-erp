<script setup>
import { router } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue'; // Adjust path

defineProps({ sales: Array });

const deleteSale = (id) => {
    if (confirm('Are you sure?')) {
        router.delete(`/sales/${id}`, {
            onSuccess: () => toastr.success('Deleted Successfully')
        });
    }
};
</script>

<template>
    <AuthLayout>
        <div class="container mx-auto p-4">
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold">Sales History</h1>
                <button @click="router.get('/sales/create')" class="bg-blue-500 text-white px-4 py-2 rounded">
                    Create Sale
                </button>
            </div>

            <table class="w-full border">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="p-3 text-left">Invoice</th>
                        <th class="p-3 text-left">Customer</th>
                        <th class="p-3 text-left">Amount</th>
                        <th class="p-3 text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="sale in sales" :key="sale.id" class="border-t">
                        <td class="p-3">{{ sale.invoice_no }}</td>
                        <td class="p-3">{{ sale.customer.name }}</td>
                        <td class="p-3">${{ sale.grand_total }}</td>
                        <td class="p-4 text-center space-x-2">
                            <button @click="router.get(`/sales/${sale.id}/edit`)"
                                class="bg-yellow-500 text-white px-3 py-1 rounded text-sm">
                                Edit
                            </button>
                            <button @click="deleteSale(sale.id)"
                                class="bg-red-500 text-white px-3 py-1 rounded text-sm">
                                Delete
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </AuthLayout>
</template>
