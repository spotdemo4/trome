<script lang="ts">
	import { onMount } from 'svelte';
	import { slide, fade } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';

	const domains = ['xyz', 'zip', 'kiwi'];
	let activeDomain = domains[0];

	function changeDomain() {
		const index = domains.indexOf(activeDomain);
		activeDomain = domains[(index + 1) % domains.length];
	}

	setInterval(changeDomain, 5000);

	onMount(() => {
		// @ts-ignore
		tsParticles.load({
			id: 'tsparticles',
			options: {
				preset: 'stars',
                particles: {
                    move: {
                        speed: 0.5
                    }
                }
			}
		});
	});
</script>

<svelte:head>
	<script
		src="https://cdn.jsdelivr.net/npm/@tsparticles/preset-stars@3/tsparticles.preset.stars.bundle.min.js"
	></script>
</svelte:head>

<div class="flex items-center justify-center h-screen bg-black">
	<h1 class="text-5xl font-bold text-white z-10">trev.</h1>
	<div class="w-24 content-center grid cols-start-1 cols-end-2 rows-start-1 rows-end-2">
		{#key activeDomain}
			<div
				transition:slide={{ duration: 1000, easing: quintOut }}
				class="text-5xl font-bold text-white z-10 h-24 flex items-center"
			>
				{activeDomain}
			</div>
		{/key}
	</div>
</div>
