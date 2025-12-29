<script setup>
import { ref, computed } from 'vue';
import AuthLayout from '@/layouts/AuthLayout.vue'; // Using your existing Layout
import { usePage, Head, router } from '@inertiajs/vue3';
import {
    ShieldCheck, Box, ShoppingCart, FileText, Users, Lock,
    ChevronDown, ChevronRight, Search, CheckSquare, Square
} from 'lucide-vue-next'; //

const props = defineProps({
    roles: Array,
    groupedPermissions: Object
});

const searchQuery = ref('');
const expandedRoles = ref(new Set([props.roles[0]?.id]));
const expandedTools = ref(new Set());

// --- BULK ACTION LOGIC ---

const toggleModuleAll = (role, groupName, permissions) => {
    let currentNames = role.permissions.map(p => p.name);
    const modulePermNames = permissions.map(p => p.name);

    // Check if all permissions in this module are already selected
    const allSelected = modulePermNames.every(name => currentNames.includes(name));

    if (allSelected) {
        // Unselect all in this module
        currentNames = currentNames.filter(name => !modulePermNames.includes(name));
    } else {
        // Select all in this module (avoiding duplicates)
        currentNames = [...new Set([...currentNames, ...modulePermNames])];
    }

    router.put(`/admin/roles/${role.id}`, { permissions: currentNames }, { preserveScroll: true });
};

// --- PERMISSION FILTERING ---

const filteredGroups = computed(() => {
    if (!searchQuery.value) return props.groupedPermissions;

    const filtered = {};
    const query = searchQuery.value.toLowerCase();

    Object.entries(props.groupedPermissions).forEach(([group, perms]) => {
        const matchingPerms = perms.filter(p => p.name.toLowerCase().includes(query));
        if (matchingPerms.length > 0 || group.toLowerCase().includes(query)) {
            filtered[group] = matchingPerms;
        }
    });
    return filtered;
});

// --- TOGGLE & SAVE LOGIC ---

const toggleRole = (id) => expandedRoles.value.has(id) ? expandedRoles.value.delete(id) : expandedRoles.value.add(id);
const toggleTool = (roleId, group) => {
    const key = `${roleId}-${group}`;
    expandedTools.value.has(key) ? expandedTools.value.delete(key) : expandedTools.value.add(key);
};

const togglePermission = (role, permissionName) => {
    let currentNames = role.permissions.map(p => p.name);
    currentNames.includes(permissionName)
        ? currentNames = currentNames.filter(n => n !== permissionName)
        : currentNames.push(permissionName);

    router.put(`/admin/roles/${role.id}`, { permissions: currentNames }, { preserveScroll: true });
};
</script>

<template>
    <AuthLayout>

    <Head title="Role Management" />

        <div class="min-h-screen bg-slate-50 p-6">
            <div class="max-w-5xl mx-auto">

                <div class="mb-8 flex flex-col md:flex-row md:items-center justify-between gap-4">
                    <div>
                        <h1 class="text-2xl font-bold text-slate-900">Access Control List</h1>
                        <p class="text-slate-500 text-sm">Define what each role can see and do.</p>
                    </div>

                    <div class="relative">
                        <Search class="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                        <input v-model="searchQuery" type="text" placeholder="Search permissions..."
                            class="pl-10 pr-4 py-2 bg-white border border-slate-200 rounded-xl text-sm focus:ring-2 focus:ring-indigo-500 outline-none w-full md:w-64 transition-all" />
                    </div>
                </div>

                <div class="space-y-4">
                    <div v-for="role in roles" :key="role.id"
                        class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">

                        <button @click="toggleRole(role.id)"
                            class="w-full flex items-center justify-between p-5 hover:bg-slate-50 transition-colors">
                            <div class="flex items-center gap-4">
                                <ShieldCheck class="w-6 h-6 text-indigo-600" />
                                <span class="text-lg font-bold text-slate-800">{{ role.name }}</span>
                            </div>
                            <ChevronDown :class="{ 'rotate-180': expandedRoles.has(role.id) }"
                                class="w-5 h-5 text-slate-300 transition-transform" />
                        </button>

                        <div v-if="expandedRoles.has(role.id)" class="p-4 bg-slate-50/50 space-y-3">
                            <div v-for="(perms, group) in filteredGroups" :key="group"
                                class="bg-white border border-slate-200 rounded-xl">

                                <div class="flex items-center justify-between p-3 border-b border-slate-50">
                                    <button @click="toggleTool(role.id, group)"
                                        class="flex items-center gap-2 font-bold text-slate-700 capitalize text-sm">
                                        <ChevronRight :class="{ 'rotate-90': expandedTools.has(`${role.id}-${group}`) }"
                                            class="w-4 h-4 transition-transform" />
                                        {{ group }}
                                    </button>

                                    <button @click="toggleModuleAll(role, group, perms)"
                                        class="text-[10px] font-bold uppercase px-2 py-1 rounded hover:bg-indigo-50 text-indigo-600 transition-colors flex items-center gap-1">
                                        <CheckSquare class="w-3 h-3" />
                                        Toggle All
                                    </button>
                                </div>

                                <div v-show="expandedTools.has(`${role.id}-${group}`)"
                                    class="p-4 grid grid-cols-2 md:grid-cols-3 gap-3">
                                    <label v-for="perm in perms" :key="perm.id"
                                        class="flex items-center gap-2 p-2 rounded-lg hover:bg-slate-50 cursor-pointer border border-transparent hover:border-slate-100 transition-all">
                                        <input type="checkbox" :checked="role.permissions.some(p => p.id === perm.id)"
                                            @change="togglePermission(role, perm.name)"
                                            class="w-4 h-4 text-indigo-600 rounded border-slate-300 focus:ring-indigo-500" />
                                        <span class="text-xs text-slate-600 font-medium capitalize">{{
                                            perm.name.split('.')[1] || perm.name }}</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthLayout>
</template>
