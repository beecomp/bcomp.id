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

	const elimParticipantsMat = [
    {
      team_code: "M001",
      members: ["Franklin Filbert"],
      school: "SMP Witama",
    },
    {
      team_code: "M002",
      members: ["Adeline Fedora Cahyadi"],
      school: "SMP Xaverius 1 Bandarlampung",
    },
    {
      team_code: "M003",
      members: ["Kenneth Lie", "Damian Ma"],
      school: "SMPK 6 PENABUR"
    },
    {
      team_code: "M004",
      members: ["Holly Natasha Sutantio", "Kathryne Ashley Sentosa"],
      school: "Mawar Shron Christian School",
    },
    {
      team_code: "M005",
      members: ["Nathanael Richlie Kurniawan"],
      school: "SMPK PENABUR Gading Serpong",
    },
    {
      team_code: "M006",
      members: ["Jasper Rexx Putra Cakra", "Fakhri Musyaffa Ariyanto"],
      school: "Kharisma Bangsa",
    },
    {
      team_code: "M007",
      members: ["M. Rafi Qsan Baskoro", "Naufal Fadhlurrahman"],
      school: "SMP Kharisma Bangsa",
    },
    {
      team_code: "M009",
      members: ["Darren Tan", "Felipe Nathanael Corinthians Sitorus"],
      school: "SMP Kristen 2 Penabur",
    },
    {
      team_code: "M010",
      members: ["Valencia Hardjadinata", "Alexandrene Tanri"],
      school: "SMPK 7 PENABUR Jakarta",
    },
    {
      team_code: "M011",
      members: ["Karin Bunadi", "Daniel Timothy Taruna"],
      school: "SMPK 7 PENABUR JAKARTA",
    },
    {
      team_code: "M012",
      members: ["Ailin Liangga Putri", "Tristan Alexander Wong"],
      school: "SMP Cita Hati Christian School ",
    },
    {
      team_code: "M013",
      members: ["Imam Rasyid Rabbani", "Heydar Ali Akbar"],
      school: "SMPN 255 Jakarta",
    },
    {
      team_code: "M014",
      members: ["Michael Cenreng", "Grace Lucretia"],
      school: "SMP Katolik Rajawali",
    },
    {
      team_code: "M015",
      members: ["Ben Robinson", "Ethan Anderson"],
      school: "SMP PETRA 1",
    },
    {
      team_code: "M016",
      members: ["Louis Wilson Gunawan", "Ethan Christopher Huang"],
      school: "SMPK 2 PENABUR",
    },
    {
      team_code: "M019",
      members: ["Najwa Lathiifah Saepudin", "Khairunnisa Athifah"],
      school: "SMP IT INSAN HARAPAN",
    },
    {
      team_code: "M022",
      members: ["Darren Joeve Tanujaya", "Elvin Rosadi"],
      school: "SMPK BPK PENABUR Bandar Lampung",
    },
    {
      team_code: "M023",
      members: ["Kevin Adi Senjaya"],
      school: "SMP Cahaya Bangsa Metro",
    },
    {
      team_code: "M024",
      members: ["Evan Syatia To", "Jason Jomono"],
      school: "SMPK 4 Penabur",
    },
    {
      team_code: "M025",
      members: ["Theo Manuel Santoso", "Gwen Tiffany Haryanto"],
      school: "SMP IPEKA Puri",
    },
    {
      team_code: "M026",
      members: ["Metta Niyamacitta Exeliem"],
      school: "SMPK PENABUR KOTA MODERN",
    },
    {
      team_code: "M027",
      members: ["Luffy Lionheart Liduwan", "Willard Ricxie Phangara"],
      school: "SMPK 6 Penabur",
    },
    {
      team_code: "M028",
      members: ["Caroline Evangelina", "Helen Maurelle Wijayanti"],
      school: "SMPK Kolese Santo Yusup 2 Malang",
    },
    {
      team_code: "M029",
      members: ["Clarissa Olivia Purwanto", "Kevin Kumala"],
      school: "SMPK Kolese Santo Yusup 2 Malang",
    },
    {
      team_code: "M030",
      members: ["Neisha Calya Mahardhika", "Zidan Akrom Putra"],
      school: "SMP Pribadi Depok",
    },
    {
      team_code: "M031",
      members: ["Leonardo Valerian", "Yvonnie Natasha"],
      school: "SMP Darma Yudha",
    },
    {
      team_code: "M032",
      members: ["Grace Christinalie", "Gilberto Lim"],
      school: "SMP DARMA YUDHA",
    },
    {
      team_code: "M033",
      members: ["Noell Raymon Putra Simamora", "Derrick Devs Chayrich"],
      school: "Darma Yudha",
    },
    {
      team_code: "M034",
      members: ["Neilson Huang", "Elia Siringoringo"],
      school: "SMP Darma Yudha",
    },
    {
      team_code: "M035",
      members: ["Gilbert Titus Calvin Marganti Hutapea"],
      school: "SMPN 92 JAKARTA ",
    },
    {
      team_code: "M038",
      members: ["Esther Gloria Abigail Mamesah", "Nadhif Aydin Adinandra"],
      school: "SMPN 2 Depok",
    },
    {
      team_code: "M040",
      members: ["Ayra Kenanthi Putri S.", "Prita Salsabila"],
      school: "SMP Global Prestasi",
    },
    {
      team_code: "M042",
      members: ["Rico Firmansyah", "Essenza Qurani Permata"],
      school: "SMP BUSTANUL MAKMUR GENTENG",
    },
    {
      team_code: "M043",
      members: ["Firdasari Kusuma", "Mazaya Allessya Kusuma"],
      school: "SMPN 2 DEPOK",
    },
    {
      team_code: "M044",
      members: ["Joshua Willson", "Cedric Kartawidjaja"],
      school: "SMPK Penabur Gading Serpong",
    },
    {
      team_code: "M046",
      members: ["Keiana Sethyaningrum", "Davin Sukandar"],
      school: "SMP Athalia",
    },
    {
      team_code: "M047",
      members: ["Kelsey Daveney Dicky", "Hanzel Clement Alpeso"],
      school: "SMP Athalia",
    },
    {
      team_code: "M048",
      members: ["Joleen Chelsea"],
      school: "Raffles School Kelapa Gading",
      
    },
    {
      team_code: "M049",
      members: ["Caroline Gracia Lendrian"],
      school: "Penabur International Kelapa Gading",
    },
	];

  const elimParticipantsIPA = [
    {
      team_code: "S001",
      members: ["Baruna Adi Sanjaya", "Narendra Aditya Tanoto"],
      school: "SMP Cahaya Rancamaya",
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
        <h1 class="font-montserrat text-gray-700 italic text-center text-3xl font-black md:mb-0 pt-16">
          Pengumuman Penyisihan 1
        </h1>
        <!-- <h1 class="font-montserrat text-gray-700 italic text-center text-4xl font-black md:mb-0">
          ~
				</h1>
        <h1 class="font-montserrat text-gray-700 italic text-center text-4xl font-black md:mb-0">
					Pengumuman Penyisihan 1
				</h1> -->
				<!-- <div class=" max-w-4xl shadow rounded bg-white px-4 pb-4 m-4 mx-auto">
					<div class="flex flex-row mb-3">
						<div class=" w-24 bg-lavender text-center rounded-b py-2">
							<span class="font-barlow-semi text-gray-700 text-2xl"> 03/09/21 </span>
						</div>
						<div class="font-barlow-semi mx-auto text-2xl pt-2">Deadline Pengumpulan Diundur</div>
					</div>
					<p class="font-barlow text-lg">Deadline pengumpulan diundur hingga 4 September 2021</p>
				</div> -->
				<div class=" max-w-4xl shadow rounded bg-white px-4 pb-4 m-4 mx-auto">
					<div class="flex flex-row mb-3">
						<!-- <div class=" w-24 bg-lavender text-center rounded-b py-2">
							<span class="font-barlow-semi text-gray-700 text-2xl"> 03/09/21 </span>
						</div> -->
						<!-- <div class="font-barlow-semi mx-auto text-2xl pt-2">Pengumuman Penyisihan 1</div> -->
					</div>
					<p class="font-barlow font-bold text-lg">Matematika</p>
					<table class="table-auto w-full">
						<tr class="border-b-2 border-gray-600">
              <th>Kode Tim</th>
							<th>Nama Peserta</th>
							<th>Sekolah</th>
						</tr>
						{#each elimParticipantsMat as { team_code, members, school }, i}
							<tr class="border-b-2 border-gray-400">
								<td class="px-2 text-center">{team_code}</td>
                <td class="px-2 text">{members.join(", ")}</td>
								<td class="px-2 text">{school}</td>
							</tr>
						{/each}
					</table>  
				</div>
        <div class=" max-w-4xl shadow rounded bg-white px-4 pb-4 m-4 mx-auto">
					<div class="flex flex-row mb-3">
						<!-- <div class=" w-24 bg-lavender text-center rounded-b py-2">
							<span class="font-barlow-semi text-gray-700 text-2xl"> 03/09/21 </span>
						</div> -->
						<!-- <div class="font-barlow-semi mx-auto text-2xl pt-2">Pengumuman Penyisihan 1</div> -->
					</div>
					<p class="font-barlow font-bold text-lg">IPA</p>
					<table class="table-auto w-full">
						<tr class="border-b-2 border-gray-600">
              <th>Kode Tim</th>
							<th>Nama Peserta</th>
							<th>Sekolah</th>
						</tr>
						{#each elimParticipantsIPA as { team_code, members, school }, i}
							<tr class="border-b-2 border-gray-400">
								<td class="px-2 text-center">{team_code}</td>
                <td class="px-2 text">{members.join(", ")}</td>
								<td class="px-2 text">{school}</td>
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
