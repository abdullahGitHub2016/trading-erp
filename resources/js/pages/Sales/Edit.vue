<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue';

const props = defineProps({
    sale: Object,
    customers: Array,
    products: Array
});

const form = useForm({
    customer_id: props.sale.customer_id,
    items: [],
    total: props.sale.grand_total
});

// Load existing items into the reactive form
onMounted(() => {
    props.sale.items.forEach(item => {
        form.items.push({
            id: item.product_id,
            name: item.product.name,
            sale_price: parseFloat(item.unit_price),
            qty: item.quantity
        });
    });
});

const selectedProductId = ref("");

const addToCart = () => {
    const product = props.products.find(p => p.id === selectedProductId.value);
    if (product) {
        form.items.push({
            id: product.id,
            name: product.name,
            sale_price: parseFloat(product.sale_price),
            qty: 1
        });
    }
};

const grandTotal = computed(() => {
    const total = form.items.reduce((sum, item) => sum + (item.qty * item.sale_price), 0);
    form.total = total;
    return total;
});

const submit = () => {
    form.put(`/sales/${props.sale.id}`);
};
</script>

<template>
    <AuthLayout>
        <div class="max-w-5xl mx-auto p-6 bg-white shadow rounded-lg">
            <h1 class="text-2xl font-bold mb-6">Edit Sale #{{ sale.invoice_no }}</h1>

            <div class="grid grid-cols-2 gap-4 mb-6">
                <select v-model="form.customer_id" class="border p-2">
                    <option v-for="c in customers" :key="c.id" :value="c.id">{{ c.name }}</option>
                </select>

                <div class="flex gap-2">
                    <select v-model="selectedProductId" class="border p-2 flex-1">
                        <option v-for="p in products" :key="p.id" :value="p.id">{{ p.name }}</option>
                    </select>
                    <button @click="addToCart" class="bg-blue-600 text-white px-4">Add</button>
                </div>
            </div>

            <table class="w-full border mb-6">
                <tr v-for="(item, index) in form.items" :key="index">
                    <td class="p-2 border">{{ item.name }}</td>
                    <td class="p-2 border"><input type="number" v-model="item.qty" class="w-20 border"></td>
                    <td class="p-2 border text-red-500 cursor-pointer" @click="form.items.splice(index, 1)">Remove</td>
                </tr>
            </table>

            <div class="flex justify-between items-center">
                <h2 class="text-xl font-bold">Total: ${{ grandTotal.toFixed(2) }}</h2>
                <button @click="submit" class="bg-orange-500 text-white px-6 py-2 rounded">Update Sale</button>
            </div>
        </div>
    </AuthLayout>
</template>
