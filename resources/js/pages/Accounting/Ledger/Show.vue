<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { ArrowLeft, FileSpreadsheet } from 'lucide-vue-next';

const props = defineProps({ account: Object, entries: Array });

const formatCurrency = (val) => new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(val);

// Calculate Running Balance
let balance = 0;
const entriesWithBalance = props.entries.map(entry => {
    balance += (parseFloat(entry.debit) - parseFloat(entry.credit));
    return { ...entry, running_balance: balance };
});
</script>

<template>
    <Head :title="'Ledger - ' + account.name" />
    <AuthLayout>
        <div class="max-w-6xl mx-auto p-6">
            <Link href="/accounting/chart-of-accounts" class="text-blue-600 font-bold flex items-center gap-2 mb-4">
                <ArrowLeft class="w-4 h-4"/> Back to COA
            </Link>

            <div class="bg-white p-8 rounded-3xl shadow-sm border border-slate-100 mb-8">
                <div class="flex justify-between items-end">
                    <div>
                        <h1 class="text-3xl font-black text-slate-900">{{ account.name }}</h1>
                        <p class="text-slate-400 font-bold uppercase tracking-widest text-sm">{{ account.code }} • {{ account.type }}</p>
                    </div>
                    <div class="text-right">
                        <p class="text-xs font-black text-slate-400 uppercase">Current Balance</p>
                        <p class="text-4xl font-black text-blue-600">{{ formatCurrency(balance) }}</p>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-3xl border border-slate-100 overflow-hidden shadow-sm">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="p-5 text-xs font-black uppercase text-slate-400">Date</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400">Description</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 text-right">Debit</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 text-right">Credit</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 text-right">Balance</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-50">
                        <tr v-for="entry in entriesWithBalance" :key="entry.id">
                            <td class="p-5 text-slate-500 font-medium">{{ entry.transaction_date }}</td>
                            <td class="p-5 font-bold text-slate-700">
                                {{ entry.description }}
                                <div class="text-[10px] text-blue-500 uppercase">{{ entry.journal?.reference_no }}</div>
                            </td>
                            <td class="p-5 text-right font-mono text-blue-600 font-bold">{{ entry.debit > 0 ? formatCurrency(entry.debit) : '-' }}</td>
                            <td class="p-5 text-right font-mono text-emerald-600 font-bold">{{ entry.credit > 0 ? formatCurrency(entry.credit) : '-' }}</td>
                            <td class="p-5 text-right font-mono font-black text-slate-900">{{ formatCurrency(entry.running_balance) }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </AuthLayout>
</template>
