<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { ArrowLeft, Printer, FileText, Calendar, Hash } from 'lucide-vue-next';

const props = defineProps({
    journal: Object
});

const formatCurrency = (val) => {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(val);
};

const printVoucher = () => {
    window.print();
};
</script>

<template>
    <Head :title="'Journal - ' + journal.reference_no" />
    <AuthLayout>
        <div class="max-w-4xl mx-auto p-6">
            <div class="flex justify-between items-center mb-8 no-print">
                <Link href="/accounting/journals" class="text-blue-600 font-bold flex items-center gap-2">
                    <ArrowLeft class="w-4 h-4" /> Back to Journals
                </Link>
                <button @click="printVoucher" class="bg-slate-900 text-white px-6 py-2 rounded-xl font-bold flex items-center gap-2 hover:bg-slate-800 transition">
                    <Printer class="w-4 h-4" /> Print Voucher
                </button>
            </div>

            <div class="bg-white rounded-3xl shadow-xl border border-slate-100 overflow-hidden print:shadow-none print:border-slate-300">
                <div class="bg-slate-50 p-8 border-b border-slate-100 flex justify-between items-start">
                    <div>
                        <h2 class="text-sm font-black text-blue-600 uppercase tracking-widest mb-1">Journal Voucher</h2>
                        <h1 class="text-3xl font-black text-slate-900">{{ journal.reference_no }}</h1>
                    </div>
                    <div class="text-right space-y-1">
                        <div class="flex items-center justify-end gap-2 text-slate-500 font-bold">
                            <Calendar class="w-4 h-4" /> {{ journal.date }}
                        </div>
                        <div class="text-xs font-black text-slate-400 uppercase">Status: Posted</div>
                    </div>
                </div>

                <div class="p-8 border-b border-slate-50">
                    <p class="text-xs font-black text-slate-400 uppercase mb-2">Description / Narration</p>
                    <p class="text-lg text-slate-700 font-medium italic">"{{ journal.description }}"</p>
                </div>

                <div class="p-0">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-slate-50/50 text-xs font-black text-slate-400 uppercase tracking-widest">
                                <th class="p-6">Account Details</th>
                                <th class="p-6 text-right">Debit</th>
                                <th class="p-6 text-right">Credit</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <tr v-for="ledger in journal.ledgers" :key="ledger.id">
                                <td class="p-6">
                                    <div class="font-bold text-slate-800">{{ ledger.account.name }}</div>
                                    <div class="text-xs text-slate-400 font-mono">{{ ledger.account.code }}</div>
                                </td>
                                <td class="p-6 text-right font-mono font-bold text-blue-600">
                                    {{ ledger.debit > 0 ? formatCurrency(ledger.debit) : '-' }}
                                </td>
                                <td class="p-6 text-right font-mono font-bold text-emerald-600">
                                    {{ ledger.credit > 0 ? formatCurrency(ledger.credit) : '-' }}
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="bg-slate-900 text-white">
                            <tr>
                                <td class="p-6 text-sm font-black uppercase tracking-widest">Voucher Total</td>
                                <td class="p-6 text-right font-mono text-xl font-black">
                                    {{ formatCurrency(journal.ledgers.reduce((sum, l) => sum + parseFloat(l.debit), 0)) }}
                                </td>
                                <td class="p-6 text-right font-mono text-xl font-black">
                                    {{ formatCurrency(journal.ledgers.reduce((sum, l) => sum + parseFloat(l.credit), 0)) }}
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="hidden print:grid grid-cols-2 gap-20 p-12 mt-10">
                    <div class="border-t border-slate-400 pt-4 text-center">
                        <p class="text-xs font-black uppercase">Prepared By</p>
                    </div>
                    <div class="border-t border-slate-400 pt-4 text-center">
                        <p class="text-xs font-black uppercase">Authorized By</p>
                    </div>
                </div>
            </div>
        </div>
    </AuthLayout>
</template>

<style scoped>
@media print {
    .no-print {
        display: none !important;
    }
    body {
        background: white;
    }
}
</style>
