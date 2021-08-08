<script>
	import { slide } from "svelte/transition";
	import Icon from "fa-svelte";
	import { faChevronDown, faChevronUp } from "@fortawesome/free-solid-svg-icons";

	let showDetailed = false;
	export let simple;
	export let detailed;
</script>

<h1 class="font-montserrat font-black text-gray-700 italic text-center text-5xl mt-6">SCHEDULE</h1>
<div
	class="flex flex-col md:flex-row items-center md:items-stretch md:space-x-3 space-y-2 md:space-y-0 mt-3"
>
	{#each simple as { icon, event, date }}
		<div class="bg-coral rounded p-2 max-w-sm w-full filter shadow-lg">
			<div class="flex flex-row md:flex-col items-center">
				<Icon {icon} class="text-5xl mx-8 md:mt-2 text-white" />
				<div class="flex flex-col md:items-center md:mt-2">
					<div class="font-barlow-semi text-white font-bold mt-1 md:text-center">
						{event.toUpperCase()}
					</div>
					<div class="font-barlow-semi text-white font-bold text-xl md:text-center">
						{date}
					</div>
				</div>
			</div>
		</div>
	{/each}
</div>
<div class="flex flex-col items-center mt-1">
	{#if showDetailed}
		<div transition:slide={{ duration: 500 }}>
			<table>
				{#each detailed as { date, events }}
					<tr>
						<th
							class="font-barlow italic font-bold text-lg pt-3 border-b-2 border-gray-500"
							colspan="2">{date}</th
						>
					</tr>
					{#each events as { time, event }}
						<tr class>
							<td class="font-barlow text-right font-bold">{time}</td>
							<td class="font-barlow px-2">{event}</td>
						</tr>
					{/each}
				{/each}
			</table>
		</div>
	{/if}
	<button
		type="button"
		class="btn mt-3 w-full max-w-md"
		on:click={() => (showDetailed = !showDetailed)}
	>
		<Icon icon={showDetailed ? faChevronUp : faChevronDown} class="mx-4 text-white" />
		{showDetailed ? "Sembunyikan" : "Selengkapnya"}
		<Icon icon={showDetailed ? faChevronUp : faChevronDown} class="mx-4 text-white" />
	</button>
</div>

<style lang="postcss">
	.btn {
		@apply font-barlow font-medium py-2 px-4 bg-coral hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-yellow-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded;
	}
</style>
