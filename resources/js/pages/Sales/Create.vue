<script setup>
import { ref, computed } from 'vue';
import { useForm, Head, Link } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import Swal from 'sweetalert2';

const props = defineProps({
    customers: Array,
    products: Array
});

const form = useForm({
    customer_id: '',
    items: [],
    grand_total: 0,
    note: ''
});

const selectedProductId = ref("");

// Adds product to the list with stock check and price suggestion
const addToCart = () => {
    if (!selectedProductId.value) return;

    const product = props.products.find(p => p.id === selectedProductId.value);

    if (product) {
        const existingItem = form.items.find(item => item.product_id === product.id);
        if (existingItem) {
            if (existingItem.qty < product.stock_quantity) {
                existingItem.qty++;
            } else {
                Swal.fire('Out of Stock', 'Cannot add more than available stock.', 'warning');
            }
        } else {
            form.items.push({
                product_id: product.id,
                name: product.name,
                // Suggests the price from your product database
                unit_price: parseFloat(product.sale_price || product.purchase_price || 0),
                qty: 1,
                stock: product.stock_quantity
            });
        }
        selectedProductId.value = "";
    }
};

const removeItem = (index) => {
    form.items.splice(index, 1);
};

// Calculates Total and prevents NaN errors
const grandTotal = computed(() => {
    const total = form.items.reduce((sum, item) => {
        const lineTotal = (parseFloat(item.qty) || 0) * (parseFloat(item.unit_price) || 0);
        return sum + lineTotal;
    }, 0);

    form.grand_total = total;
    return total;
});

const submit = () => {
    if (form.items.length === 0) {
        Swal.fire('Error', 'Please add at least one item.', 'error');
        return;
    }

    form.post('/sales', {
        onSuccess: () => {
            Swal.fire({ icon: 'success', title: 'Success!', text: 'Sale recorded.', timer: 2000 });
        },
        onError: (errors) => {
            let errorMsg = Object.values(errors).join('<br>');
            Swal.fire({ icon: 'error', title: 'Validation Failed', html: errorMsg });
        }
    });
};

const formatCurrency = (val) => {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(val);
};
</script>

<template>
    <Head title="Create Sale" />
    <AuthLayout>
        <div class="max-w-5xl mx-auto p-6 bg-white rounded-xl shadow-lg mt-4">
            <h2 class="text-2xl font-bold text-gray-800 mb-6 border-b pb-4">New Sale Invoice</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-1">Customer</label>
                    <select v-model="form.customer_id" class="w-full border-gray-300 rounded-lg shadow-sm">
                        <option value="">Select Customer</option>
                        <option v-for="c in customers" :key="c.id" :value="c.id">{{ c.name }}</option>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-1">Add Product (Shows Stock)</label>
                    <div class="flex gap-2">
                        <select v-model="selectedProductId" class="flex-1 border-gray-300 rounded-lg shadow-sm">
                            <option value="">Choose a product...</option>
                            <option v-for="p in products" :key="p.id" :value="p.id">
                                {{ p.name }} (Stock: {{ p.stock_quantity }})
                            </option>
                        </select>
                        <button @click="addToCart" type="button" class="bg-blue-600 text-white px-6 py-2 rounded-lg">
                            Add
                        </button>
                    </div>
                </div>
            </div>

            <div class="overflow-hidden border rounded-lg mb-6">
                <table class="w-full text-left">
                    <thead class="bg-gray-50 border-b text-gray-600 uppercase text-xs font-bold">
                        <tr>
                            <th class="p-4">Product Name</th>
                            <th class="p-4 w-32">Qty</th>
                            <th class="p-4 w-40">Price</th>
                            <th class="p-4 text-right">Subtotal</th>
                            <th class="p-4 w-20 text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <tr v-for="(item, index) in form.items" :key="index">
                            <td class="p-4 font-medium">{{ item.name }}</td>
                            <td class="p-4">
                                <input type="number" v-model.number="item.qty" class="w-full border-gray-300 rounded p-1">
                            </td>
                            <td class="p-4">
                                <input type="number" v-model.number="item.unit_price" step="0.01" class="w-full border-gray-300 rounded p-1">
                            </td>
                            <td class="p-4 text-right font-semibold">
                                {{ formatCurrency((item.qty || 0) * (item.unit_price || 0)) }}
                            </td>
                            <td class="p-4 text-center">
                                <button @click="removeItem(index)" class="text-red-500 hover:text-red-700">Remove</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="flex flex-col md:flex-row justify-between items-center p-4 bg-gray-50 rounded-lg">
                <div class="mb-4 md:mb-0">
                    <span class="text-gray-500 font-medium">Grand Total:</span>
                    <span class="text-3xl font-black text-blue-600 ml-2">{{ formatCurrency(grandTotal) }}</span>
                </div>
                <div class="flex gap-3">
                    <Link href="/sales" class="px-8 py-3 bg-slate-100 hover:bg-red-50 text-slate-600 hover:text-red-600 font-bold rounded-lg transition-all border border-transparent hover:border-red-200">
                        Cancel
                    </Link>
                    <button @click="submit" :disabled="form.processing" class="bg-green-600 hover:bg-green-700 text-white px-10 py-3 rounded-lg font-bold shadow-lg">
                        {{ form.processing ? 'Processing...' : 'Complete Sale' }}
                    </button>
                </div>
            </div>
        </div>
    </AuthLayout>
</template>
