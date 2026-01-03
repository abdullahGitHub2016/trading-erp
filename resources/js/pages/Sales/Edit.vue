<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm, Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import Swal from 'sweetalert2';

const props = defineProps({
    sale: Object,
    customers: Array,
    products: Array
});

const form = useForm({
    customer_id: props.sale.customer_id,
    items: [],
    grand_total: props.sale.grand_total,
    note: props.sale.note || ''
});

const selectedProductId = ref("");

onMounted(() => {
    if (props.sale.items) {
        props.sale.items.forEach(item => {
            form.items.push({
                product_id: item.product_id,
                name: item.product ? item.product.name : 'Unknown Product',
                unit_price: parseFloat(item.unit_price),
                qty: parseInt(item.quantity)
            });
        });
    }
});

const addToCart = () => {
    if (!selectedProductId.value) return;
    const product = props.products.find(p => p.id === selectedProductId.value);
    if (product) {
        const existingItem = form.items.find(item => item.product_id === product.id);
        if (existingItem) {
            existingItem.qty++;
        } else {
            form.items.push({
                product_id: product.id,
                name: product.name,
                unit_price: parseFloat(product.sale_price || product.purchase_price || 0),
                qty: 1
            });
        }
        selectedProductId.value = "";
    }
};

const removeItem = (index) => {
    form.items.splice(index, 1);
};

const grandTotal = computed(() => {
    const total = form.items.reduce((sum, item) => {
        const qty = parseFloat(item.qty) || 0;
        const price = parseFloat(item.unit_price) || 0;
        return sum + (qty * price);
    }, 0);
    form.grand_total = total;
    return total;
});

const submit = () => {
    if (form.items.length === 0) {
        Swal.fire('Error', 'Invoice must have at least one item.', 'error');
        return;
    }
    form.put(`/sales/${props.sale.id}`, {
        onSuccess: () => Swal.fire({ icon: 'success', title: 'Sale Updated', timer: 2000 }),
        onError: (errors) => Swal.fire({ icon: 'error', title: 'Update Failed', html: Object.values(errors).join('<br>') })
    });
};

const formatCurrency = (val) => {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(val);
};
</script>

<template>
    <Head :title="'Edit Sale ' + sale.invoice_no" />
    <AuthLayout>
        <div class="max-w-5xl mx-auto p-6 bg-white rounded-xl shadow-lg mt-4">
            <div class="flex justify-between items-center border-b pb-4 mb-6">
                <h2 class="text-2xl font-bold text-gray-800">Edit Invoice: {{ sale.invoice_no }}</h2>
                <span class="px-3 py-1 bg-blue-100 text-blue-700 rounded-full text-sm font-bold uppercase">{{ sale.status }}</span>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-1">Customer</label>
                    <select v-model="form.customer_id" class="w-full border-gray-300 rounded-lg shadow-sm">
                        <option v-for="c in customers" :key="c.id" :value="c.id">{{ c.name }}</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-1">Add More Items</label>
                    <div class="flex gap-2">
                        <select v-model="selectedProductId" class="flex-1 border-gray-300 rounded-lg shadow-sm">
                            <option value="">Choose a product...</option>
                            <option v-for="p in products" :key="p.id" :value="p.id">{{ p.name }} (Stock: {{ p.stock_quantity }})</option>
                        </select>
                        <button @click="addToCart" type="button" class="bg-blue-600 text-white px-4 py-2 rounded-lg">Add</button>
                    </div>
                </div>
            </div>

            <div class="overflow-hidden border rounded-lg mb-6">
                <table class="w-full text-left">
                    <thead class="bg-gray-50 border-b text-gray-600 text-xs font-bold uppercase">
                        <tr>
                            <th class="p-4">Product</th>
                            <th class="p-4 w-24">Qty</th>
                            <th class="p-4 w-32">Price</th>
                            <th class="p-4 text-right">Subtotal</th>
                            <th class="p-4 w-20 text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <tr v-for="(item, index) in form.items" :key="index">
                            <td class="p-4 font-medium">{{ item.name }}</td>
                            <td class="p-4"><input type="number" v-model.number="item.qty" class="w-full border-gray-300 rounded p-1"></td>
                            <td class="p-4"><input type="number" v-model.number="item.unit_price" step="0.01" class="w-full border-gray-300 rounded p-1"></td>
                            <td class="p-4 text-right font-semibold">{{ formatCurrency((item.qty || 0) * (item.unit_price || 0)) }}</td>
                            <td class="p-4 text-center"><button @click="removeItem(index)" class="text-red-500 hover:text-red-700">Remove</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="flex flex-col md:flex-row justify-between items-center p-6 bg-gray-50 rounded-lg">
                <div class="mb-4 md:mb-0">
                    <span class="text-gray-500 font-medium">Updated Grand Total:</span>
                    <span class="text-3xl font-black text-blue-600 ml-2">{{ formatCurrency(grandTotal) }}</span>
                </div>
                <div class="flex gap-3">
                    <Link href="/sales" class="px-8 py-3 bg-slate-100 hover:bg-red-50 text-slate-600 hover:text-red-600 font-bold rounded-lg transition-all border border-transparent hover:border-red-200">
                        Cancel
                    </Link>
                    <button @click="submit" :disabled="form.processing" class="bg-green-600 hover:bg-green-700 text-white px-10 py-3 rounded-lg font-bold shadow-lg">
                        {{ form.processing ? 'Saving...' : 'Update Invoice' }}
                    </button>
                </div>
            </div>
        </div>
    </AuthLayout>
</template>
