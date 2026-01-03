<script setup>
import { ref, computed } from 'vue';
import { Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { LibraryBig, Search, ArrowRight } from 'lucide-vue-next';

const props = defineProps({ accounts: Array });
const search = ref('');

const filteredAccounts = computed(() => {
    return props.accounts.filter(acc =>
        acc.name.toLowerCase().includes(search.value.toLowerCase()) ||
        acc.code.includes(search.value)
    );
});
</script>

<template>
    <Head title="General Ledger Selection" />
    <AuthLayout>
        <div class="max-w-4xl mx-auto p-6">
            <div class="mb-8">
                <h1 class="text-3xl font-black text-slate-900 flex items-center gap-3">
                    <LibraryBig class="w-8 h-8 text-blue-600" /> General Ledger
                </h1>
                <p class="text-slate-500">Select an account to view its detailed transaction history.</p>
            </div>

            <div class="relative mb-6">
                <Search class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 w-5 h-5" />
                <input v-model="search" type="text" placeholder="Search by account name or code..."
                       class="w-full pl-12 pr-4 py-4 rounded-2xl border-slate-200 focus:ring-blue-500 focus:border-blue-500 shadow-sm">
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <Link v-for="acc in filteredAccounts" :key="acc.id" :href="`/accounting/ledger/${acc.id}`"
                      class="bg-white p-5 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-blue-300 transition-all group flex justify-between items-center">
                    <div>
                        <div class="text-xs font-black text-blue-600 uppercase tracking-widest">{{ acc.code }}</div>
                        <div class="text-lg font-bold text-slate-800">{{ acc.name }}</div>
                        <div class="text-xs text-slate-400 font-medium">{{ acc.type }}</div>
                    </div>
                    <ArrowRight class="w-5 h-5 text-slate-300 group-hover:text-blue-500 transition-colors" />
                </Link>
            </div>
        </div>
    </AuthLayout>
</template>
