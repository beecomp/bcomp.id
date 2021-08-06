<script>
	import logo from './wide-logo-small.png';
	export let path;
</script>

<div class="flex items-center">
	<div class="flex-shrink-0">
		<img
			class="h-12 w-auto"
			alt="bcomp"
			src={logo}
		/>
	</div>
	<div class="hidden md:block">
		<div class="ml-10 flex items-baseline space-x-4">
			<a
				sveltekit:prefetch
				href="/"
				class="px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
				class:nav-active={path === '/'}
			>
				Home
			</a>
			<a
				sveltekit:prefetch
				href="/about"
				class="px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
				class:nav-active={path === '/about'}
			>
				About
			</a>
			<a
				sveltekit:prefetch
				href="/about"
				class="px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;" class:nav-active={path === '/about'}
			>
				Prizes
			</a>		</div>
	</div>
</div>
<style lang="postcss">
	.nav-active {
		@apply bg-gray-900 text-white;
	}
</style>
