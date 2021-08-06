<script>
	export let path;
</script>

<div class="md:hidden" id="mobile-menu">
	<div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
		<a
			sveltekit:prefetch
			use:scrollTo={"top-index"}
			class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
		>
			Home
		</a>

		<a
			sveltekit:prefetch
			use:scrollTo={"prizes"}
			class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
		>
			Prizes
		</a>
		<a
			sveltekit:prefetch
			use:scrollTo={"schedule"}
			class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
		>
			Schedule
		</a>
		<a
			sveltekit:prefetch
			use:scrollTo={"howto"}
			class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
		>
			Howto
		</a>
		<a
			sveltekit:prefetch
			use:scrollTo={"about-us"}
			class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
		>
			About Us
		</a>
	</div>
</div>

<style lang="postcss">
	.mobile-nav-active {
		@apply bg-gray-900 text-white;
	}
</style>
