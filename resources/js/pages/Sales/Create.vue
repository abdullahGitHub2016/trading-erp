<script setup>
import { ref, computed } from 'vue';
import { useForm, router } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue'; // Adjust path

const props = defineProps({
    customers: Array,
    products: Array
});

const form = useForm({
    // Change this from props.customers[0]?.id to ''
    customer_id: '',
    items: [],
    total: 0
});
const selectedProductId = ref("");

const addToCart = () => {
    if (!selectedProductId.value) return;
    const product = props.products.find(p => p.id === selectedProductId.value);

    // Stock Check
    if (product.stock_quantity <= 0) {
        toastr.error("Out of stock!");
        return;
    }

    const existing = form.items.find(item => item.id === product.id);
    if (existing) {
        existing.qty++;
    } else {
        form.items.push({
            id: product.id,
            name: product.name,
            sale_price: parseFloat(product.sale_price),
            stock: product.stock_quantity,
            qty: 1
        });
    }
    selectedProductId.value = "";
};

const grandTotal = computed(() => {
    return form.items.reduce((sum, item) => sum + (item.qty * item.sale_price), 0);
});

const submit = () => {
    // FIX: Sync computed total to form field so it's not null in PHP
    form.total = grandTotal.value;

    form.post('/sales', {
        onSuccess: () => toastr.success('Sale Completed!'),
        onError: () => toastr.error('Check form errors')
    });
};
</script>

<template>
    <AuthLayout>
        <div class="max-w-5xl mx-auto p-6 bg-white shadow rounded-lg">
            <h1 class="text-2xl font-bold mb-6">Create Sale</h1>

            <div class="grid grid-cols-2 gap-6 mb-6">
                <div>
            <label class="block font-bold">Customer</label>
            <select v-model="form.customer_id" class="w-full border p-2 rounded">
                <option value="" disabled selected>-- Select Customer --</option>

                <option v-for="c in customers" :key="c.id" :value="c.id">
                    {{ c.name }}
                </option>
            </select>
            <div v-if="form.errors.customer_id" class="text-red-500 text-sm">
                {{ form.errors.customer_id }}
            </div>
        </div>
                <div>
                    <label class="block font-bold">Add Product</label>
                    <div class="flex gap-2">
                        <select v-model="selectedProductId" class="w-full border p-2 rounded">
                            <option value="">-- Select Product --</option>
                            <option v-for="p in products" :key="p.id" :value="p.id">
                                {{ p.name }} (${{ p.sale_price }}) - Stock: {{ p.stock_quantity }}
                            </option>
                        </select>
                        <button @click="addToCart" class="bg-blue-600 text-white px-4 rounded">Add</button>
                    </div>
                </div>
            </div>

            <table class="w-full border-collapse border mb-6 text-left">
                <thead>
                    <tr class="bg-gray-100">
                        <th class="border p-2">Product</th>
                        <th class="border p-2">Price</th>
                        <th class="border p-2">Qty</th>
                        <th class="border p-2">Total</th>
                        <th class="border p-2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in form.items" :key="index">
                        <td class="border p-2">{{ item.name }}</td>
                        <td class="border p-2">${{ item.sale_price }}</td>
                        <td class="border p-2">
                            <input type="number" v-model.number="item.qty" class="w-20 border rounded text-center">
                        </td>
                        <td class="border p-2">${{ (item.qty * item.sale_price).toFixed(2) }}</td>
                        <td class="border p-2 text-center text-red-600 cursor-pointer"
                            @click="form.items.splice(index, 1)">
                            Remove
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="flex justify-between items-center">
                <h2 class="text-2xl font-bold">Total: ${{ grandTotal.toFixed(2) }}</h2>
                <button @click="submit" :disabled="form.processing || form.items.length === 0"
                    class="bg-green-600 text-white px-8 py-2 rounded font-bold">
                    {{ form.processing ? 'Saving...' : 'Submit Sale' }}
                </button>
            </div>
        </div>
    </AuthLayout>
</template>
