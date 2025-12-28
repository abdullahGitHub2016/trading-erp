<script setup lang="ts">
import { ref, watch } from 'vue';
import { usePage } from '@inertiajs/vue3';
import { AppPageProps } from '@/types';
import { CheckCircle, AlertCircle, X } from 'lucide-vue-next';

const show = ref(false);
const message = ref('');
const type = ref<'success' | 'error'>('success');
const page = usePage<AppPageProps>();

const hide = () => {
    show.value = false;
};

// Listen for flash messages
watch(
    () => page.props.flash,
    (flash) => {
        if (flash?.message || flash?.error) {
            message.value = (flash.message || flash.error) as string;
            type.value = flash.error ? 'error' : 'success';
            show.value = true;

            // Auto-hide after 4 seconds
            setTimeout(() => {
                show.value = false;
            }, 4000);
        }
    },
    { deep: true, immediate: true }
);
</script>

<template>
    <div
        aria-live="assertive"
        class="pointer-events-none fixed inset-0 flex items-end px-4 py-6 sm:items-start sm:p-6 z-[9999]"
    >
        <div class="flex w-full flex-col items-center space-y-4 sm:items-end">
            <Transition
                enter-active-class="transform ease-out duration-300 transition"
                enter-from-class="translate-y-2 opacity-0 sm:translate-y-0 sm:translate-x-2"
                enter-to-class="translate-y-0 opacity-100 sm:translate-x-0"
                leave-active-class="transition ease-in duration-100"
                leave-from-class="opacity-100"
                leave-to-class="opacity-0"
            >
                <div v-if="show" class="pointer-events-auto w-full max-w-sm overflow-hidden rounded-xl bg-white shadow-2xl ring-1 ring-black ring-opacity-5">
                    <div class="p-4">
                        <div class="flex items-start">
                            <div class="flex-shrink-0">
                                <CheckCircle v-if="type === 'success'" class="h-6 w-6 text-green-500" />
                                <AlertCircle v-else class="h-6 w-6 text-red-500" />
                            </div>
                            <div class="ml-3 w-0 flex-1 pt-0.5">
                                <p class="text-sm font-bold text-gray-900">
                                    {{ type === 'success' ? 'Success!' : 'System Error' }}
                                </p>
                                <p class="mt-1 text-sm text-gray-500">{{ message }}</p>
                            </div>
                            <div class="ml-4 flex flex-shrink-0">
                                <button type="button" @click="hide" class="inline-flex rounded-md bg-white text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    <X class="h-5 w-5" />
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="h-1 w-full bg-gray-100">
                        <div
                            class="h-full transition-all duration-100"
                            :class="type === 'success' ? 'bg-green-500 animate-progress' : 'bg-red-500 animate-progress'"
                        ></div>
                    </div>
                </div>
            </Transition>
        </div>
    </div>
</template>

<style scoped>
@keyframes progress {
    from { width: 100%; }
    to { width: 0%; }
}
.animate-progress {
    animation: progress 4s linear forwards;
}
</style>
