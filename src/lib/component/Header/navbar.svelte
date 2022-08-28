<script>
	import logo from "./wide-logo-small.png";
	import { scrollTo } from "svelte-scrolling";
</script>

<div class="flex items-center">
	<div class="flex-shrink-0">
		<a sveltekit:prefetch href="/">
			<img class="h-12 w-auto" alt="bcomp" src={logo} />
		</a>
	</div>

	<div class="hidden md:block">
		<div class="ml-10 flex items-baseline space-x-4">
			<a
				sveltekit:prefetch
				use:scrollTo={"announcement"}
				class="cursor-pointer px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
			>
				Announcement
			</a>
			<a
				sveltekit:prefetch
				use:scrollTo={"about-us"}
				class="cursor-pointer px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
			>
				About Us
			</a>
			<a
				sveltekit:prefetch
				use:scrollTo={"prizes"}
				class="cursor-pointer px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
			>
				Prizes
			</a>
			<a
				sveltekit:prefetch
				use:scrollTo={"schedule"}
				class="cursor-pointer px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
			>
				Schedule
			</a>
			<a
				sveltekit:prefetch
				use:scrollTo={"howto"}
				class="cursor-pointer px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
			>
				Rules
			</a>
			<a
				sveltekit:prefetch
				use:scrollTo={"faq"}
				class="cursor-pointer px-3 py-2 rounded-md text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white;"
			>
				FAQ
			</a>
		</div>
	</div>
</div>

<style lang="postcss">
	.nav-active {
		@apply bg-gray-900 text-white;
	}
</style>
