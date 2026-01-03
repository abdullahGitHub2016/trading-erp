<script setup>
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Head } from '@inertiajs/vue3';

defineProps({ revenue: Number, expenses: Number, net_profit: Number });
const formatCurrency = (val) => new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(val);
</script>

<template>
    <Head title="Income Statement" />
    <AuthLayout>
        <div class="max-w-4xl mx-auto p-8 bg-white shadow-lg rounded-xl mt-10">
            <h1 class="text-center text-3xl font-black mb-10 uppercase tracking-tighter">Profit & Loss</h1>

            <div class="space-y-4">
                <div class="flex justify-between text-xl border-b pb-2">
                    <span class="font-bold text-gray-600">Total Revenue</span>
                    <span class="text-green-600 font-mono">{{ formatCurrency(revenue) }}</span>
                </div>

                <div class="flex justify-between text-xl border-b pb-2">
                    <span class="font-bold text-gray-600">Total Operating Expenses</span>
                    <span class="text-red-500 font-mono">({{ formatCurrency(expenses) }})</span>
                </div>

                <div class="flex justify-between items-center bg-gray-900 text-white p-6 rounded-lg mt-8">
                    <span class="text-2xl font-bold">NET PROFIT</span>
                    <span class="text-3xl font-black" :class="net_profit >= 0 ? 'text-green-400' : 'text-red-400'">
                        {{ formatCurrency(net_profit) }}
                    </span>
                </div>
            </div>
        </div>
    </AuthLayout>
</template>
