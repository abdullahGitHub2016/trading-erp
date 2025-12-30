<script setup lang="ts">
import { ref, watch } from 'vue';
import { useForm, Head } from '@inertiajs/vue3';
import { Truck, Trash2, Edit, Plus, X, Search } from 'lucide-vue-next';
import AuthLayout from '@/layouts/AuthLayout.vue';

defineOptions({ layout: AuthLayout });

interface Supplier {
    id: number;
    name: string;
    email: string | null;
    phone: string | null;
    address: string | null;
}

const props = defineProps<{
    suppliers: Supplier[]
}>();

const isEditing = ref(false);
const editId = ref<number | null>(null);
const searchQuery = ref('');
const filteredSuppliers = ref<Supplier[]>(props.suppliers);

const form = useForm({
    name: '',
    email: '',
    phone: '',
    address: '',
});

const submit = () => {
    if (isEditing.value && editId.value) {
        form.put(`/suppliers/${editId.value}`, { onSuccess: () => resetForm() });
    } else {
        form.post('/suppliers', { onSuccess: () => resetForm() });
    }
};

const deleteSupplier = (id: number) => {
    if (confirm('Are you sure?')) {
        form.delete(`/suppliers/${id}`, { preserveScroll: true });
    }
};

const editSupplier = (supplier: Supplier) => {
    isEditing.value = true;
    editId.value = supplier.id;
    // We use '||' to convert null values from the DB into empty strings for the form
    form.name = supplier.name;
    form.email = supplier.email || '';
    form.phone = supplier.phone || '';
    form.address = supplier.address || '';
    window.scrollTo({ top: 0, behavior: 'smooth' });
};

const resetForm = () => {
    form.reset();
    isEditing.value = false;
    editId.value = null;
};

watch([searchQuery, () => props.suppliers], () => {
    filteredSuppliers.value = props.suppliers.filter(s =>
        s.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
        (s.email?.toLowerCase() || '').includes(searchQuery.value.toLowerCase())
    );
}, { immediate: true });
</script>

<template>
    <Head title="Suppliers" />

    <div class="space-y-6">
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div>
                <h1 class="text-2xl font-bold text-slate-800 flex items-center gap-2">
                    <Truck class="text-blue-600 w-6 h-6" /> Suppliers
                </h1>
            </div>

            <div class="relative">
                <Search class="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
                <input v-model="searchQuery" type="text" placeholder="Search..." class="pl-10 pr-4 py-2 border border-slate-200 rounded-lg focus:ring-2 focus:ring-blue-500 outline-none w-full md:w-64" />
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div class="lg:col-span-1">
                <div class="bg-white border border-slate-200 rounded-xl shadow-sm sticky top-6">
                    <div class="p-4 border-b border-slate-100 flex justify-between items-center bg-slate-50/50">
                        <h2 class="font-semibold text-slate-700">{{ isEditing ? 'Edit Supplier' : 'Add Supplier' }}</h2>
                        <button v-if="isEditing" @click="resetForm" class="text-slate-400 hover:text-red-500"><X class="w-5 h-5" /></button>
                    </div>

                    <form @submit.prevent="submit" class="p-5 space-y-4">
                        <div class="space-y-1">
                            <label class="text-xs font-bold text-slate-500 uppercase">Name</label>
                            <input v-model="form.name" type="text" class="w-full border border-slate-200 rounded-lg p-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none" required />
                        </div>
                        <div class="space-y-1">
                            <label class="text-xs font-bold text-slate-500 uppercase">Email</label>
                            <input v-model="form.email" type="email" class="w-full border border-slate-200 rounded-lg p-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none" />
                        </div>
                        <div class="space-y-1">
                            <label class="text-xs font-bold text-slate-500 uppercase">Phone</label>
                            <input v-model="form.phone" type="text" class="w-full border border-slate-200 rounded-lg p-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none" />
                        </div>
                        <div class="space-y-1">
                            <label class="text-xs font-bold text-slate-500 uppercase">Address</label>
                            <textarea v-model="form.address" rows="3" class="w-full border border-slate-200 rounded-lg p-2.5 text-sm focus:ring-2 focus:ring-blue-500 outline-none"></textarea>
                        </div>
                        <button type="submit" :disabled="form.processing" class="w-full py-3 rounded-lg font-bold transition-all flex items-center justify-center gap-2" :class="isEditing ? 'bg-amber-500 text-white' : 'bg-blue-600 text-white'">
                            <component :is="isEditing ? Edit : Plus" class="w-4 h-4" />
                            {{ isEditing ? 'Update' : 'Save' }}
                        </button>
                    </form>
                </div>
            </div>

            <div class="lg:col-span-2">
                <div class="bg-white border border-slate-200 rounded-xl shadow-sm overflow-hidden">
                    <table class="w-full text-left">
                        <thead class="bg-slate-50 border-b text-slate-500 text-[10px] uppercase font-bold tracking-widest">
                            <tr>
                                <th class="px-6 py-4">Company</th>
                                <th class="px-6 py-4">Address</th>
                                <th class="px-6 py-4 text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <tr v-for="supplier in filteredSuppliers" :key="supplier.id" class="hover:bg-slate-50/50 group">
                                <td class="px-6 py-4">
                                    <div class="font-bold text-slate-900">{{ supplier.name }}</div>
                                    <div class="text-xs text-slate-500">{{ supplier.email || '—' }}</div>
                                </td>
                                <td class="px-6 py-4 text-sm text-slate-600">
                                    <span class="block max-w-[180px] truncate" :title="supplier.address || undefined">
                                        {{ supplier.address || '—' }}
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <div class="flex justify-end gap-1">
                                        <button @click="editSupplier(supplier)" class="p-2 text-blue-600 hover:bg-blue-50 rounded-lg"><Edit class="w-4 h-4" /></button>
                                        <button @click="deleteSupplier(supplier.id)" class="p-2 text-red-500 hover:bg-red-50 rounded-lg"><Trash2 class="w-4 h-4" /></button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>
