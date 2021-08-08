<script context="module">
	export const prerender = true;
</script>

<script>
	import { faInbox, faBullhorn, faPencilAlt } from "@fortawesome/free-solid-svg-icons";

	import { scrollRef } from "svelte-scrolling";

	import IndexHero from "$lib/component/IndexHero/index.svelte";
	import Prizes from "$lib/component/Prizes.svelte";
	import Schedule from "$lib/component/Schedule.svelte";
	import Faq from "$lib/component/Faq/index.svelte";
	import Footer from "$lib/component/Footer.svelte";
	import AboutUs from "$lib/component/AboutUs.svelte";

	import HowToJoin from "$lib/component/HowToJoin/index.svelte";

	const detailedSchedule = [
		{
			date: "Senin, 6 Sept 2021",
			events: [
				{
					time: "08:00–09:00",
					event: "Pembukaan",
				},
				{
					time: "09:30–10:30",
					event: "Penyisihan\u00a02",
				},
				{
					time: "17:00",
					event: "Pengumuman Penyisihan\u00a02",
				},
			],
		},
		{
			date: "Selasa, 7 Sept 2021",
			events: [
				{
					time: "09:00–12:00",
					event: "Semifinal Matematika",
				},
				{
					time: "13:00–15:00",
					event: "Semifinal IPA",
				},
			],
		},
		{
			date: "Kamis, 9 Sept 2021",
			events: [
				{
					time: "17:00",
					event: "Pengumuman Semifinal",
				},
			],
		},
		{
			date: "Jumat, 10 Sept 2021",
			events: [
				{
					time: "08:30–12:00",
					event: "Final",
				},
				{
					time: "13:30–14:00",
					event: "Pengumuman Pemenang",
				},
			],
		},
	];
	const simpleSchedule = [
		{
			icon: faInbox,
			event: "Deadline Penyisihan\u00a01",
			date: "1 Sept 2021",
		},
		{
			icon: faBullhorn,
			event: "Hasil Penyisihan\u00A01",
			date: "4 Sept 2021",
		},
		{
			icon: faPencilAlt,
			date: "6 Sept 2021",
			event: "Penyisihan 2",
		},
		{
			icon: faPencilAlt,
			date: "7 Sept 2021",
			event: "Semifinal",
		},
		{
			icon: faPencilAlt,
			date: "10 Sept 2021",
			event: "Final",
		},
	];

	const qnas = [
		{
			q: "Kapan hari terakhir pendaftaran?",
			a: "Rabu, 1 September 2021",
		},
		{
			q: "Bolehkan satu tim untuk seorang saja?",
			a: "Boleh",
		},
		{
			q: "Berapa biaya pendaftaran?",
			a: "Rp 100.000,- per tim s.d. 19 Agustus 2019 dan Rp 150.000,- setelahnya",
		},
		{
			q: "Berapa banyak tim yang akan lolos dari penyisihan 2 ke semifinal?",
			a: "16 tim",
		},
		{
			q: "Berapa banyak tim yang akan lolos dari semifinal ke final?",
			a: "5 tim",
		},
		{
			q: "Apa format Brilliant Competition tahun ini?",
			a:
				"Brilliant Competition mengadakan 2 perlombaan tim, yaitu lomba matematika dan lomba IPA, dengan 1 tim terdiri akan sebanyak-banyaknya 2 orang",
		},
		{
			q: "Apakah ada silabus untuk Brilliant Competition tahun ini?",
			a: "Tidak ada, materi Brilliant Competition tahun ini berkisar materi OSN SMP",
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
