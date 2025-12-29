<script setup lang="ts">
import { Head, useForm, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Plus, Trash2, Save, ArrowLeft, Calculator } from 'lucide-vue-next';

/** * 1. STRONGLY TYPED INTERFACES
 * This tells TypeScript exactly what to expect, resolving the
 * "string | number" assignment errors.
 */
interface PurchaseItem {
    product_id: number | string;
    quantity: number;
    unit_price: number;
    subtotal: number;
}

interface Product {
    id: number;
    name: string;
    price: number | string;
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
        items: any[];
    };
    suppliers: Supplier[];
    products: Product[];
}>();

/** * 2. FORM INITIALIZATION
 * Force every numeric field through Number() during the map process.
 */
const form = useForm({
    supplier_id: props.purchase.supplier_id,
    purchase_date: props.purchase.purchase_date,
    items: props.purchase.items.map((item: any): PurchaseItem => {
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

/** * 3. LOGIC HANDLERS
 */
const addItem = () => {
    form.items.push({ product_id: '', quantity: 1, unit_price: 0, subtotal: 0 });
};

const removeItem = (index: number) => {
    if (form.items.length > 1) {
        form.items.splice(index, 1);
        calculateTotal();
    }
};

const onProductChange = (index: number) => {
    // Cast both IDs to Numbers to ensure the comparison works (TS Fix 2345)
    const selectedProduct = props.products.find(
        p => Number(p.id) === Number(form.items[index].product_id)
    );

    if (selectedProduct) {
        form.items[index].unit_price = Number(selectedProduct.price);
        calculateTotal();
    }
};

const calculateTotal = () => {
    let total = 0;
    form.items.forEach((item: PurchaseItem) => {
        const qty = Number(item.quantity || 0);
        const price = Number(item.unit_price || 0);
        item.subtotal = qty * price;
        total += item.subtotal;
    });
    form.total_amount = total;
};

const submit = () => {
    // Path includes the purchase ID
    form.put(`/purchases/${props.purchase.id}`);
};
</script>

<template>
    <Head title="Edit Purchase Order" />

    <AuthLayout>
        <div class="max-w-6xl mx-auto py-6">
            <div class="mb-8 flex items-center justify-between">
                <div>
                    <Link href="/purchases" class="text-blue-600 flex items-center gap-1 text-sm font-bold hover:underline mb-1">
                        <ArrowLeft class="w-4 h-4" /> Back to Purchases
                    </Link>
                    <h1 class="text-3xl font-black text-slate-900 tracking-tight">Edit Order</h1>
                </div>
                <div class="bg-slate-100 px-4 py-2 rounded-xl border border-slate-200">
                    <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Reference No.</p>
                    <p class="font-mono font-bold text-slate-700">{{ purchase.purchase_no }}</p>
                </div>
            </div>

            <form @submit.prevent="submit" class="space-y-6">
                <div class="bg-white p-8 rounded-3xl border border-slate-200 shadow-sm grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="space-y-2">
                        <label class="text-xs font-black uppercase text-slate-500 tracking-wider">Supplier</label>
                        <select v-model="form.supplier_id" class="w-full rounded-xl border-slate-200 focus:ring-blue-500 p-3 bg-slate-50 border-none shadow-inner">
                            <option value="">Choose a Supplier</option>
                            <option v-for="s in suppliers" :key="s.id" :value="s.id">{{ s.name }}</option>
                        </select>
                        <p v-if="form.errors.supplier_id" class="text-red-500 text-xs font-bold">{{ form.errors.supplier_id }}</p>
                    </div>

                    <div class="space-y-2">
                        <label class="text-xs font-black uppercase text-slate-500 tracking-wider">Order Date</label>
                        <input type="date" v-model="form.purchase_date" class="w-full rounded-xl border-slate-200 focus:ring-blue-500 p-3 bg-slate-50 border-none shadow-inner" />
                    </div>
                </div>

                <div class="bg-white rounded-3xl border border-slate-200 shadow-sm overflow-hidden">
                    <div class="p-6 border-b border-slate-50 flex justify-between items-center bg-slate-50/30">
                        <h3 class="font-bold text-slate-800">Items & Quantities</h3>
                        <button type="button" @click="addItem" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-xl text-sm font-bold flex items-center gap-2 transition">
                            <Plus class="w-4 h-4" /> Add Row
                        </button>
                    </div>

                    <div class="overflow-x-auto">
                        <table class="w-full text-left">
                            <thead class="bg-slate-50/50">
                                <tr class="text-[10px] uppercase font-black text-slate-400 tracking-widest border-b border-slate-100">
                                    <th class="p-4">Product Selection</th>
                                    <th class="p-4 w-32 text-center">Quantity</th>
                                    <th class="p-4 w-40 text-right">Unit Price</th>
                                    <th class="p-4 w-40 text-right">Subtotal</th>
                                    <th class="p-4 w-12"></th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-50">
                                <tr v-for="(item, index) in form.items" :key="index">
                                    <td class="p-3">
                                        <select v-model="item.product_id" @change="onProductChange(index)" class="w-full border-none focus:ring-0 bg-transparent rounded-lg">
                                            <option value="">Search Product...</option>
                                            <option v-for="p in products" :key="p.id" :value="p.id">{{ p.name }}</option>
                                        </select>
                                    </td>
                                    <td class="p-3">
                                        <input type="number" v-model="item.quantity" @input="calculateTotal" min="1" class="w-full border-none focus:ring-0 bg-slate-50 rounded-lg text-center font-bold" />
                                    </td>
                                    <td class="p-3">
                                        <input type="number" step="0.01" v-model="item.unit_price" @input="calculateTotal" class="w-full border-none focus:ring-0 bg-slate-50 rounded-lg text-right font-mono" />
                                    </td>
                                    <td class="p-3 text-right font-black text-slate-800">
                                        ${{ Number(item.subtotal || 0).toFixed(2) }}
                                    </td>
                                    <td class="p-3 text-center">
                                        <button v-if="form.items.length > 1" type="button" @click="removeItem(index)" class="text-slate-300 hover:text-red-500 transition">
                                            <Trash2 class="w-4 h-4" />
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="p-8 bg-slate-900 text-white flex flex-col md:flex-row justify-between items-center">
                        <div class="flex items-center gap-5">
                            <div class="p-4 bg-blue-500/10 rounded-2xl border border-blue-500/20">
                                <Calculator class="w-8 h-8 text-blue-400" />
                            </div>
                            <div>
                                <p class="text-[10px] font-black uppercase text-slate-500 tracking-widest mb-1">Total Amount Due</p>
                                <p class="text-4xl font-black text-white leading-none">
                                    ${{ Number(form.total_amount || 0).toFixed(2) }}
                                </p>
                            </div>
                        </div>

                        <button
                            type="submit"
                            :disabled="form.processing"
                            class="w-full md:w-auto bg-blue-500 hover:bg-blue-400 text-white px-12 py-5 rounded-2xl font-black shadow-xl shadow-blue-500/20 transition-all active:scale-95 disabled:opacity-50 flex items-center justify-center gap-3"
                        >
                            <Save class="w-6 h-6" />
                            {{ form.processing ? 'Updating...' : 'Save Purchase Order' }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </AuthLayout>
</template>
