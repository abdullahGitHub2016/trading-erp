<script setup lang="ts">
import { ref, watch } from 'vue';
import { useForm, Head } from '@inertiajs/vue3';
import { Truck, Trash2, Edit, Plus, X, Search } from 'lucide-vue-next';

// 1. Types & Props
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

// 2. State Management
const isEditing = ref(false);
const editId = ref<number | null>(null);
const searchQuery = ref('');
const filteredSuppliers = ref<Supplier[]>(props.suppliers);

// 3. Form Setup (Using useForm for Inertia integration)
const form = useForm({
    name: '',
    email: '',
    phone: '',
    address: '',
});

// 4. CRUD Actions (Using direct URL strings)

const submit = () => {
    if (isEditing.value && editId.value) {
        // Update - Direct URL String
        form.put(`/suppliers/${editId.value}`, {
            onSuccess: () => resetForm(),
        });
    } else {
        // Create - Direct URL String
        form.post('/suppliers', {
            onSuccess: () => resetForm(),
        });
    }
};

const deleteSupplier = (id: number) => {
    if (confirm('Are you sure you want to delete this supplier?')) {
        // Delete - Direct URL String
        form.delete(`/suppliers/${id}`, {
            preserveScroll: true
        });
    }
};

const editSupplier = (supplier: Supplier) => {
    isEditing.value = true;
    editId.value = supplier.id;
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

// 5. Local Search Logic
watch([searchQuery, () => props.suppliers], () => {
    filteredSuppliers.value = props.suppliers.filter(s =>
        s.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
        s.email?.toLowerCase().includes(searchQuery.value.toLowerCase())
    );
}, { immediate: true });

</script>

<template>
    <Head title="Suppliers Management" />

    <div class="p-6 max-w-7xl mx-auto space-y-6">
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div>
                <h1 class="text-2xl font-bold text-slate-800 flex items-center gap-2">
                    <Truck class="text-blue-600" /> Supplier Directory
                </h1>
                <p class="text-slate-500 text-sm">Manage your vendor relationships and contact details.</p>
            </div>

            <div class="relative">
                <Search class="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
                <input
                    v-model="searchQuery"
                    type="text"
                    placeholder="Search suppliers..."
                    class="pl-10 pr-4 py-2 border border-slate-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none w-full md:w-64"
                />
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div class="lg:col-span-1">
                <div class="bg-white border border-slate-200 rounded-xl shadow-sm overflow-hidden">
                    <div class="p-4 border-b border-slate-100 bg-slate-50/50 flex justify-between items-center">
                        <h2 class="font-semibold text-slate-700">
                            {{ isEditing ? 'Update Supplier' : 'Register New Supplier' }}
                        </h2>
                        <button v-if="isEditing" @click="resetForm" class="text-slate-400 hover:text-slate-600">
                            <X class="w-4 h-4" />
                        </button>
                    </div>

                    <form @submit.prevent="submit" class="p-5 space-y-4">
                        <div>
                            <label class="block text-xs font-medium text-slate-500 uppercase mb-1">Company Name</label>
                            <input v-model="form.name" type="text" class="w-full border border-slate-200 rounded p-2 text-sm focus:border-blue-500 outline-none" required />
                            <div v-if="form.errors.name" class="text-red-500 text-xs mt-1">{{ form.errors.name }}</div>
                        </div>

                        <div>
                            <label class="block text-xs font-medium text-slate-500 uppercase mb-1">Email Address</label>
                            <input v-model="form.email" type="email" class="w-full border border-slate-200 rounded p-2 text-sm focus:border-blue-500 outline-none" />
                        </div>

                        <div>
                            <label class="block text-xs font-medium text-slate-500 uppercase mb-1">Phone Number</label>
                            <input v-model="form.phone" type="text" class="w-full border border-slate-200 rounded p-2 text-sm focus:border-blue-500 outline-none" />
                        </div>

                        <div>
                            <label class="block text-xs font-medium text-slate-500 uppercase mb-1">Physical Address</label>
                            <textarea v-model="form.address" rows="3" class="w-full border border-slate-200 rounded p-2 text-sm focus:border-blue-500 outline-none"></textarea>
                        </div>

                        <button
                            type="submit"
                            :disabled="form.processing"
                            class="w-full py-2 rounded-lg font-medium transition-colors flex items-center justify-center gap-2"
                            :class="isEditing ? 'bg-amber-500 hover:bg-amber-600 text-white' : 'bg-blue-600 hover:bg-blue-700 text-white'"
                        >
                            <component :is="isEditing ? Edit : Plus" class="w-4 h-4" />
                            {{ isEditing ? 'Save Changes' : 'Add Supplier' }}
                        </button>
                    </form>
                </div>
            </div>

            <div class="lg:col-span-2">
                <div class="bg-white border border-slate-200 rounded-xl shadow-sm overflow-hidden">
                    <table class="w-full text-left">
                        <thead class="bg-slate-50 text-slate-500 text-xs uppercase font-semibold">
                            <tr>
                                <th class="px-6 py-4">Supplier Information</th>
                                <th class="px-6 py-4">Address</th>
                                <th class="px-6 py-4 text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <tr v-for="supplier in filteredSuppliers" :key="supplier.id" class="hover:bg-slate-50/50 transition-colors">
                                <td class="px-6 py-4">
                                    <div class="font-bold text-slate-800">{{ supplier.name }}</div>
                                    <div class="text-xs text-slate-500">{{ supplier.email || 'No email' }}</div>
                                    <div class="text-xs text-slate-500">{{ supplier.phone || 'No phone' }}</div>
                                </td>
                                <td class="px-6 py-4 text-sm text-slate-600 max-w-[200px] truncate">
                                    {{ supplier.address || 'N/A' }}
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <div class="flex justify-end gap-2">
                                        <button @click="editSupplier(supplier)" class="p-2 text-blue-600 hover:bg-blue-100 rounded-md transition-colors">
                                            <Edit class="w-4 h-4" />
                                        </button>
                                        <button @click="deleteSupplier(supplier.id)" class="p-2 text-red-600 hover:bg-red-100 rounded-md transition-colors">
                                            <Trash2 class="w-4 h-4" />
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr v-if="filteredSuppliers.length === 0">
                                <td colspan="3" class="p-12 text-center text-slate-400">
                                    No suppliers found.
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>
