<script>
	import { onMount } from 'svelte';
	import { slide } from "svelte/transition";
	import { page } from "$app/stores";
	import Navbar from "./navbar.svelte";
	import MobileNavbar from "./mobile-navbar.svelte";
	import MobileMenu from "./mobile-menu.svelte";
	import ss from "svelte-scrolling";

	let expanded = false;

	onMount(async () => {
		ss.setGlobalOptions({
			offset: -80,
		});
	});
</script>

<nav>
	<div class="fixed bg-gray-800 w-full z-40 filter drop-shadow-xl">
		<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
			<div class="flex items-center justify-between h-16">
				<Navbar path={$page.path} />
				<MobileNavbar bind:value={expanded} />
			</div>
		</div>

		{#if expanded}
			<div transition:slide={{ duration: 200 }}>
				<MobileMenu />
			</div>
		{/if}
	</div>
</nav>
