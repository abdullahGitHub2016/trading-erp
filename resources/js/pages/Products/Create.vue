<script setup lang="ts">
import { useForm, Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Button } from '@/components/ui/button';
import { Package, Tag, Hash, DollarSign, ChevronLeft, PlusCircle } from 'lucide-vue-next';

defineProps<{
    categories: any[];
    units: any[];
}>();

const form = useForm({
    name: '',
    sku: '',
    category_id: '',
    unit_id: '',
    purchase_price: '',
    sale_price: '',
});

const submit = () => {
    form.post('/products', {
        onSuccess: () => {
            // This runs if the product was created successfully
            console.log("Product added successfully!");
        },
        onError: (errors) => {
            // This will show you ACTUAL code errors if they exist
            console.error("Validation failed:", errors);
        }
    });
};
</script>

<template>
    <AuthLayout wide>
        <Head title="Add New Product" />

        <div class="mb-8 border-b pb-4 flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold text-slate-800">Add New Product</h1>
                <p class="text-slate-500 text-sm">Create a new item in your inventory.</p>
            </div>
            <Link href="/products" class="flex items-center text-sm text-slate-500 hover:text-blue-600 transition">
                <ChevronLeft class="w-4 h-4 mr-1" /> Back to List
            </Link>
        </div>

        <form @submit.prevent="submit" class="space-y-6">
            <div class="space-y-1">
                <label class="flex items-center text-sm font-semibold text-slate-700">
                    <Package class="w-4 h-4 mr-2 text-slate-400" /> Product Name
                </label>
                <input v-model="form.name" type="text" placeholder="e.g. Samsung Galaxy S24" class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 outline-none" />
                <p v-if="form.errors.name" class="text-red-500 text-xs mt-1">{{ form.errors.name }}</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <Hash class="w-4 h-4 mr-2 text-slate-400" /> SKU Code
                    </label>
                    <input v-model="form.sku" type="text" placeholder="PROD-001" class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 outline-none" />
                    <p v-if="form.errors.sku" class="text-red-500 text-xs mt-1">{{ form.errors.sku }}</p>
                </div>


                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <Tag class="w-4 h-4 mr-2 text-slate-400" /> Category
                    </label>
                    <select v-model="form.category_id" class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg outline-none">
                        <option value="" disabled>Select Category</option>
                        <option v-for="cat in categories" :key="cat.id" :value="cat.id">{{ cat.name }}</option>
                    </select>
                </div>
            </div>
<div class="space-y-1">
    <label class="flex items-center text-sm font-semibold text-slate-700">
        <Package class="w-4 h-4 mr-2 text-slate-400" /> Unit of Measure
    </label>
    <select
        v-model="form.unit_id"
        :class="{'border-red-500 ring-red-500/20': form.errors.unit_id}"
        class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 outline-none appearance-none"
    >
        <option value="" disabled selected>Select Unit (kg, pcs, etc.)</option>
        <option v-for="unit in units" :key="unit.id" :value="unit.id">
            {{ unit.name }}
        </option>
    </select>

    <p v-if="form.errors.unit_id" class="text-red-500 text-xs font-semibold mt-1">
        {{ form.errors.unit_id }}
    </p>
</div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <DollarSign class="w-4 h-4 mr-2 text-slate-400" /> Purchase Price
                    </label>
                    <input v-model="form.purchase_price" type="number" step="0.01" class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg outline-none" />
                </div>

                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <DollarSign class="w-4 h-4 mr-2 text-green-500" /> Sale Price
                    </label>
                    <input v-model="form.sale_price" type="number" step="0.01" class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg outline-none" />
                </div>
            </div>

            <div class="pt-6 border-t mt-8 flex items-center justify-end space-x-4">
                <Link href="/products" class="px-6 py-2.5 text-sm font-medium text-slate-600 hover:bg-slate-100 rounded-lg">Cancel</Link>
                <Button type="submit" :disabled="form.processing" class="bg-blue-600 hover:bg-blue-700 text-white px-8">
                    <PlusCircle class="w-4 h-4 mr-2" />
                    {{ form.processing ? 'Saving...' : 'Create Product' }}
                </Button>
            </div>
        </form>
    </AuthLayout>
</template>
