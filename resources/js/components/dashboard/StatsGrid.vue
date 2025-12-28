<script setup lang="ts">
import { ArrowUpRight, ArrowDownRight, ShoppingCart, Package, Users, DollarSign } from 'lucide-vue-next';

defineProps<{ stats: any }>();
</script>

<template>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div v-for="item in stats" :key="item.label" class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
            <div class="flex items-center justify-between mb-4">
                <div :class="item.bgClass" class="p-2 rounded-lg">
                    <component :is="item.icon" class="w-6 h-6" :class="item.iconClass" />
                </div>
                <span :class="item.trend > 0 ? 'text-green-600' : 'text-red-600'" class="text-xs font-medium flex items-center bg-slate-50 px-2 py-1 rounded-full">
                    <component :is="item.trend > 0 ? ArrowUpRight : ArrowDownRight" class="w-3 h-3 mr-1" />
                    {{ Math.abs(item.trend) }}%
                </span>
            </div>
            <p class="text-slate-500 text-sm font-medium">{{ item.label }}</p>
            <h3 class="text-2xl font-bold text-slate-900 mt-1">{{ item.value }}</h3>
        </div>
    </div>
</template>
