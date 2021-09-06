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
			code: "M001",
			names: ["Franklin Filbert"],
			school: "SMP Witama",
		},
		{
			code: "M002",
			names: ["Adeline Fedora Cahyadi"],
			school: "SMP Xaverius 1 Bandarlampung",
		},
		{
			code: "M003",
			names: ["Kenneth Lie", "Damian Ma"],
			school: "SMPK 6 PENABUR",
		},
		{
			code: "M004",
			names: ["Holly Natasha Sutantio", "Kathryne Ashley Sentosa"],
			school: "Mawar Sharon Christian School",
		},
		{
			code: "M005",
			names: ["Nathanael Richlie Kurniawan"],
			school: "SMPK PENABUR Gading Serpong",
		},
		{
			code: "M006",
			names: ["Jasper Rexx Putra Cakra", "Fakhri Musyaffa Ariyanto"],
			school: "Kharisma Bangsa",
		},
		{
			code: "M007",
			names: ["M. Rafi Qsan Baskoro", "Naufal Fadhlurrahman"],
			school: "SMP Kharisma Bangsa",
		},
		{
			code: "M009",
			names: ["Darren Tan", "Felipe Nathanael Corinthians Sitorus"],
			school: "SMP Kristen 2 Penabur",
		},
		{
			code: "M010",
			names: ["Valencia Hardjadinata", "Alexandrene Tanri"],
			school: "SMPK 7 PENABUR Jakarta",
		},
		{
			code: "M011",
			names: ["Karin Bunadi", "Daniel Timothy Taruna"],
			school: "SMPK 7 PENABUR JAKARTA",
		},
		{
			code: "M012",
			names: ["Ailin Liangga Putri", "Tristan Alexander Wong"],
			school: "SMP Cita Hati Christian School ",
		},
		{
			code: "M013",
			names: ["Imam Rasyid Rabbani", "Heydar Ali Akbar"],
			school: "SMPN 255 Jakarta",
		},
		{
			code: "M014",
			names: ["Michael Cenreng", "Grace Lucretia"],
			school: "SMP Katolik Rajawali",
		},
		{
			code: "M015",
			names: ["Ben Robinson", "Ethan Anderson"],
			school: "SMP PETRA 1",
		},
		{
			code: "M016",
			names: ["Louis Wilson Gunawan", "Ethan Christopher Huang"],
			school: "SMPK 2 PENABUR",
		},
		{
			code: "M019",
			names: ["Najwa Lathiifah Saepudin", "Khairunnisa Athifah"],
			school: "SMP IT INSAN HARAPAN",
		},
		{
			code: "M022",
			names: ["Darren Joeve Tanujaya", "Elvin Rosadi"],
			school: "SMPK BPK PENABUR Bandar Lampung",
		},
		{
			code: "M023",
			names: ["Kevin Adi Senjaya"],
			school: "SMP Cahaya Bangsa Metro",
		},
		{
			code: "M024",
			names: ["Evan Syatia To", "Jason Jomono"],
			school: "SMPK 4 Penabur",
		},
		{
			code: "M025",
			names: ["Theo Manuel Santoso", "Gwen Tiffany Haryanto"],
			school: "SMP IPEKA Puri",
		},
		{
			code: "M026",
			names: ["Metta Niyamacitta Exeliem"],
			school: "SMPK PENABUR KOTA MODERN",
		},
		{
			code: "M027",
			names: ["Luffy Lionheart Liduwan", "Willard Ricxie Phangara"],
			school: "SMPK 6 Penabur",
		},
		{
			code: "M028",
			names: ["Caroline Evangelina", "Helen Maurelle Wijayanti"],
			school: "SMPK Kolese Santo Yusup 2 Malang",
		},
		{
			code: "M029",
			names: ["Clarissa Olivia Purwanto", "Kevin Kumala"],
			school: "SMPK Kolese Santo Yusup 2 Malang",
		},
		{
			code: "M030",
			names: ["Neisha Calya Mahardhika", "Zidan Akrom Putra"],
			school: "SMP Pribadi Depok",
		},
		{
			code: "M031",
			names: ["Leonardo Valerian", "Yvonnie Natasha"],
			school: "SMP Darma Yudha",
		},
		{
			code: "M032",
			names: ["Grace Christinalie", "Gilberto Lim"],
			school: "SMP DARMA YUDHA",
		},
		{
			code: "M033",
			names: ["Noell Raymon Putra Simamora", "Derrick Devs Chayrich"],
			school: "Darma Yudha",
		},
		{
			code: "M034",
			names: ["Neilson Huang", "Elia Siringoringo"],
			school: "SMP Darma Yudha",
		},
		{
			code: "M035",
			names: ["Gilbert Titus Calvin Marganti Hutapea"],
			school: "SMPN 92 JAKARTA ",
		},
		{
			code: "M038",
			names: ["Esther Gloria Abigail Mamesah", "Nadhif Aydin Adinandra"],
			school: "SMPN 2 Depok",
		},
		{
			code: "M040",
			names: ["Ayra Kenanthi Putri S.", "Prita Salsabila"],
			school: "SMP Global Prestasi",
		},
		{
			code: "M042",
			names: ["Rico Firmansyah", "Essenza Qurani Permata"],
			school: "SMP BUSTANUL MAKMUR GENTENG",
		},
		{
			code: "M043",
			names: ["Firdasari Kusuma", "Mazaya Allessya Kusuma"],
			school: "SMPN 2 DEPOK",
		},
		{
			code: "M044",
			names: ["Joshua Willson", "Cedric Kartawidjaja"],
			school: "SMPK Penabur Gading Serpong",
		},
		{
			code: "M046",
			names: ["Keiana Sethyaningrum", "Davin Sukandar"],
			school: "SMP Athalia",
		},
		{
			code: "M047",
			names: ["Kelsey Daveney Dicky", "Hanzel Clement Alpeso"],
			school: "SMP Athalia",
		},
		{
			code: "M048",
			names: ["Joleen Chelsea"],
			school: "Raffles School Kelapa Gading",
		},
		{
			code: "M049",
			names: ["Caroline Gracia Lendrian"],
			school: "Penabur International Kelapa Gading",
		},
	];

	let showDetailedSci = false;
	const elimParticipantsSci = [
    {
      code: "S001",
      names: ["Baruna Adi Sanjaya, Narendra Aditya Tanoto"],
      school: "SMP Cahaya Rancamaya",
    },
    {
      code: "S003",
      names: ["Satya Virya Atmadja"],
      school: "SMPK Penabur Serang",
    },
    {
      code: "S004",
      names: ["Felicia Putri Gondokusumo, Herbert Karsten Juwono"],
      school: "SMP Kristen Petra 3 Surabaya",
    },
    {
      code: "S005",
      names: ["Fariz Rayyan Firdaus, Dzakwan Alvaro Putra"],
      school: "SMP Kharisma Bangsa",
    },
    {
      code: "S006",
      names: ["Abdullah Karim, Pradipto Pandu Maheswara"],
      school: "SMP Kharisma Bangsa",
    },
    {
      code: "S009",
      names: ["Richard Huang"],
      school: "SMPK Penabur Gading Serpong",
    },
    {
      code: "S010",
      names: ["Justin, Edward Eugene Surya"],
      school: "SMPK 2 Penabur",
    },
    {
      code: "S011",
      names: ["Stevenson Christopher Hudiono, Cheerish Natalia Rifel"],
      school: "SMPK 2 Penabur",
    },
    {
      code: "S012",
      names: ["Adriel Nathanael Winfryd, Krislyn W Riyadi"],
      school: "SMPK 7 Penabur",
    },
    {
      code: "S013",
      names: ["Cynthia Nikita Wibowo, Jeremee Rafael Wynn"],
      school: "SMPK Penabur Kota Modern",
    },
    {
      code: "S014",
      names: ["Welfrydus Winnersdy Rante, Tiara Siddhi Fonso"],
      school: "SMP Katolik Rajawali Makassar",
    },
    {
      code: "S015",
      names: ["Justin Benaya Tirtadjaja, Fellyta Aquila Chiandra"],
      school: "SMP Marsudirini Bogor",
    },
    {
      code: "S016",
      names: ["Kenneth Nicander Wijaya, Stefani Angela"],
      school: "SMPK 6 Penabur",
    },
    {
      code: "S017",
      names: ["Vanessa Natalie Karlina, Katharine Lauren Tie"],
      school: "SMP Santo Aloysius 2",
    },
    {
      code: "S018",
      names: ["Abigail Venus Rashando, Calysta Bernice Prasasti"],
      school: "SMP Santo Aloysius 2",
    },
    {
      code: "S019",
      names: ["Joshua Emmanuel Wahyu, Vania Feby Wijaya"],
      school: "SMPK 2 PENABUR",
    },
    {
      code: "S020",
      names: ["Felix Halley Thamin, Gratia Plena Kusdevina"],
      school: "SMPK 4 Penabur",
    },
    {
      code: "S022",
      names: ["Abraham Brandon Purnama"],
      school: "SMP Kristen Ketapang 1 Jakarta",
    },
    {
      code: "S023",
      names: ["Ethan Samuel Benaya Khu"],
      school: "SMPK Penabur Kota Modern",
    },
    {
      code: "S025",
      names: ["Sammuel Lim, Anthony Christian"],
      school: "SMP Kristen IPEKA Puri",
    },
    {
      code: "S027",
      names: ["Jack Howard Wijaya, Juan Howard Wijaya"],
      school: "SMP Darma Yudha Pekanbaru",
    },
    {
      code: "S028",
      names: ["Bagasmora Andreo Sibarani, Mikhael Faith Benaiah L. Saragih"],
      school: "SMP Darma Yudha Pekanbaru",
    },
    {
      code: "S029",
      names: ["Khansky Khonery, Melvin Raphael Gandaatmaja"],
      school: "Santa Laurensia Junior High School",
    },
    {
      code: "S030",
      names: ["Nathan Raphael Martua N., William Tengganu"],
      school: "SMP Global Prestasi",
    },
    {
      code: "S031",
      names: ["Tsabitah Abiyyu, Joanna Stevia C."],
      school: "SMP Global Prestasi",
    },
    {
      code: "S032",
      names: ["Clara Christovia Sahetapy, Sevonarola Haryo Lumenta"],
      school: "SMP Athalia",
    },
    {
      code: "S033",
      names: ["Feliska Adenia Lubitha, Cornelius Jabez Lim"],
      school: "SMP Athalia",
    },
    {
      code: "S034",
      names: ["Matthew Christopher H, Kaitlyn Illian Toniman"],
      school: "SMPK Penabur Gading Serpong",
    },
    {
      code: "S035",
      names: ["Gabriella Anna Santoso, Kayla Theodora Wibisana"],
      school: "SMPK Kelapa Gading",
    },
    {
      code: "S036",
      names: ["Fiorine Audiera Han"],
      school: "SMPK PENABUR Kota Modern",
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

		<div class="-mt-16 pt-16" use:scrollRef={"announcement"}>
			<h1 class="font-montserrat text-gray-700 italic text-center text-4xl font-black md:mb-0">
				ANNOUNCEMENT
			</h1>
			<h1 class="font-montserrat text-gray-700 text-center text-3xl font-black md:mb-0 pt-8">
				Pengumuman Penyisihan 1
			</h1>
			<div class=" max-w-4xl shadow rounded bg-white p-4 md:p-8 m-4 mx-auto">
				<p class="font-montserrat font-bold text-lg text-2xl text-gray-700">Matematika</p>
				{#if showDetailedMat}
					<div class="py-4" transition:slide={{ duration: 2000 }}>
						<table class="table-auto w-full">
							<tr class="border-b-2 border-gray-600">
								<th>Kode Tim</th>
								<th>Nama Peserta</th>
								<th>Sekolah</th>
							</tr>
							{#each elimParticipantsMat as { code, names, school }, i}
								<tr class="border-b-2 border-gray-400">
									<td class="px-2 text-center">{code}</td>
									<td class="px-2 text">{names.join(", ")}</td>
									<td class="px-2 text">{school}</td>
								</tr>
							{/each}
						</table>
					</div>
				{/if}

				<div class="flex justify-center">
					<button
						type="button"
						class="btn mt-3 w-full max-w-md"
						on:click={() => (showDetailedMat = !showDetailedMat)}
					>
						<Icon icon={showDetailedMat ? faChevronUp : faChevronDown} class="mx-4 text-white" />
						{showDetailedMat ? "Sembunyikan" : "Selengkapnya"}
						<Icon icon={showDetailedMat ? faChevronUp : faChevronDown} class="mx-4 text-white" />
					</button>
				</div>
			</div>
			<div class=" max-w-4xl shadow rounded bg-white px-4 pb-4 m-4 mx-auto">
				<div class="flex flex-row mb-3" />
				<p class="font-montserrat font-bold text-lg text-2xl text-gray-700">IPA</p>
				{#if showDetailedSci}
					<div class="py-4" transition:slide={{ duration: 2000 }}>
						<table class="table-auto w-full">
							<tr class="border-b-2 border-gray-600">
								<th>Kode Tim</th>
								<th>Nama Peserta</th>
								<th>Sekolah</th>
							</tr>
							{#each elimParticipantsSci as { code, names, school }, i}
								<tr class="border-b-2 border-gray-400">
									<td class="px-2 text-center">{code}</td>
									<td class="px-2 text">{names.join(", ")}</td>
									<td class="px-2 text">{school}</td>
								</tr>
							{/each}
						</table>
					</div>
				{/if}

				<div class="flex justify-center">
					<button
						type="button"
						class="btn mt-3 w-full max-w-md"
						on:click={() => (showDetailedSci = !showDetailedSci)}
					>
						<Icon icon={showDetailedSci ? faChevronUp : faChevronDown} class="mx-4 text-white" />
						{showDetailedSci ? "Sembunyikan" : "Selengkapnya"}
						<Icon icon={showDetailedSci ? faChevronUp : faChevronDown} class="mx-4 text-white" />
					</button>
				</div>
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
