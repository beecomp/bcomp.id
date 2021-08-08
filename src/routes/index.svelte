<script context="module">
	export const prerender = true;
</script>

<script>
	import { faInbox, faBullhorn, faPencilAlt } from "@fortawesome/free-solid-svg-icons";
	import bca from "./bca.svg";

	import { scrollRef } from "svelte-scrolling";

	import IndexHero from "$lib/component/IndexHero/index.svelte";
	import Prizes from "$lib/component/Prizes.svelte";
	import Schedule from "$lib/component/Schedule.svelte";
	import FaqBox from "$lib/component/FaqBox.svelte";
	import Footer from "$lib/component/Footer.svelte";

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
	const schedule = [
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

	const faq = [
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
	<title>BCOMP XIII</title>
</svelte:head>

<div class="pt-16" use:scrollRef={"top-index"}>
	<IndexHero />
</div>
<div class="container mx-auto">
	<div class="max-w-7xl px-4 sm:px-6 lg:px-8 mx-auto">
		<div class=" max-w-4xl shadow-md rounded-xl bg-white p-4 m-4 mx-auto">
			<p class="font-barlow text-lg text-justify">
				Brilliant Competition (BComp) adalah kegiatan kompetisi olimpiade untuk bidang Matematika
				dan IPA tingkat SMP berskala nasional yang akan diselenggarakan untuk ketiga belas kalinya
				di SMAK PENABUR Gading Serpong. Brilliant Competition XII sebelumnya diikuti oleh ratusan
				peserta dari sembilan provinsi dan lebih dari 60 sekolah yang tersebar di Indonesia.
			</p>
		</div>

		<div class="-mt-12 pt-12" use:scrollRef={"prizes"}>
			<Prizes />
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"schedule"}>
			<Schedule simple={schedule} detailed={detailedSchedule} />
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"howto"}>
			<h1 class="font-montserrat italic text-center text-5xl mt-6 text-gray-700">HOW TO JOIN</h1>
			<h2 class="font-montserrat text-center text-2xl font-black mt-3 mb-2">Baca Guidebook</h2>
			<div class="flex flex-row justify-center space-x-4">
				<a
					target="_blank"
					rel="noreferrer"
					href="https://drive.google.com/file/d/10GRm2eks2lfOsvNUaNJfqkhg_0nZxn8b/view"
					class="btn w-48"
				>
					Guidebook
				</a>
			</div>

			<h2 class="font-montserrat text-center text-2xl font-black mt-6">
				Bayar <span class="line-through text-gray-400"> Rp 150.000 </span>

				Rp 100.000,- per tim
			</h2>
			<div class="font-montserrat text-center text-lg">(Harga spesial s.d. 19 Agustus 2019)</div>
			<div class="flex flex-row justify-center mt-2">
				<div class="w-72 shadow-lg rounded bg-white dark:bg-gray-800 p-4">
					<div class="flex-row gap-4 flex justify-center items-center">
						<div class="flex-shrink-0">
							<img alt="BCA" src={bca} class="mx-auto object-cover rounded-full h-16 w-16 " />
						</div>
						<div class=" flex flex-col">
							<span class="font-barlow font-semibold text-gray-800 dark:text-white text-lg"
								>6050 5757 97</span
							>
							<span class="font-barlow text-gray-700 text-xs"> Lucia Helda Sofyananigrum </span>
							<span class="font-barlow text-gray-700 text-xs"> Dimas Ambrosius Kridhananda </span>
						</div>
					</div>
				</div>
			</div>

			<h2 class="font-montserrat text-center text-2xl mt-6">Isi form pendaftaran</h2>
			<div class="flex flex-row justify-center mt-2">
				<a
					target="_blank"
					rel="noreferrer"
					href="https://docs.google.com/forms/d/e/1FAIpQLSfcbC-AjV7EHEh3PuyCWZPm_9ZOLvhLQlMi_4ocHeUky9wqpw/viewform"
					class="btn w-64"
				>
					Kerjakan Form
				</a>
			</div>

			<h2 class="font-montserrat text-center text-2xl mt-6 mb-2">Kerjakan Soal</h2>
			<div class="flex flex-row justify-center space-x-4">
				<a
					target="_blank"
					rel="noreferrer"
					href="https://drive.google.com/file/d/1PuC-VFzFnyR0gHyKNrXs3fNSSWTAuVZa/view"
					class="btn w-40"
				>
					Soal MAT
				</a>
				<a
					target="_blank"
					rel="noreferrer"
					href="https://drive.google.com/file/d/1Bh883igKqC0qVdCssnT69AdgNMlvyYKm/view"
					class="btn w-40"
				>
					Soal IPA
				</a>
			</div>
			<div class="flex flex-row justify-center space-x-4 mt-2">
				<a
					target="_blank"
					rel="noreferrer"
					href="https://drive.google.com/file/d/1xNjNc4sgMWXRk_T5rOeZbeWb5pGAxUqg/view"
					class="btn w-40"
				>
					LJ MAT
				</a>
				<a
					target="_blank"
					rel="noreferrer"
					href="https://drive.google.com/file/d/1BlLUZS4869F_KjgzGHHUODjyXuLQJKi3/view"
					class="btn w-40"
				>
					LJ IPA
				</a>
			</div>
			<h2 class="font-montserrat text-center text-2xl mt-6">
				Kumpulkan Jawaban Sebelum 1 September
			</h2>
			<div class="flex flex-row justify-center mt-2">
				<a
					target="_blank"
					rel="noreferrer"
					href="https://docs.google.com/forms/d/e/1FAIpQLScs8F5TeQdbZImYiSKeU18wKVVTmxkW8lJ2pHPqw-_IYU85vw/viewform"
					class="btn w-64"
				>
					Kumpulkan
				</a>
			</div>
			<h2 class="font-montserrat text-center text-2xl mt-6">
				Tunggu Pengumuman Tanggal 4 September
			</h2>
			<div class="max-w-3xl mx-auto mt-2">
				80% dari peserta dan sebanyak-banyak nya 50 tim dari setiap bidang akan lolos maju ke tahap
				selanjutnya
			</div>
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"faq"}>
			<h1 class="font-montserrat italic text-center text-5xl mt-6 mb-3 text-gray-700">FAQ</h1>
			<div class="flex flex-col space-y-2 max-w-4xl mx-auto">
				{#each faq as { q, a }}
					<FaqBox {q} {a} />
				{/each}
				<span class="font-bold text-center">
					Tidak bisa menemukan pertanyaanmu?
					<br />
					Tanya langsung lewat widget di kanan bawah layar atau kontak yang tersedia.
				</span>
			</div>
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"about-us"}>
			<h1 class="font-montserrat italic text-center text-5xl mt-6 mb-3 text-gray-700">ABOUT US</h1>
			<div class="max-w-4xl mx-auto shadow-lg rounded-xl bg-white px-8 py-4">
				<h4 class="font-barlow font-bold text-xl">Brilliant Competition</h4>
				<p class="text-justify mt-1">
					Brilliant Competition XIII adalah kegiatan kompetisi olimpiade untuk bidang matematika dan
					sains tingkat SMP berskala nasional yang akan diselenggarakan untuk ketiga belas kalinya
					secara online di SMAK PENABUR Gading Serpong. Brilliant Competition XII sebelumnya diikuti
					oleh ratusan peserta dari sembilan provinsi dan lebih dari 60 sekolah yang tersebar di
					Indonesia. Brilliant Competition dirancang dan dilaksanakan oleh seluruh siswa Brilliant
					Class di SMAK Penabur Gading Serpong beserta dengan guru-guru terpilih dari Brilliant
					Class. Tema Brilliant Competition XIII tahun ini adalah “Unlocking Your Brilliance”. Pada
					Brilliant Competition XIII, kami mengajak siswa-siswi yang berpotensi dan unggul untuk
					membuka pikiran mereka dan menunjukkan potensi kecerdasan mereka masing-masing. Melalui
					kompetisi ini, kami berharap agar siswa dapat mengembangkan kecerdasan dalam berpikir dan
					menemukan potensi yang tersembunyi dalam diri mereka, khususnya dalam bidang matematika
					dan sains.
				</p>

				<h4 class="font-barlow font-bold text-xl mt-4">Brilliant Class</h4>
				<p class="text-justify mt-1">
					Brilliant Class adalah sebuah program pendidikan khusus di SMAK Penabur Gading Serpong
					untuk siswa “berbakat intelektual tinggi”. Tujuannya adalah mengembangkan potensi siswa
					secara optimal sehingga siswa memiliki kesempatan untuk mendapat pendidikan lanjutan di
					perguruan tinggi terbaik di dunia. Dan agar kelak mereka mampu mengabdikan diri dalam
					membangun bangsa dan negara melalui ilmu pengetahuan yang mereka miliki. Jadi, tunggu apa
					lagi? Segera daftarkan dirimu dalam Brilliant Competition XIII dan teruslah berjuang untuk
					meraih prestasi yang terbaik!
				</p>
			</div>
		</div>
	</div>
</div>
<Footer />

<style lang="postcss">
	.btn {
		@apply font-barlow font-medium py-2 px-4 bg-coral hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-yellow-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded;
	}
</style>
