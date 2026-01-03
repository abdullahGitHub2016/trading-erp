<script setup>
import { computed } from 'vue';
import { Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';

const props = defineProps({ accounts: Array });

const totals = computed(() => {
    return props.accounts.reduce((acc, account) => {
        const ledger = account.ledgers[0] || { total_debit: 0, total_credit: 0 };
        acc.debit += parseFloat(ledger.total_debit || 0);
        acc.credit += parseFloat(ledger.total_credit || 0);
        return acc;
    }, { debit: 0, credit: 0 });
});

const formatCurrency = (val) => new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(val);
</script>

<template>
    <Head title="Trial Balance" />
    <AuthLayout>
        <div class="max-w-5xl mx-auto p-6">
            <h1 class="text-2xl font-bold mb-6">Trial Balance</h1>
            <div class="bg-white shadow rounded-lg overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-gray-50 border-b">
                        <tr>
                            <th class="p-4">Account</th>
                            <th class="p-4 text-right">Debit</th>
                            <th class="p-4 text-right">Credit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="acc in accounts" :key="acc.id" class="border-b">
                            <td class="p-4">{{ acc.name }} ({{ acc.type }})</td>
                            <td class="p-4 text-right text-blue-600">{{ formatCurrency(acc.ledgers[0]?.total_debit || 0) }}</td>
                            <td class="p-4 text-right text-green-600">{{ formatCurrency(acc.ledgers[0]?.total_credit || 0) }}</td>
                        </tr>
                    </tbody>
                    <tfoot class="bg-gray-800 text-white font-bold">
                        <tr>
                            <td class="p-4">Totals</td>
                            <td class="p-4 text-right">{{ formatCurrency(totals.debit) }}</td>
                            <td class="p-4 text-right">{{ formatCurrency(totals.credit) }}</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </AuthLayout>
</template>
