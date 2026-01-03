<script setup lang="ts">
import { ref, computed, watch } from 'vue';
import { Head, useForm, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Plus, Trash2, Save, ArrowLeft, Calculator } from 'lucide-vue-next';

interface Supplier {
    id: number;
    name: string;
}

interface Product {
    id: number;
    name: string;
    purchase_price: number | string; // Update this to match Controller
    stock_quantity: number;
}

const props = defineProps < {
    suppliers: Array < { id: number, name: string } >;
    products: Array<Product>; // Now uses the updated interface
} > ();

// Initialize the form with one empty row
const form = useForm({
    supplier_id: '',
    purchase_date: new Date().toISOString().split('T')[0],
    note: '',
    items: [
        { product_id: '', quantity: 1, unit_price: 0, subtotal: 0 }
    ],
    total_amount: 0
});

// --- Dynamic Row Logic ---
const addItem = () => {
    form.items.push({ product_id: '', quantity: 1, unit_price: 0, subtotal: 0 });
};

const removeItem = (index: number) => {
    if (form.items.length > 1) {
        form.items.splice(index, 1);
        calculateTotal();
    }
};

// Update price automatically when a product is selected
// Update price automatically when a product is selected
const onProductChange = (index: number) => {
    const selectedProduct = props.products.find(p => Number(p.id) === Number(form.items[index].product_id));

    if (selectedProduct) {
        // Use purchase_price instead of price
        form.items[index].unit_price = Number(selectedProduct.purchase_price || 0);
        calculateTotal();
    }
};

const calculateTotal = () => {
    let grandTotal = 0;
    form.items.forEach((item) => {
        // Ensure quantity and price are numbers to avoid NaN
        const qty = Number(item.quantity || 0);
        const price = Number(item.unit_price || 0);

        item.subtotal = qty * price;
        grandTotal += item.subtotal;
    });
    form.total_amount = grandTotal;
};

const submit = () => {
    form.post('/purchases', {
        onSuccess: () => form.reset(),
    });
};
</script>

<template>

    <Head title="Create Purchase" />

    <AuthLayout>
        <div class="max-w-6xl mx-auto">
            <div class="flex items-center justify-between mb-8">
                <div>
                    <Link href="/purchases"
                        class="text-blue-600 flex items-center gap-1 text-sm font-bold mb-2 hover:underline">
                        <ArrowLeft class="w-4 h-4" /> Back to List
                    </Link>
                    <h1 class="text-3xl font-black text-slate-900">New Purchase Order</h1>
                </div>
            </div>

            <form @submit.prevent="submit" class="space-y-6">
                <div
                    class="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-2">
                        <label class="text-sm font-bold text-slate-700">Supplier</label>
                        <select v-model="form.supplier_id"
                            class="w-full rounded-xl border-slate-200 focus:ring-blue-500 focus:border-blue-500 p-3"
                            :class="{ 'border-red-500': form.errors.supplier_id }">
                            <option value="">Select a Supplier</option>
                            <option v-for="s in suppliers" :key="s.id" :value="s.id">{{ s.name }}</option>
                        </select>
                        <div v-if="form.errors.supplier_id" class="text-red-500 text-xs mt-1">{{ form.errors.supplier_id
                            }}</div>
                    </div>

                    <div class="space-y-2">
                        <label class="text-sm font-bold text-slate-700">Purchase Date</label>
                        <input type="date" v-model="form.purchase_date"
                            class="w-full rounded-xl border-slate-200 focus:ring-blue-500 p-3" />
                    </div>
                </div>

                <div class="bg-white rounded-3xl border border-slate-200 shadow-sm overflow-hidden">
                    <div class="p-6 border-b border-slate-100 bg-slate-50/50 flex justify-between items-center">
                        <h2 class="font-bold text-slate-800">Purchase Items</h2>
                        <button type="button" @click="addItem"
                            class="flex items-center gap-2 text-sm bg-blue-50 text-blue-600 px-4 py-2 rounded-lg font-bold hover:bg-blue-100 transition">
                            <Plus class="w-4 h-4" /> Add Row
                        </button>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                                <tr class="text-[11px] uppercase font-black text-slate-400 tracking-widest border-b">
                                    <th class="p-4">Product</th>
                                    <th class="p-4 w-32">Quantity</th>
                                    <th class="p-4 w-44">Unit Price</th>
                                    <th class="p-4 w-44 text-right">Subtotal</th>
                                    <th class="p-4 w-16"></th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-50">
                                <tr v-for="(item, index) in form.items" :key="index">
                                    <td class="p-4">
                                        <select v-model="item.product_id" @change="onProductChange(index)">
                                            <option value="">Choose Product</option>
                                            <option v-for="p in products" :key="p.id" :value="p.id">
                                                {{ p.name }}
                                            </option>
                                        </select>
                                    </td>
                                    <td class="p-4">
                                        <input type="number" v-model="item.quantity" @input="calculateTotal" min="1"
                                            class="w-full border-none focus:ring-0 bg-slate-50 rounded-lg text-center font-bold" />
                                    </td>
                                    <td class="p-4">
                                        <div class="relative">
                                            <span class="absolute left-3 top-2.5 text-slate-400 text-sm">$</span>
                                            <input type="number" v-model="item.unit_price" @input="calculateTotal"
                                                step="0.01"
                                                class="w-full border-none focus:ring-0 bg-slate-50 rounded-lg pl-7 font-mono" />
                                        </div>
                                    </td>
                                    <td class="p-4 text-right font-black text-slate-700">
                                        ${{ item.subtotal.toFixed(2) }}
                                    </td>
                                    <td class="p-4 text-center">
                                        <button v-if="form.items.length > 1" type="button" @click="removeItem(index)"
                                            class="text-red-400 hover:text-red-600 transition">
                                            <Trash2 class="w-4 h-4" />
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div
                        class="p-8 bg-slate-900 text-white flex flex-col md:flex-row justify-between items-center gap-6">
                        <div class="flex items-center gap-4">
                            <div class="p-3 bg-white/10 rounded-2xl">
                                <Calculator class="w-8 h-8 text-blue-400" />
                            </div>
                            <div>
                                <p class="text-slate-400 text-xs uppercase font-black tracking-widest">Grand Total</p>
                                <p class="text-3xl font-black">${{ form.total_amount.toFixed(2) }}</p>
                            </div>
                        </div>

                        <button type="submit" :disabled="form.processing"
                            class="w-full md:w-auto flex items-center justify-center gap-2 bg-blue-500 hover:bg-blue-400 text-white px-10 py-4 rounded-2xl font-black transition shadow-xl shadow-blue-500/20 disabled:opacity-50">
                            <Save class="w-5 h-5" />
                            {{ form.processing ? 'Saving...' : 'Confirm Purchase' }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </AuthLayout>
</template>
