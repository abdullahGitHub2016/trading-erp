<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import Pagination from '@/components/Pagination.vue'; // Ensure the path matches your project
import { BookText, Plus, Eye, Calendar, Hash, FileText } from 'lucide-vue-next';

const props = defineProps({
    journals: Object // This is the paginated object from the controller
});

const formatCurrency = (val) => {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(val);
};

// Helper to sum debits for the list view
const getJournalTotal = (ledgers) => {
    return ledgers.reduce((sum, l) => sum + parseFloat(l.debit || 0), 0);
};
</script>

<template>
    <Head title="Journal Vouchers" />
    <AuthLayout>
        <div class="max-w-6xl mx-auto p-6">
            <div class="flex justify-between items-center mb-8">
                <div>
                    <h1 class="text-3xl font-black text-slate-900 flex items-center gap-3 uppercase tracking-tight">
                        <BookText class="w-8 h-8 text-blue-600" /> Journal Vouchers
                    </h1>
                    <p class="text-slate-500 font-medium">Manage and audit all financial transactions.</p>
                </div>

                <Link href="/accounting/journals/create"
                    class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-2xl font-bold shadow-lg shadow-blue-200 transition flex items-center gap-2">
                    <Plus class="w-5 h-5" /> New Manual Entry
                </Link>
            </div>

            <div class="bg-white rounded-3xl shadow-sm border border-slate-100 overflow-hidden mb-6">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 tracking-widest">Date</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 tracking-widest">Reference</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 tracking-widest">Description</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 tracking-widest text-right">Amount</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 tracking-widest text-center">View</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-50">
                        <tr v-for="journal in journals.data" :key="journal.id" class="hover:bg-slate-50/50 transition">
                            <td class="p-5 text-slate-600 font-semibold text-sm">
                                <div class="flex items-center gap-2">
                                    <Calendar class="w-4 h-4 text-slate-300" /> {{ journal.date }}
                                </div>
                            </td>
                            <td class="p-5 font-mono font-bold text-blue-600 text-sm">
                                <div class="flex items-center gap-2">
                                    <Hash class="w-4 h-4 text-blue-300" /> {{ journal.reference_no }}
                                </div>
                            </td>
                            <td class="p-5 text-slate-700 font-medium max-w-xs truncate">{{ journal.description }}</td>
                            <td class="p-5 text-right font-black text-slate-900">
                                {{ formatCurrency(getJournalTotal(journal.ledgers)) }}
                            </td>
                            <td class="p-5 text-center">
                                <Link :href="`/accounting/journals/${journal.id}`"
                                    class="inline-flex items-center justify-center p-2 rounded-xl bg-slate-100 text-slate-600 hover:bg-blue-600 hover:text-white transition group">
                                    <Eye class="w-5 h-5" />
                                </Link>
                            </td>
                        </tr>
                        <tr v-if="journals.data.length === 0">
                            <td colspan="5" class="p-20 text-center">
                                <div class="flex flex-col items-center opacity-20">
                                    <BookText class="w-16 h-16 mb-4" />
                                    <p class="text-xl font-black">No Journals Posted Yet</p>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="flex justify-center">
                <Pagination :links="journals.links" />
            </div>
        </div>
    </AuthLayout>
</template>
