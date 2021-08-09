<script context="module">
	export const prerender = true;
</script>

<script>
	import { scrollRef } from "svelte-scrolling";

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

	const elimParticipants = [
		{
			members: ["Otto Alexander Sutianto", "Bukan Otto Alexande"],
			school: "Suatu Sekolah Di Solo",
		},
		{
			members: ["Jerrell Ezralemuel", "Bukan Temannya Otto Lagi"],
			school: "Disanalah kira kira ",
		},
	];
</script>

<svelte:head>
	<title>Brilliant Competition XIII</title>
</svelte:head>

<div class="pt-16" use:scrollRef={"top-index"}>
	<IndexHero />
</div>
<div class="container mx-auto">
	<div class="max-w-7xl px-4 sm:px-6 lg:px-8 mx-auto space-y-0">
		<div class=" max-w-4xl shadow-md rounded-xl bg-white p-4 m-4 mx-auto">
			<p class="font-barlow text-lg text-justify">
				Brilliant Competition (BComp) adalah kegiatan kompetisi olimpiade untuk bidang Matematika
				dan IPA tingkat SMP berskala nasional yang akan diselenggarakan untuk ketiga belas kalinya
				di SMAK PENABUR Gading Serpong. Brilliant Competition XII sebelumnya diikuti oleh ratusan
				peserta dari sembilan provinsi dan lebih dari 60 sekolah yang tersebar di Indonesia.
			</p>
		</div>

		{#if false}
			<div class="-mt-16 pt-16" use:scrollRef={"announcement"}>
				<h1 class="font-montserrat text-gray-700 italic text-center text-5xl font-black md:mb-0">
					ANNOUNCEMENT
				</h1>
				<div class=" max-w-4xl shadow rounded bg-white px-4 pb-4 m-4 mx-auto">
					<div class="flex flex-row mb-3">
						<div class=" w-24 bg-lavender text-center rounded-b py-2">
							<span class="font-barlow-semi text-gray-700 text-2xl"> 16 Oct </span>
						</div>
						<div class="font-barlow-semi mx-auto text-2xl pt-2">Deadline Pengumpulan Diundur</div>
					</div>
					<p class="font-barlow text-lg">Deadline pengumpulan diundur hingga 4 September 2021</p>
				</div>
				<div class=" max-w-4xl shadow rounded bg-white px-4 pb-4 m-4 mx-auto">
					<div class="flex flex-row mb-3">
						<div class=" w-24 bg-lavender text-center rounded-b py-2">
							<span class="font-barlow-semi text-gray-700 text-2xl"> 16 Oct </span>
						</div>
						<div class="font-barlow-semi mx-auto text-2xl pt-2">Pengumuman Penyisihan 1</div>
					</div>
					<p class="font-barlow font-bold text-lg">Daftar peserta yang lolos penyisihan 1</p>
					<table class="table-auto w-full">
						<tr class="border-b-2 border-gray-600">
							<th>Rank</th>
							<th>Peserta</th>
							<th>Sekolah</th>
						</tr>
						{#each elimParticipants as { members, school }, i}
							<tr class="border-b-2 border-gray-400">
								<td class="px-2 text-center font-bold">{i + 1} </td>
								<td class="px-2">{members.join(", ")}</td>
								<td class="px-2">{school}</td>
							</tr>
						{/each}
					</table>
				</div>
			</div>
		{/if}

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
