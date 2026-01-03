<script setup>
import { useForm, Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { LibraryBig, Plus, ListTree } from 'lucide-vue-next';
import { ref } from 'vue';

const props = defineProps({ accounts: Array });
const showCreateForm = ref(false);

const form = useForm({
    code: '',
    name: '',
    type: 'Asset'
});

const submit = () => {
    form.post('/accounting/chart-of-accounts', {
        onSuccess: () => {
            showCreateForm.value = false;
            form.reset();
        }
    });
};
</script>

<template>
    <Head title="Chart of Accounts" />
    <AuthLayout>
        <div class="max-w-6xl mx-auto p-6">
            <div class="flex justify-between items-center mb-8">
                <h1 class="text-3xl font-black text-slate-900 flex items-center gap-3">
                    <ListTree class="w-8 h-8 text-blue-600" /> Chart of Accounts
                </h1>
                <button @click="showCreateForm = !showCreateForm" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-xl font-bold transition flex items-center gap-2">
                    <Plus class="w-5 h-5" /> Add Account
                </button>
            </div>

            <div v-if="showCreateForm" class="bg-white p-6 rounded-2xl shadow-lg border border-blue-100 mb-8 transition-all">
                <form @submit.prevent="submit" class="grid grid-cols-1 md:grid-cols-4 gap-4 items-end">
                    <div>
                        <label class="block text-xs font-bold text-slate-400 uppercase mb-1">Account Code</label>
                        <input v-model="form.code" type="text" placeholder="e.g. 1001" class="w-full border-slate-200 rounded-lg">
                    </div>
                    <div>
                        <label class="block text-xs font-bold text-slate-400 uppercase mb-1">Account Name</label>
                        <input v-model="form.name" type="text" placeholder="e.g. Petty Cash" class="w-full border-slate-200 rounded-lg">
                    </div>
                    <div>
                        <label class="block text-xs font-bold text-slate-400 uppercase mb-1">Type</label>
                        <select v-model="form.type" class="w-full border-slate-200 rounded-lg">
                            <option>Asset</option>
                            <option>Liability</option>
                            <option>Equity</option>
                            <option>Revenue</option>
                            <option>Expense</option>
                        </select>
                    </div>
                    <button type="submit" :disabled="form.processing" class="bg-slate-900 text-white py-2 rounded-lg font-bold hover:bg-slate-800">
                        Save Account
                    </button>
                </form>
            </div>

            <div class="bg-white rounded-3xl shadow-sm border border-slate-100 overflow-hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-b border-slate-100">
                        <tr>
                            <th class="p-5 text-xs font-black uppercase text-slate-400">Code</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400">Name</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400">Type</th>
                            <th class="p-5 text-xs font-black uppercase text-slate-400 text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-50">
    <tr v-for="acc in accounts" :key="acc.id" class="hover:bg-slate-50/50 transition-colors">
        <td class="p-5 font-mono font-bold text-blue-600 text-sm">{{ acc.code }}</td>
        <td class="p-5">
            <div class="font-bold text-slate-700">{{ acc.name }}</div>
            <div class="text-[10px] text-slate-400 uppercase font-black tracking-tighter">{{ acc.type }}</div>
        </td>
        <td class="p-5">
            <span class="px-3 py-1 rounded-full text-[10px] font-black uppercase border"
                :class="{
                    'bg-emerald-50 text-emerald-700 border-emerald-100': acc.type === 'Asset' || acc.type === 'Revenue',
                    'bg-amber-50 text-amber-700 border-amber-100': acc.type === 'Liability' || acc.type === 'Expense',
                    'bg-purple-50 text-purple-700 border-purple-100': acc.type === 'Equity'
                }">
                {{ acc.type }}
            </span>
        </td>
        <td class="p-5 text-right">
            <Link :href="`/accounting/ledger/${acc.id}`"
                  class="inline-flex items-center gap-2 bg-slate-100 hover:bg-blue-600 hover:text-white px-4 py-2 rounded-lg text-sm font-bold text-slate-600 transition-all">
                <LibraryBig class="w-4 h-4" />
                View Ledger
            </Link>
        </td>
    </tr>
</tbody>
                </table>
            </div>
        </div>
    </AuthLayout>
</template>
