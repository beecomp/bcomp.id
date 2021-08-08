<script>
	import Icon from "fa-svelte";
	import { slide } from "svelte/transition";
	import { faChevronDown, faChevronUp } from "@fortawesome/free-solid-svg-icons";
	export let q;
	export let a;

	let show = false;
</script>

<div on:click={() => (show = !show)} class="shadow-md rounded-md bg-white dark:bg-gray-800 p-3">
	<div class="flex-row gap-4 flex justify-center items-start">
		<div class=" flex flex-col flex-grow">
			<span class="text-gray-800 dark:text-white text-sm font-bold">{q}</span>
			{#if show}
				<div transition:slide={{ duration: 200 }}>
					<p class="mt-1 text-sm">{a}</p>
				</div>
			{/if}
		</div>
		<div class="flex-shrink-0">
			<Icon icon={show ? faChevronUp : faChevronDown} class="mx-4 text-sm text-black" />
		</div>
	</div>
</div>
