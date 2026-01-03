<script setup lang="ts">
import { Head, useForm, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Plus, Trash2, Save, ArrowLeft, Calculator } from 'lucide-vue-next';

// 1. Updated Interfaces to match Controller data
interface PurchaseItem {
    product_id: number | string;
    quantity: number;
    unit_price: number;
    subtotal: number;
}

interface Product {
    id: number;
    name: string;
    purchase_price: number | string; // Changed from 'price' to match your DB/Controller
    stock_quantity: number;
}

interface Supplier {
    id: number;
    name: string;
}

const props = defineProps<{
    purchase: {
        id: number;
        purchase_no: string;
        supplier_id: number;
        purchase_date: string;
        total_amount: number | string;
        items?: any[];
    };
    suppliers: Supplier[];
    products: Product[];
}>();

// 2. Form Initialization with numeric safety
const form = useForm({
    supplier_id: props.purchase.supplier_id,
    purchase_date: props.purchase.purchase_date,
    items: (props.purchase.items || []).map((item: any): PurchaseItem => {
        const q = Number(item.quantity || 0);
        const p = Number(item.unit_price || 0);
        return {
            product_id: item.product_id,
            quantity: q,
            unit_price: p,
            subtotal: q * p
        };
    }),
    total_amount: Number(props.purchase.total_amount || 0)
});

// 3. Logic Handlers with NaN Prevention
const onProductChange = (index: number) => {
    // Cast to Number to ensure comparison works regardless of type
    const selectedProduct = props.products.find(
        p => Number(p.id) === Number(form.items[index].product_id)
    );

    if (selectedProduct) {
        // Use 'purchase_price' as defined in your Product interface
        form.items[index].unit_price = Number(selectedProduct.purchase_price || 0);
        calculateTotal();
    }
};

const calculateTotal = () => {
    let totalValue = 0;
    form.items.forEach((item: PurchaseItem) => {
        // Strict casting to Number prevents $NaN
        const qty = Number(item.quantity || 0);
        const price = Number(item.unit_price || 0);

        item.subtotal = qty * price;
        totalValue += item.subtotal;
    });
    form.total_amount = totalValue;
};

const addItem = () => {
    form.items.push({ product_id: '', quantity: 1, unit_price: 0, subtotal: 0 });
};

const removeItem = (index: number) => {
    if (form.items.length > 1) {
        form.items.splice(index, 1);
        calculateTotal();
    }
};

const submit = () => {
    form.put(`/purchases/${props.purchase.id}`);
};
</script>

<template>
    <Head title="Edit Purchase" />

    <AuthLayout>
        <div class="max-w-6xl mx-auto py-8 px-4">
            <div class="mb-6">
                <Link href="/purchases" class="text-blue-600 flex items-center gap-2 font-bold mb-2">
                    <ArrowLeft class="w-4 h-4" /> Back
                </Link>
                <h1 class="text-2xl font-black">Edit Purchase #{{ purchase.purchase_no }}</h1>
            </div>

            <form @submit.prevent="submit" class="space-y-6">
                <div class="bg-white p-6 rounded-2xl shadow-sm border border-slate-200 grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-xs font-bold uppercase text-slate-500 mb-1">Supplier</label>
                        <select v-model="form.supplier_id" class="w-full rounded-lg border-slate-200 bg-slate-50">
                            <option v-for="s in suppliers" :key="s.id" :value="s.id">{{ s.name }}</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs font-bold uppercase text-slate-500 mb-1">Date</label>
                        <input type="date" v-model="form.purchase_date" class="w-full rounded-lg border-slate-200 bg-slate-50" />
                    </div>
                </div>

                <div class="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
                    <table class="w-full">
                        <thead class="bg-slate-50 border-b border-slate-200">
                            <tr class="text-left text-xs font-black uppercase text-slate-400">
                                <th class="p-4">Product</th>
                                <th class="p-4 w-32">Qty</th>
                                <th class="p-4 w-40">Price</th>
                                <th class="p-4 w-40 text-right">Subtotal</th>
                                <th class="p-4 w-10"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item, index) in form.items" :key="index" class="border-b border-slate-100">
                                <td class="p-2">
                                    <select v-model="item.product_id" @change="onProductChange(index)" class="w-full border-none focus:ring-0">
                                        <option value="">Select Product</option>
                                        <option v-for="p in products" :key="p.id" :value="p.id">{{ p.name }}</option>
                                    </select>
                                </td>
                                <td class="p-2">
                                    <input type="number" v-model="item.quantity" @input="calculateTotal" class="w-full border-none text-center" />
                                </td>
                                <td class="p-2">
                                    <input type="number" step="0.01" v-model="item.unit_price" @input="calculateTotal" class="w-full border-none text-right" />
                                </td>
                                <td class="p-2 text-right font-bold">
                                    ${{ item.subtotal.toFixed(2) }}
                                </td>
                                <td class="p-2">
                                    <button type="button" @click="removeItem(index)" class="text-slate-300 hover:text-red-500">
                                        <Trash2 class="w-4 h-4" />
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="p-4 bg-slate-50 border-t border-slate-200">
                        <button type="button" @click="addItem" class="text-blue-600 font-bold flex items-center gap-1">
                            <Plus class="w-4 h-4" /> Add Item
                        </button>
                    </div>
                </div>

                <div class="bg-slate-900 p-6 rounded-2xl flex justify-between items-center text-white">
                    <div>
                        <p class="text-xs text-slate-400 uppercase font-bold">Total Amount</p>
                        <p class="text-3xl font-black">${{ form.total_amount.toFixed(2) }}</p>
                    </div>
                    <button type="submit" :disabled="form.processing" class="bg-blue-600 hover:bg-blue-500 px-8 py-3 rounded-xl font-bold flex items-center gap-2">
                        <Save class="w-5 h-5" /> Update Purchase
                    </button>
                </div>
            </form>
        </div>
    </AuthLayout>
</template>
