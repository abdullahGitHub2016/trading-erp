<script setup>
import { AlertTriangle, X } from 'lucide-vue-next';

defineProps({
    show: Boolean,
    title: { type: String, default: 'Confirm Deletion' },
    message: { type: String, default: 'Are you sure you want to delete this item? This action cannot be undone.' }
});

defineEmits(['close', 'confirm']);
</script>

<template>
    <div v-if="show" class="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-900/50 backdrop-blur-sm">
        <div class="bg-white rounded-2xl shadow-2xl max-w-md w-full overflow-hidden transform transition-all">
            <div class="p-6">
                <div class="flex items-center gap-4 mb-4">
                    <div class="p-3 bg-red-50 rounded-full text-red-600">
                        <AlertTriangle class="w-6 h-6" />
                    </div>
                    <h3 class="text-xl font-bold text-slate-900">{{ title }}</h3>
                </div>
                <p class="text-slate-500 leading-relaxed">{{ message }}</p>
            </div>

            <div class="bg-slate-50 p-4 flex justify-end gap-3">
                <button
                    @click="$emit('close')"
                    class="px-5 py-2 text-sm font-bold text-slate-600 hover:bg-slate-200 rounded-lg transition"
                >
                    Cancel
                </button>
                <button
                    @click="$emit('confirm')"
                    class="px-5 py-2 text-sm font-bold bg-red-600 text-white hover:bg-red-700 rounded-lg shadow-lg shadow-red-200 transition"
                >
                    Yes, Delete
                </button>
            </div>
        </div>
    </div>
</template>
