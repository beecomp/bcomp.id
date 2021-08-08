<script>
	import { slide } from "svelte/transition";
	import Icon from "fa-svelte";
	import {
		faTrophy,
		faAward,
		faInbox,
		faBullhorn,
		faPencilAlt,
		faChevronDown,
		faChevronUp,
	} from "@fortawesome/free-solid-svg-icons";
	import { faWhatsapp, faLine, faInstagram } from "@fortawesome/free-brands-svg-icons";
	import bca from "./bca.svg";
	import stripedCircle from "./striped-circle.svg";
	import stripedPentagon from "./striped-pentagon.svg";
	import squiggle from "./squiggle.svg";

	import { scrollRef } from "svelte-scrolling";

	import FaqBox from "$lib/component/FaqBox.svelte";

	function href(url) {
		return () => {
			window.location.href = url;
		};
	}
	let showDetailedSchedule = false;
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
			date: "3 Sept 2021",
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
			q: "Kapan tanggal terakhir pendaftaran?",
			a: "3 Sept 2021 pukul 17:00",
		},
		{
			q: "Bolehkan satu tim untuk seorang saja?",
			a: "Boleh",
		},
		{
			q: "Berapa biaya pendaftaran?",
			a: "Rp 100.000,- per tim",
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

<div use:scrollRef={"top-index"}>
	<div class="pt-16">
		<div class="relative hidden lg:block">
			<img class="absolute top-0 right-0 w-56 z-0" src={stripedCircle} alt="" />
			<img class="absolute top-0 left-0 w-56 z-0" src={stripedPentagon} alt="" />
			<img class="absolute top-64 left-0 w-24 z-0" src={squiggle} alt="" />
			<svg class="absolute top-128 right-0 w-48" viewBox="-100 0 105 50">
				<rect class="fill-current text-coral opacity-70" x="-70" y="0" width="80" height="15" />
				<rect class="fill-current text-coral" x="-100" y="25" width="110" height="15" />
			</svg>
		</div>
		<div class="pt-4 lg:pt-48 pb-0 lg:pb-48 w-full max-w-5xl mx-auto">
			<svg viewBox="-100 -15 200 75">
				<text
					x="0"
					y="0"
					class="text-2xl font-alfa italic tracking-wide fill-current text-lavender"
					dominant-baseline="central"
					text-anchor="middle"
				>
					BRILLIANT
				</text>
				<text
					x="1"
					y="0.5"
					class="text-2xl font-alfa italic tracking-wide fill-current text-lavender opacity-40"
					dominant-baseline="central"
					text-anchor="middle"
				>
					BRILLIANT
				</text>

				<text
					x="4"
					y="2"
					class="text-2xl font-alfa italic tracking-wide stroke-current text-lavender stroke-1"
					dominant-baseline="central"
					fill="transparent"
					text-anchor="middle"
				>
					BRILLIANT
				</text>

				<text
					x="0"
					y="25"
					class="text-2xl font-barlow-semi italic tracking-wide fill-current text-coral"
					dominant-baseline="central"
					text-anchor="middle"
				>
					COMPETITION
				</text>
				<text
					x="0"
					y="28"
					class="font-barlow-semi italic tracking-wide stroke-current text-coral"
					dominant-baseline="central"
					fill="transparent"
					text-anchor="middle"
					font-size="1.45rem"
					stroke-width="0.5"
				>
					COMPETITION
				</text>

				<text
					x="0"
					y="50.5"
					class="font-montserrat tracking-wider fill-current text-gray-700"
					dominant-baseline="central"
					text-anchor="middle"
					font-size="0.625rem"
				>
					UNLOCK YOUR BRILLIANCE
				</text>
			</svg>
		</div>
	</div>
	<!-- <div class="flex flex-col items-center pt-32 pb-12">
		 <div class="relative font-alfa text-8xl text-lavender italic tracking-wide">
		 BRILLIANT
		 <div class="absolute top-0.5 left-1 opacity-30">
		 <span>BRILLIANT</span>
		 </div>
		 <div class="absolute top-2 left-4">
		 <span class="stroke-brilliant text-transparent">BRILLIANT</span>
		 </div>
		 </div>
		 <div>
		 <div class="relative font-barlow-semi text-8xl text-coral italic">
		 COMPETITION
		 <div class="absolute top-3 left-2">
		 <span class="stroke-competition text-transparent">COMPETITION</span>
		 </div>
		 </div>
		 </div>
		 <span class="mt-8 font-montserrat font-bold text-4xl text-gray-700 tracking-widest">
		 UNLOCK YOUR BRILLIANCE
		 </span>
		 </div> -->
</div>

<div class="container mx-auto">
	<div class="max-w-7xl px-4 sm:px-6 lg:px-8 mx-auto">
		<div class=" max-w-4xl shadow-md rounded-xl bg-white p-4 m-4 mx-auto">
			<p class="text-justify">
				Brilliant Competition adalah lomba matematika dan sains level SMP. Bacon ipsum dolor amet
				duis tempor ribeye, chicken pork belly buffalo reprehenderit sausage ham id chuck nostrud
				shankle occaecat ullamco. Doner irure aliquip fatback ullamco pig et cillum pork chop spare
				ribs. Enim pork chop adipisicing pig nostrud labore ad frankfurter esse t-bone prosciutto.
				Ball tip ad beef adipisicing, shankle jowl exercitation aute tenderloin flank ea sausage
				shoulder. Corned beef irure nulla spare ribs tenderloin turducken in meatloaf exercitation
				chuck. Bacon ipsum dolor amet duis tempor ribeye, chicken pork belly buffalo reprehenderit
				sausage ham id chuck nostrud shankle occaecat ullamco. Doner irure aliquip fatback ullamco
				pig et cillum pork chop spare ribs. Enim pork chop adipisicing pig nostrud labore ad
				frankfurter esse t-bone prosciutto. Ball tip ad beef adipisicing, shankle jowl exercitation
				aute tenderloin flank ea sausage shoulder. Corned beef irure nulla spare ribs tenderloin
				turducken in meatloaf exercitation chuck.
			</p>
		</div>

		<div class="-mt-12 pt-12" use:scrollRef={"prizes"}>
			<h1
				class="font-montserrat text-gray-700 italic text-center text-5xl font-black mt-6 mb-3 md:mb-0"
			>
				PRIZES
			</h1>
			<div class="flex flex-col items-center sm:items-start sm:flex-row justify-center">
				<div class="hidden md:block flex-grow mx-1">
					<div class="rounded shadow-lg py-4 bg-coral">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-6xl mt-1 text-white" />
							<div class="font-barlow-semi text-white font-bold mt-1">JUARA 4</div>
							<div class="font-barlow-semi text-white font-bold text-lg">Rp 750.000</div>
						</div>
					</div>
				</div>
				<div class="hidden sm:block flex-grow mx-1">
					<div class="rounded shadow-xl py-4 bg-coral mt-6">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-7xl mt-3 text-white" />
							<div class="font-barlow-semi text-white font-bold text-xl mt-2">JUARA 2</div>
							<div class="font-barlow-semi text-white font-bold text-xl pt-6">Rp 2.000.000</div>
						</div>
					</div>
				</div>
				<div class="flex-grow mx-1 max-w-xs">
					<div class="rounded shadow-2xl py-4 bg-coral md:mt-10 px-10 ">
						<div class="flex flex-col items-center">
							<Icon icon={faTrophy} class="text-9xl mt-4 text-white" />
							<div class="font-barlow-semi text-white font-bold text-2xl mt-3">CHAMPION</div>
							<div
								class="font-barlow-semi text-white font-bold text-4xl sm:text-2xl sm:pt-12 lg:text-3xl"
							>
								Rp 3.000.000
							</div>
						</div>
					</div>
				</div>

				<div class="hidden sm:block flex-grow mx-1">
					<div class="rounded shadow-xl py-4 bg-coral mt-6">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-7xl mt-3 text-white" />
							<div class="font-barlow-semi text-white font-bold text-xl mt-2">JUARA 3</div>
							<div class="font-barlow-semi text-white font-bold text-xl pt-6">Rp 1.000.000</div>
						</div>
					</div>
				</div>

				<div class="hidden md:block flex-grow mx-1">
					<div class="rounded shadow-lg py-4 bg-coral">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-6xl mt-1 text-white" />
							<div class="font-barlow-semi text-white font-bold mt-1">JUARA 5</div>
							<div class="font-barlow-semi text-white font-bold text-lg">Rp 500.000</div>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-col items-center mt-2 space-y-2">
				<div class="sm:hidden rounded py-2 bg-coral w-56">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-4xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 2</div>
							<div class="text-white font-bold text-xl">Rp 2.000.000</div>
						</div>
					</div>
				</div>
				<div class="sm:hidden rounded py-2 bg-coral w-56">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-4xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 3</div>
							<div class="text-white font-bold text-xl">Rp 1.000.000</div>
						</div>
					</div>
				</div>
				<div class="md:hidden rounded py-2 bg-coral w-56">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-4xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 4</div>
							<div class="text-white font-bold text-xl">Rp 750.000</div>
						</div>
					</div>
				</div>
				<div class="md:hidden rounded py-2 bg-coral w-56">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-4xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 5</div>
							<div class="text-white font-bold text-xl">Rp 500.000</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="-mt-12 pt-12" use:scrollRef={"schedule"}>
			<h1 class="font-montserrat font-black text-gray-700 italic text-center text-5xl mt-6 mb-3">
				SCHEDULE
			</h1>
			<div
				class="flex flex-col md:flex-row items-center md:items-stretch md:space-x-3 space-y-2 md:space-y-0"
			>
				{#each schedule as { icon, event, date }}
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
				{#if showDetailedSchedule}
					<div transition:slide={{ duration: 500 }}>
						<table>
							{#each detailedSchedule as { date, events }}
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
					on:click={() => (showDetailedSchedule = !showDetailedSchedule)}
				>
					<Icon icon={showDetailedSchedule ? faChevronUp : faChevronDown} class="mx-4 text-white" />
					{showDetailedSchedule ? "Sembunyikan" : "Selengkapnya"}
					<Icon icon={showDetailedSchedule ? faChevronUp : faChevronDown} class="mx-4 text-white" />
				</button>
			</div>
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"howto"}>
			<h1 class="font-montserrat italic text-center text-4xl mt-6">HOW TO PARTICIPATE</h1>
			<h2 class="font-montserrat text-center text-2xl font-black mt-3 mb-2">Baca Guidebook</h2>
			<div class="flex flex-row justify-center space-x-4">
				<button type="button" class="btn w-48"> Guidebook </button>
			</div>

			<h2 class="font-montserrat text-center text-2xl font-black mt-6">
				Bayar Rp 100.000,- per tim
			</h2>
			<div class="flex flex-row justify-center mt-2">
				<div class="w-72 shadow-lg rounded-2xl bg-white dark:bg-gray-800 p-4">
					<div class="flex-row gap-4 flex justify-center items-center">
						<div class="flex-shrink-0">
							<a href="#" class="block relative">
								<img alt="profil" src={bca} class="mx-auto object-cover rounded-full h-16 w-16 " />
							</a>
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
				<button type="button" class="btn w-64"> Kerjakan Form </button>
			</div>

			<h2 class="font-montserrat text-center text-2xl mt-6 mb-2">Kerjakan Soal</h2>
			<div class="flex flex-row justify-center space-x-4">
				<button type="button" class="btn w-48"> Matematika </button>
				<button type="button" class="btn w-48"> IPA </button>
			</div>
			<h2 class="font-montserrat text-center text-2xl mt-6">
				Kumpulkan Jawaban Sebelum 1 September
			</h2>
			<div class="flex flex-row justify-center mt-2">
				<button type="button" class="btn w-64"> Kumpulkan </button>
			</div>
			<h2 class="font-montserrat text-center text-2xl mt-6">
				Tunggu Pengumuman Tanggal 3 September
			</h2>
			<div class="max-w-3xl mx-auto mt-2">
				80% dari peserta dan sebanyak-banyak nya 50 orang dari setiap bidang akan lolos maju ke
				tahap selanjutnya
			</div>
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"faq"}>
			<h1 class="font-montserrat italic text-center text-4xl mt-6">FAQ</h1>
			<div class="flex flex-col space-y-2 max-w-4xl mx-auto">
				{#each faq as { q, a }}
					<FaqBox {q} {a} />
				{/each}
				<span class="font-bold text-center">
					Tak bisa menemukan pertanyaanmu?
					<br />
					Tanya langsung lewat widget di kanan bawah layar atau kontak yang tersedia.
				</span>
			</div>
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"about-us"}>
			<h1 class="font-montserrat italic text-center text-4xl mt-6">ABOUT US</h1>
			<div class="max-w-4xl mx-auto shadow-lg rounded-xl bg-white p-8 pt-4">
				<p class="text-justify">
					Pls tulis ulang yang sebelomnya nulis bikinnya kyk orang stroke. mkz. Bacon ipsum dolor
					amet duis tempor ribeye, chicken pork belly buffalo reprehenderit sausage ham id chuck
					nostrud shankle occaecat ullamco. Doner irure aliquip fatback ullamco pig et cillum pork
					chop spare ribs. Enim pork chop adipisicing pig nostrud labore ad frankfurter esse t-bone
					prosciutto. Ball tip ad beef adipisicing, shankle jowl exercitation aute tenderloin flank
					ea sausage shoulder. Corned beef irure nulla spare ribs tenderloin turducken in meatloaf
					exercitation chuck. Bacon ipsum dolor amet duis tempor ribeye, chicken pork belly buffalo
					reprehenderit sausage ham id chuck nostrud shankle occaecat ullamco. Doner irure aliquip
					fatback ullamco pig et cillum pork chop spare ribs. Enim pork chop adipisicing pig nostrud
					labore ad frankfurter esse t-bone prosciutto. Ball tip ad beef adipisicing, shankle jowl
					exercitation aute tenderloin flank ea sausage shoulder. Corned beef irure nulla spare ribs
					tenderloin turducken in meatloaf exercitation chuck.
				</p>
			</div>
		</div>
	</div>
</div>
<div
	class="filter drop-shadow-2xl flex flex-col justify-around sm:flex-row bg-white rounded-t-3xl p-4 mt-8 space-y-4 sm:space-y-0"
>
	<div>
		<span class="font-montserrat text-2xl italic">CONTACT</span>
		<ul class="mt-1 space-y-1 font-barlow">
			<li>
				<a
					href="https://wa.me/6281333047778?text=Hi Elva! Saya ingin bertanya tentang Brilliant Competition XIII"
					class="text-lg sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 813 3304 7778 (Elva)
				</a>
			</li>
			<li>
				<a
					href="https://wa.me/6287786717147?text=Hi Rachel! Saya ingin bertanya tentang Brilliant Competition XIII"
					class="text-lg sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 877 8671 7147 (Rachel)
				</a>
			</li>
			<li>
				<a href="https://line.me/ti/p/Ix3uRlZSbB" class="text-lg sm:text-base">
					<Icon icon={faLine} class="text-2xl" />
					jas_mint5 CHANGE ASAP!</a
				>
			</li>
			<li>
				<a href="https://instagram.com/brilliantcompetition" class="text-lg sm:text-base">
					<Icon icon={faInstagram} class="text-2xl" />
					@brilliantcompetition
				</a>
			</li>
		</ul>
	</div>
	<div class="max-w-xs font-barlow">
		<h3 class="text-2xl font-montserrat italic">ADDRESS</h3>
		<p class="mt-2">
			Jl. Kelapa Gading Barat, Pakulonan Barat, Kecamatan Kelapa Dua, Tangerang, Banten 15113,
			Indonesia
		</p>
	</div>
</div>

<style lang="postcss">
	.top-128 {
		top: 32rem;
	}
	.btn {
		@apply font-barlow font-medium py-2 px-4 bg-coral hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-yellow-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded;
	}
</style>
