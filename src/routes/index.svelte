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
	import bigboi from "./bigboi.png";

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
					time: "8:30–12:00",
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

<div use:scrollRef={"top-index"} class="container mx-auto">
	<div class="max-w-7xl px-4 sm:px-6 lg:px-8 mx-auto">
		<div class="flex flex-col items-center pt-8">
			<img src={bigboi} class="h-96" alt="" />
		</div>

		<div class="text-4xl text-center font-black -mt-12">Brilliant Competition XIII</div>
		<div class="text-3xl text-center font-black">Unlocking your brilliance</div>

		<div class="max-w-4xl shadow-md rounded-xl bg-white p-4 m-4 mx-auto">
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
			<h1 class="text-center text-4xl font-black mt-6 mb-3">Prizes</h1>
			<div class="flex flex-col items-center sm:items-start sm:flex-row justify-center">
				<div class="hidden md:block flex-grow mx-1">
					<div class="rounded-xl shadow-lg py-4 ib-gradient opacity-80">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-6xl mt-1 text-white" />
							<div class="text-white font-bold mt-1">Juara 4</div>
							<div class="text-white font-bold text-lg">Rp 750.000</div>
						</div>
					</div>
				</div>
				<div class="hidden sm:block flex-grow mx-1">
					<div class="rounded-xl shadow-xl py-4 ib-gradient mt-6 opacity-90">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-7xl mt-3 text-white" />
							<div class="text-white font-bold text-xl mt-2">Juara 2</div>
							<div class="text-white font-bold text-xl pt-6">Rp 2.000.000</div>
						</div>
					</div>
				</div>
				<div class="flex-grow mx-1 max-w-xs">
					<div class="rounded-xl shadow-2xl py-4 ib-gradient md:mt-8 px-6 ">
						<div class="flex flex-col items-center">
							<Icon icon={faTrophy} class="text-9xl mt-4 text-white" />
							<div class="text-white font-bold text-2xl mt-3">Champion</div>
							<div class="text-white font-bold text-4xl sm:text-2xl sm:pt-8 lg:text-3xl">
								Rp 3.000.000
							</div>
						</div>
					</div>
				</div>

				<div class="hidden sm:block flex-grow mx-1">
					<div class="rounded-xl shadow-xl py-4 ib-gradient mt-6 opacity-90">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-7xl mt-3 text-white" />
							<div class="text-white font-bold text-xl mt-2">Juara 3</div>
							<div class="text-white font-bold text-xl pt-6">Rp 1.000.000</div>
						</div>
					</div>
				</div>

				<div class="hidden md:block flex-grow mx-1">
					<div class="rounded-xl shadow-lg py-4 ib-gradient opacity-80">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-6xl mt-1 text-white" />
							<div class="text-white font-bold mt-1">Juara 5</div>
							<div class="text-white font-bold text-lg">Rp 500.000</div>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-col items-center mt-2 space-y-2">
				<div class="sm:hidden rounded-xl py-2 ib-gradient w-56">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-4xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 2</div>
							<div class="text-white font-bold text-xl">Rp 2.000.000</div>
						</div>
					</div>
				</div>
				<div class="sm:hidden rounded-xl py-2 ib-gradient w-56">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-4xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 3</div>
							<div class="text-white font-bold text-xl">Rp 1.000.000</div>
						</div>
					</div>
				</div>
				<div class="md:hidden rounded-xl py-2 ib-gradient w-56">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-4xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 4</div>
							<div class="text-white font-bold text-xl">Rp 750.000</div>
						</div>
					</div>
				</div>
				<div class="md:hidden rounded-xl py-2 ib-gradient w-56">
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
			<h1 class="text-center text-4xl font-black my-6">Schedule</h1>
			<div
				class="flex flex-col md:flex-row items-center md:items-stretch md:space-x-3 space-y-2 md:space-y-0"
			>
				{#each schedule as { icon, event, date }}
					<div class="ib-gradient rounded-xl p-2 max-w-sm w-full filter shadow-lg">
						<div class="flex flex-row md:flex-col items-center">
							<Icon {icon} class="text-5xl mx-8 md:mt-2 text-white" />
							<div class="flex flex-col md:items-center md:mt-2">
								<div class="text-white font-bold mt-1 text-center">{event}</div>
								<div class="text-white font-bold text-xl text-center">{date}</div>
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
									<th class="pt-3 border-b-2 border-gray-500" colspan="2">{date}</th>
								</tr>
								{#each events as { time, event }}
									<tr class>
										<td class="text-right">{time}</td>
										<td class="px-2">{event}</td>
									</tr>
								{/each}
							{/each}
						</table>
					</div>
				{/if}
				<button
					type="button"
					class="mt-3 max-w-md py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
					on:click={() => (showDetailedSchedule = !showDetailedSchedule)}
				>
					<Icon icon={showDetailedSchedule ? faChevronUp : faChevronDown} class="mx-4 text-white" />
					{showDetailedSchedule ? "Sembunyikan" : "Selengkapnya"}
					<Icon icon={showDetailedSchedule ? faChevronUp : faChevronDown} class="mx-4 text-white" />
				</button>
			</div>
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"howto"}>
			<h1 class="text-center text-4xl font-black my-6">How to participate</h1>

			<h2 class="text-center text-2xl font-black mt-6 mb-2">Baca Guidebook</h2>
			<div class="flex flex-row justify-center space-x-4">
				<button
					type="button"
					class="w-48 py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
					on:click={href("https://www.google.com")}
				>
					Matematika
				</button>
				<button
					type="button"
					class="w-48 py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					IPA
				</button>
			</div>

			<h2 class="text-center text-2xl font-black mt-6">Bayar Rp 100.000,- per tim</h2>
			<div class="flex flex-row justify-center mt-2">
				<div class="w-72 shadow-lg rounded-2xl bg-white dark:bg-gray-800 p-4">
					<div class="flex-row gap-4 flex justify-center items-center">
						<div class="flex-shrink-0">
							<a href="#" class="block relative">
								<img alt="profil" src={bca} class="mx-auto object-cover rounded-full h-16 w-16 " />
							</a>
						</div>
						<div class=" flex flex-col">
							<span class="text-gray-800 dark:text-white text-lg font-bold">6050 5757 97</span>
							<span class="text-gray-600 text-xs"> Lucia Helda Sofyananigrum </span>
							<span class="text-gray-600 text-xs"> Dimas Ambrosius Kridhananda </span>
						</div>
					</div>
				</div>
			</div>

			<h2 class="text-center text-2xl font-black mt-6">Isi form pendaftaran</h2>
			<div class="flex flex-row justify-center mt-2">
				<button
					type="button"
					class="w-64 py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					<span class="text-2xl">Isi Form</span>
				</button>
			</div>

			<h2 class="text-center text-2xl font-black mt-6 mb-2">Kerjakan Soal</h2>
			<div class="flex flex-row justify-center space-x-4">
				<button
					type="button"
					class="w-48 py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					Matematika
				</button>
				<button
					type="button"
					class="w-48 py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					IPA
				</button>
			</div>
			<h2 class="text-center text-2xl font-black mt-6">Kumpulkan Jawaban Sebelum 1 September</h2>
			<div class="flex flex-row justify-center mt-2">
				<button
					type="button"
					class="w-64 py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					<span class="text-2xl">Kumpulkan</span>
				</button>
			</div>
			<h2 class="text-center text-2xl font-black mt-6">Tunggu Pengumuman Tanggal 3 September</h2>
			<div class="max-w-3xl mx-auto mt-2">
				80% dari peserta dan sebanyak-banyak nya 50 orang dari setiap bidang akan lolos maju ke
				tahap selanjutnya
			</div>
		</div>
		<div class="-mt-12 pt-12" use:scrollRef={"faq"}>
			<h1 class="text-center text-4xl font-black my-6">FAQ</h1>
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
			<h1 class="text-center text-4xl font-black my-6">About Us</h1>
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
	class="shadow-xl flex flex-col justify-around sm:flex-row bg-gray-50 rounded-t-3xl p-4 mt-8 space-y-4 sm:space-y-0"
>
	<div>
		<span class="text-2xl font-bold">Contact</span>
		<ul class="mt-1 space-y-1">
			<li>
				<a
					href="https://wa.me/6281333047778?text=Hi Elva! Saya ingin bertanya tentang Brilliant Competition XIII"
					class="font-bold text-lg sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-3xl" />
					+62 813 3304 7778 (Elva)
				</a>
			</li>
			<li>
				<a
					href="https://wa.me/6287786717147?text=Hi Rachel! Saya ingin bertanya tentang Brilliant Competition XIII"
					class="font-bold text-lg sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-3xl" />
					+62 877 8671 7147 (Rachel)
				</a>
			</li>
			<li>
				<a href="https://line.me/ti/p/Ix3uRlZSbB" class="font-bold text-lg sm:text-base">
					<Icon icon={faLine} class="text-3xl" />
					jas_mint5 CHANGE ASAP!</a
				>
			</li>
			<li>
				<a href="https://instagram.com/brilliantcompetition" class="font-bold text-lg sm:text-base">
					<Icon icon={faInstagram} class="text-3xl" />
					@brilliantcompetition
				</a>
			</li>
		</ul>
	</div>
	<div class="max-w-xs">
		<h3 class="text-2xl font-bold">Address</h3>
		<p class="mt-2">
			Jl. Kelapa Gading Barat, Pakulonan Barat, Kecamatan Kelapa Dua, Tangerang, Banten 15113,
			Indonesia
		</p>
	</div>
</div>

<style lang="postcss">
	.ib-gradient {
		@apply bg-gradient-to-br from-yellow-600 to-yellow-500;
	}
</style>
