<script setup>
import { ref, computed } from 'vue';
import { useForm, Head } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';
import Swal from 'sweetalert2'; // Use SweetAlert2 instead of Toastr

const props = defineProps({
    customers: Array,
    products: Array
});

const form = useForm({
    customer_id: '',
    items: [],
    grand_total: 0, // Matches Controller validation
    note: ''
});

const selectedProductId = ref("");

// Adds product to the list
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
                unit_price: parseFloat(product.price || 0),
                qty: 1
            });
        }
        selectedProductId.value = "";
    }
};

// Removes an item from the list
const removeItem = (index) => {
    form.items.splice(index, 1);
};

// Calculates Total and prevents NaN errors
const grandTotal = computed(() => {
    const total = form.items.reduce((sum, item) => {
        const lineTotal = (parseFloat(item.qty) || 0) * (parseFloat(item.unit_price) || 0);
        return sum + lineTotal;
    }, 0);

    // Sync the computed total with the form object
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
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: 'Sale recorded and ledger updated.',
                timer: 2000
            });
        },
        onError: (errors) => {
            // Handle Laravel Validation Errors
            let errorMsg = Object.values(errors).join('<br>');
            Swal.fire({
                icon: 'error',
                title: 'Validation Failed',
                html: errorMsg
            });
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
                    <select v-model="form.customer_id" class="w-full border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500">
                        <option value="">Select Customer</option>
                        <option v-for="c in customers" :key="c.id" :value="c.id">{{ c.name }}</option>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-1">Add Product to Invoice</label>
                    <div class="flex gap-2">
                        <select v-model="selectedProductId" class="flex-1 border-gray-300 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500">
                            <option value="">Choose a product...</option>
                            <option v-for="p in products" :key="p.id" :value="p.id">
                                {{ p.name }} (Stock: {{ p.stock_quantity }})
                            </option>
                        </select>
                        <button @click="addToCart" type="button" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2 rounded-lg font-medium transition">
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
                        <tr v-for="(item, index) in form.items" :key="index" class="hover:bg-gray-50 transition">
                            <td class="p-4 font-medium">{{ item.name }}</td>
                            <td class="p-4">
                                <input type="number" v-model.number="item.qty" min="1" class="w-full border-gray-300 rounded p-1 shadow-sm">
                            </td>
                            <td class="p-4">
                                <input type="number" v-model.number="item.unit_price" step="0.01" class="w-full border-gray-300 rounded p-1 shadow-sm">
                            </td>
                            <td class="p-4 text-right font-semibold text-gray-700">
                                {{ formatCurrency((item.qty || 0) * (item.unit_price || 0)) }}
                            </td>
                            <td class="p-4 text-center">
                                <button @click="removeItem(index)" class="text-red-500 hover:text-red-700">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr v-if="form.items.length === 0">
                            <td colspan="5" class="p-8 text-center text-gray-400 italic">No items added to the invoice yet.</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="flex flex-col md:flex-row justify-between items-center p-4 bg-gray-50 rounded-lg">
                <div class="mb-4 md:mb-0">
                    <span class="text-gray-500 font-medium">Grand Total:</span>
                    <span class="text-3xl font-black text-blue-600 ml-2">{{ formatCurrency(grandTotal) }}</span>
                </div>
                <button @click="submit"
                        :disabled="form.processing"
                        class="w-full md:w-auto bg-green-600 hover:bg-green-700 text-white px-10 py-3 rounded-lg font-bold shadow-lg transition transform active:scale-95">
                    {{ form.processing ? 'Processing...' : 'Complete Sale' }}
                </button>
            </div>
        </div>
    </AuthLayout>
</template>
