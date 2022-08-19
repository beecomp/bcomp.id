<script context="module">
	export const prerender = true;
</script>

<script>
	import { scrollRef } from "svelte-scrolling";

	import { slide } from "svelte/transition";
	import IndexHero from "$lib/component/IndexHero/index.svelte";
	import Prizes from "$lib/component/Prizes.svelte";
	import Schedule from "$lib/component/Schedule.svelte";
	import Faq from "$lib/component/Faq/index.svelte";
	import Footer from "$lib/component/Footer.svelte";
	import AboutUs from "$lib/component/AboutUs.svelte";
	import HowToJoin from "$lib/component/HowToJoin/index.svelte";
	import simpleSchedule from "$lib/data/simple-schedule";
	import detailedSchedule from "$lib/data/detailed-schedule";
	import qnas from "$lib/data/qnas";
	import Icon from "fa-svelte";
	import { faChevronDown, faChevronUp } from "@fortawesome/free-solid-svg-icons";

	let showDetailedMat = false;
	const elimParticipantsMat = [
		{
			code: "",
			names: [""],
			school: "",
		},
	];

	let showDetailedSci = false;
	const elimParticipantsSci = [
		{
			code: "",
			names: [""],
			school: "",
		},
	];
</script>

<svelte:head>
	<title>Brilliant Competition XIV</title>
</svelte:head>

<div class="pt-16" use:scrollRef={"top-index"}>
	<IndexHero />
</div>

<div class="container mx-auto">
	<div class="max-w-7xl px-4 sm:px-6 lg:px-8 mx-auto space-y-0">
		<div class=" max-w-4xl shadow-md rounded-xl bg-orangeishyellow p-4 m-4 mx-auto">
			<p class="font-barlow text-lg text-white">
				Brilliant Competition (BComp) adalah kegiatan kompetisi olimpiade untuk bidang Matematika
				dan IPA tingkat SMP berskala nasional yang akan diselenggarakan untuk ketiga belas kalinya
				di SMAK PENABUR Gading Serpong. Brilliant Competition XIII sebelumnya diikuti oleh ratusan
				peserta dari sembilan provinsi dan lebih dari 60 sekolah yang tersebar di Indonesia.
			</p>
		</div>

		<div class="-mt-16 pt-16" use:scrollRef={"announcement"}>
			<h1 class="font-montserrat text-WhiteL italic text-center text-4xl font-black md:mb-0">
				ANNOUNCEMENT
			</h1>
			<h1 class="font-montserrat text-WhiteL text-center text-3xl font-black md:mb-0 pt-8">
				Pengumuman Lolos Penyisihan 1
			</h1>
			<div class=" max-w-4xl shadow rounded bg-orangeishyellow p-4 md:p-8 m-4 mx-auto">
				<p class="font-montserrat font-bold text-lg text-2xl text-white">Matematika</p>
				<!-- {#if showDetailedMat}
					<div class="py-4" transition:slide={{ duration: 0 }}> -->
				<table class="table-auto w-full">
					<tr class="text-white border-b-2 border-white">
						<th>No</th>
						<th>Kode Tim</th>
						<th>Nama Peserta</th>
						<th>Sekolah</th>
					</tr>
					{#each elimParticipantsMat as { code, names, school }, i}
						<tr class="border-b-2 border-white text-white">
							<td class="px-2 text-center">{i + 1}</td>
							<td class="px-2 text-center">{code}</td>
							<td class="px-2 text">{names.join(", ")}</td>
							<td class="px-2 text">{school}</td>
						</tr>
					{/each}
				</table>
			</div>
			<div class=" max-w-4xl shadow rounded bg-orangeishyellow p-4 md:p-8 m-4 mx-auto">
				<div class="flex flex-row mb-3" />
				<p class="font-montserrat font-bold text-lg text-2xl text-white">IPA</p>
				<!-- {#if showDetailedSci}
					<div class="py-4" transition:slide={{ duration: 0 }}> -->
				<table class="table-auto w-full">
					<tr class="border-b-2 border-white text-white">
						<th>No</th>
						<th>Kode Tim</th>
						<th>Nama Peserta</th>
						<th>Sekolah</th>
					</tr>
					{#each elimParticipantsSci as { code, names, school }, i}
						<tr class="border-b-2 border-white text-white">
							<td class="px-2 text-center">{i + 1}</td>
							<td class="px-2 text-center">{code}</td>
							<td class="px-2 text">{names.join(", ")}</td>
							<td class="px-2 text">{school}</td>
						</tr>
					{/each}
				</table>
				<!-- </div>
				{/if} -->

				<!-- <div class="flex justify-center">
					<button
						type="button"
						class="btn mt-3 w-full max-w-md"
						on:click={() => (showDetailedSci = !showDetailedSci)}
					>
						<Icon icon={showDetailedSci ? faChevronUp : faChevronDown} class="mx-4 text-white" />
						{showDetailedSci ? "Sembunyikan" : "Selengkapnya"}
						<Icon icon={showDetailedSci ? faChevronUp : faChevronDown} class="mx-4 text-white" />
					</button>
				</div> -->
			</div>
		</div>

		<div class="-mt-16 pt-16" use:scrollRef={"prizes"}>
			<Prizes />
		</div>
		<div class="-mt-16 pt-16" use:scrollRef={"schedule"}>
			<Schedule simple={simpleSchedule} detailed={detailedSchedule} />
		</div>
		<div class="-mt-16 pt-16" use:scrollRef={"howto"}>
			<HowToJoin />
		</div>
		<div class="-mt-16 pt-16" use:scrollRef={"faq"}>
			<Faq {qnas} />
		</div>
		<div class="-mt-16 pt-16" use:scrollRef={"about-us"}>
			<AboutUs />
		</div>
	</div>
</div>
<Footer />

<style lang="postcss">
	.btn {
		@apply font-barlow font-medium py-2 px-4 bg-coral hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-yellow-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded;
	}
</style>
