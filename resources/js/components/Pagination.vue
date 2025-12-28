<script setup lang="ts">
import { Link } from '@inertiajs/vue3';

// 1. Define an interface for the Link object
interface PaginationLink {
    url: string | null;
    label: string;
    active: boolean;
}

// 2. Use withDefaults to provide an empty array if links is missing
const props = withDefaults(defineProps<{
    links?: PaginationLink[];
}>(), {
    links: () => []
});
</script>

<template>
    <div v-if="links.length > 3">
        <div class="flex flex-wrap mt-8">
            <template v-for="(link, key) in links" :key="key">
                <div v-if="link.url === null"
                     class="mr-1 mb-1 px-4 py-3 text-sm leading-4 text-gray-400 border rounded"
                     v-html="link.label" />

                <Link v-else
                      class="mr-1 mb-1 px-4 py-3 text-sm leading-4 border rounded hover:bg-white focus:border-indigo-500 focus:text-indigo-500 transition-colors"
                      :class="{ 'bg-blue-600 text-white border-blue-600': link.active }"
                      :href="link.url"
                      v-html="link.label" />
            </template>
        </div>
    </div>
</template>
