import tailwindcss from '@tailwindcss/vite';
import vue from '@vitejs/plugin-vue';
import laravel from 'laravel-vite-plugin';
import { defineConfig } from 'vite';
import path from 'path'; // Add this for path resolution

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/js/app.ts'],
            // ssr: 'resources/js/ssr.ts', // Disable this unless you specifically need SSR
            refresh: true,
        }),
        tailwindcss(),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
    resolve: {
        alias: {
            '@': '/resources/js', // Helps resolve your "@/components/..." imports
        },
    },
});
