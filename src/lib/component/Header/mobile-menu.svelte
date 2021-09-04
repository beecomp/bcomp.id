<script>
	import { scrollTo } from "svelte-scrolling";
</script>

<div class="px-2 pt-2 pb-3 space-y-1 sm:px-3" id="mobile-menu">
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
		Rules
	</a>
	<a
		sveltekit:prefetch
		use:scrollTo={"faq"}
		class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
	>
		FAQ
	</a>
	<a
		sveltekit:prefetch
		use:scrollTo={"about-us"}
		class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium"
	>
		About Us
	</a>
</div>
