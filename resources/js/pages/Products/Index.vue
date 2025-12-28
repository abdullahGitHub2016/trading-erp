<script setup lang="ts">
import { Link, Head, router } from '@inertiajs/vue3';
import AuthLayout from '@/layouts/AuthLayout.vue'; // Using your existing Layout
import Pagination from '@/components/Pagination.vue';
import { Button } from '@/components/ui/button';
import { Plus, Pencil, Trash2 } from 'lucide-vue-next';

defineProps<{ products: any }>();
</script>

<template>
    <AuthLayout title="Product List" description="Manage your inventory products here." wide>

        <Head title="Products" />

        <div class="mb-4 flex justify-end">
            <Button @click="router.visit('/products/create')">
                <Plus class="h-4 w-4 mr-2" /> Add Product
            </Button>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full border-collapse">
                <thead>
                    <tr class="border-b bg-gray-50 text-left text-sm uppercase text-gray-600">
                        <th class="p-4">SKU</th>
                        <th class="p-4">Name</th>
                        <th class="p-4">Category</th>
                        <th class="p-4 text-right">Price</th>
                        <th class="p-4 text-center">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    <tr v-for="product in products.data" :key="product.id" class="hover:bg-gray-50">
                        <td class="p-4 font-mono text-xs">{{ product.sku }}</td>
                        <td class="p-4 font-medium">{{ product.name }}</td>
                        <td class="p-4 text-gray-500">{{ product.category?.name }}</td>
                        <td class="p-4 text-right">${{ product.sale_price }}</td>
                        <td class="p-4 text-center space-x-2">
                            <Link :href="`/products/${product.id}/edit`"
                                class="text-blue-600 hover:text-blue-900 font-medium">
                            Edit
                            </Link>
                            <button class="text-red-500 hover:underline">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="mt-6">
            <Pagination :links="products.links" />
        </div>
    </AuthLayout>
</template>
