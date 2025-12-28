<script setup lang="ts">
import AuthLayout from '@/layouts/AuthLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import {
    LayoutDashboard,
    ShoppingCart,
    Package,
    TrendingUp,
    AlertCircle,
    ArrowUpRight
} from 'lucide-vue-next';

// Define the stats for the Trading ERP
const stats = [
    { name: 'Total Revenue', value: '$54,230', change: '+12.5%', icon: TrendingUp, color: 'text-emerald-600', bg: 'bg-emerald-50' },
    { name: 'Today\'s Orders', value: '42', change: '+18%', icon: ShoppingCart, color: 'text-blue-600', bg: 'bg-blue-50' },
    { name: 'Total Products', value: '1,240', change: '+2', icon: Package, color: 'text-purple-600', bg: 'bg-purple-50' },
    { name: 'Low Stock Items', value: '12', change: 'Critical', icon: AlertCircle, color: 'text-amber-600', bg: 'bg-amber-50' },
];
</script>

<template>
    <Head title="Trading Dashboard" />

    <AuthLayout>
        <div class="mb-8">
            <h1 class="text-2xl font-bold text-slate-900">Trading Overview</h1>
            <p class="text-slate-500 text-sm">Welcome back! Here is what's happening with your trade today.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <div v-for="stat in stats" :key="stat.name" class="bg-white p-6 rounded-xl border border-slate-200 shadow-sm">
                <div class="flex items-center justify-between mb-4">
                    <div :class="[stat.bg, 'p-2 rounded-lg']">
                        <component :is="stat.icon" :class="[stat.color, 'w-6 h-6']" />
                    </div>
                    <span class="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-1 rounded-full flex items-center">
                        {{ stat.change }}
                        <ArrowUpRight class="w-3 h-3 ml-0.5" />
                    </span>
                </div>
                <h3 class="text-slate-500 text-sm font-medium">{{ stat.name }}</h3>
                <p class="text-2xl font-bold text-slate-900 mt-1">{{ stat.value }}</p>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 bg-white rounded-xl border border-slate-200 shadow-sm overflow-hidden">
                <div class="p-6 border-b border-slate-100 flex justify-between items-center">
                    <h3 class="font-bold text-slate-800">Recent Transactions</h3>
                    <Link href="/reports" class="text-sm text-blue-600 hover:underline">View All</Link>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead class="bg-slate-50 text-slate-500 text-xs uppercase font-bold">
                            <tr>
                                <th class="px-6 py-4">Invoice</th>
                                <th class="px-6 py-4">Status</th>
                                <th class="px-6 py-4">Total</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <tr v-for="i in 5" :key="i" class="hover:bg-slate-50/50 transition-colors">
                                <td class="px-6 py-4 text-sm font-medium text-slate-900">#TRD-882{{ i }}</td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 bg-green-100 text-green-700 rounded-md text-[10px] font-bold">PAID</span>
                                </td>
                                <td class="px-6 py-4 text-sm font-bold text-slate-900">$1,200.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="bg-white rounded-xl border border-slate-200 shadow-sm p-6">
                <h3 class="font-bold text-slate-800 mb-6">Inventory Status</h3>
                <div class="space-y-6">
                    <div>
                        <div class="flex justify-between text-sm mb-2">
                            <span class="text-slate-600">Warehousing Capacity</span>
                            <span class="font-bold">78%</span>
                        </div>
                        <div class="w-full bg-slate-100 rounded-full h-2">
                            <div class="bg-blue-600 h-2 rounded-full" style="width: 78%"></div>
                        </div>
                    </div>

                    <div class="pt-4 border-t border-slate-100">
                        <h4 class="text-xs font-bold text-slate-400 uppercase mb-4">Quick Actions</h4>
                        <div class="grid grid-cols-2 gap-3">
                            <Link href="/products/create" class="flex flex-col items-center p-3 rounded-lg border border-slate-100 hover:bg-slate-50 transition text-center">
                                <Package class="w-5 h-5 text-slate-600 mb-1" />
                                <span class="text-[10px] font-bold text-slate-700">Add Stock</span>
                            </Link>
                            <button class="flex flex-col items-center p-3 rounded-lg border border-slate-100 hover:bg-slate-50 transition text-center">
                                <ShoppingCart class="w-5 h-5 text-slate-600 mb-1" />
                                <span class="text-[10px] font-bold text-slate-700">New Sale</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthLayout>
</template>
