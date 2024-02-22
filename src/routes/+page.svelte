<script lang="ts">
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import { slide } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
	import Dropdown from '$lib/components/Dropdown.svelte';

	const domains = [
		{
			href: 'https://trev.xyz/',
			tld: 'xyz'
		},
		{
			href: 'https://trev.kiwi/',
			tld: 'kiwi'
		},
		{
			href: 'https://trev.zip/',
			tld: 'zip'
		},
		{
			href: 'https://xn--rev-g0a.com/',
			tld: 'com'
		}
	];
	let activeDomain = domains.find((domain) => domain.href === $page.url.href) ?? domains[0];
	const currentDomain = domains.find((domain) => domain.href === $page.url.href) ?? domains[0];

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

<div class="flex flex-col items-center justify-center h-screen bg-black">
	<a href={activeDomain.href} class="flex items-center h-24">
		<h1 class="font-sans text-5xl font-bold text-white z-10">trev.</h1>
		<div class="w-24 content-center grid cols-start-1 cols-end-2 rows-start-1 rows-end-2">
			{#key activeDomain}
				<div
					transition:slide={{ duration: 1000, easing: quintOut }}
					class="text-5xl font-bold text-white z-10 h-24 flex items-center"
				>
					{activeDomain.tld}
				</div>
			{/key}
		</div>
	</a>
	{#if currentDomain.tld == 'xyz'}
		<Dropdown title="xyz" desc="misc" statusurl="https://status.trev.xyz/status/xyz" />
	{:else if currentDomain.tld == 'kiwi'}
		<Dropdown title="kiwi" desc="public" statusurl="https://status.trev.kiwi/status/kiwi" />
	{:else if currentDomain.tld == 'zip'}
		<Dropdown title="zip" desc="storage" statusurl="https://status.trev.zip/status/zip" />
	{:else if currentDomain.tld == 'com'}
		<Dropdown title="com" desc="hidden" statusurl="https://status.xn--rev-g0a.com/status/com" />
	{/if}
</div>
