<script>
	export let path;
</script>

<div class="md:hidden" id="mobile-menu">
	<div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
		<a
			sveltekit:prefetch
			href="/"
			class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
			class:mobile-nav-active={path === '/'}
		>
			Home
		</a>

		<a
			sveltekit:prefetch
			href="/about"
			class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
			class:mobile-nav-active={path === '/about'}
		>
			About
		</a>
	</div>
	<div class="pt-4 pb-3 border-t border-gray-700">
		<div class="flex items-center px-5">
			<div class="flex-shrink-0">
				<img
					class="h-10 w-10 rounded-full"
					src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
					alt=""
				/>
			</div>
			<div class="ml-3">
				<div class="text-base font-medium leading-none text-white">Tom Cook</div>
				<div class="text-sm font-medium leading-none text-gray-400">tom@example.com</div>
			</div>
		</div>
	</div>
</div>


<style lang="postcss">
	.mobile-nav-active {
		@apply bg-gray-900 text-white;
	}
</style>
