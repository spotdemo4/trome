<script lang="ts">
	import { ChevronDown, ChevronUp } from 'lucide-svelte';
	import { slide } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';

	export let title: string;
	export let desc: string;
	export let statusurl: string;
	let hidden = true;
</script>

<button
	class="text-lg text-gray-200 z-10 flex items-center gap-1"
	on:click={() => {
		hidden = !hidden;
	}}
>
	{title} - {desc}
	{#if hidden}<ChevronUp />{:else}<ChevronDown />{/if}
</button>
{#if !hidden}
	<iframe
		src={statusurl}
		title="status"
		class="w-3/4 md:w-1/2 h-1/2 z-10 rounded-xl mt-2"
		transition:slide={{ duration: 1000, easing: quintOut }}
	/>
{/if}
