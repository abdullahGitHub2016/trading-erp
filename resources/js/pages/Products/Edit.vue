<script setup lang="ts">
import { useForm, Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Button } from '@/components/ui/button';
import { Package, Tag, Hash, DollarSign, ChevronLeft } from 'lucide-vue-next';

interface Props {
    product: any;
    categories: any[];
    units: any[];
}

const props = defineProps<Props>();

const form = useForm({
    name: props.product.name,
    sku: props.product.sku,
    category_id: props.product.category_id,
    unit_id: props.product.unit_id,
    purchase_price: props.product.purchase_price,
    sale_price: props.product.sale_price,
});

const submit = () => {
    form.put(`/products/${props.product.id}`);
};
</script>

<template>
    <AuthLayout wide>
        <Head :title="'Editing ' + product.name" />

        <div class="mb-8 border-b pb-4 flex items-center justify-between">
            <div>
                <h1 class="text-2xl font-bold text-slate-800">Edit Product</h1>
                <p class="text-slate-500 text-sm">Update your inventory details below.</p>
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
                <input
                    v-model="form.name"
                    type="text"
                    class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg shadow-sm focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 text-slate-900 placeholder-slate-400 transition-all outline-none"
                    placeholder="e.g. Wireless Mouse"
                />
                <div v-if="form.errors.name" class="text-red-500 text-xs font-medium mt-1">{{ form.errors.name }}</div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <Hash class="w-4 h-4 mr-2 text-slate-400" /> SKU Code
                    </label>
                    <input
                        v-model="form.sku"
                        type="text"
                        class="w-full px-4 py-2.5 bg-slate-50 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 text-slate-700 font-mono"
                    />
                </div>

                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <Tag class="w-4 h-4 mr-2 text-slate-400" /> Category
                    </label>
                    <select
                        v-model="form.category_id"
                        class="w-full px-4 py-2.5 bg-white border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 text-slate-700 outline-none appearance-none"
                    >
                        <option v-for="cat in categories" :key="cat.id" :value="cat.id">{{ cat.name }}</option>
                    </select>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <DollarSign class="w-4 h-4 mr-2 text-slate-400" /> Buying Price
                    </label>
                    <div class="relative">
                        <span class="absolute left-3 top-2.5 text-slate-400 text-sm">$</span>
                        <input
                            v-model="form.purchase_price"
                            type="number" step="0.01"
                            class="w-full pl-7 pr-4 py-2.5 bg-white border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 text-slate-900 outline-none"
                        />
                    </div>
                </div>

                <div class="space-y-1">
                    <label class="flex items-center text-sm font-semibold text-slate-700">
                        <DollarSign class="w-4 h-4 mr-2 text-green-500" /> Selling Price
                    </label>
                    <div class="relative">
                        <span class="absolute left-3 top-2.5 text-slate-400 text-sm">$</span>
                        <input
                            v-model="form.sale_price"
                            type="number" step="0.01"
                            class="w-full pl-7 pr-4 py-2.5 bg-white border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 text-slate-900 font-bold outline-none"
                        />
                    </div>
                </div>
            </div>

            <div class="pt-6 border-t mt-8 flex items-center justify-end space-x-4">
                <Link
                    href="/products"
                    class="px-6 py-2.5 text-sm font-medium text-slate-600 hover:bg-slate-100 rounded-lg transition"
                >
                    Cancel
                </Link>
                <Button
                    type="submit"
                    :disabled="form.processing"
                    class="px-8 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-lg shadow-lg shadow-blue-200 transition-all transform active:scale-95"
                >
                    <span v-if="form.processing">Updating...</span>
                    <span v-else>Save Changes</span>
                </Button>
            </div>
        </form>
    </AuthLayout>
</template>

<style scoped>
/* Optional: Hide arrows from number input for a cleaner look */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>
