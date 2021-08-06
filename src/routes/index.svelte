<script>
	import Icon from "fa-svelte";
	import {
		faTrophy,
		faAward,
		faInbox,
		faBullhorn,
		faPencilAlt,
	} from "@fortawesome/free-solid-svg-icons";
	import { faWhatsapp, faLine, faInstagram } from "@fortawesome/free-brands-svg-icons";
	import Carousel from "svelte-carousel";
</script>

<div class="container mx-auto">
	<div class="max-w-7xl px-4 sm:px-6 lg:px-8 mx-auto">
		<div class="text-6xl text-center font-black pt-20">Brilliant Competition XIII</div>
		<div class="text-3xl text-center font-black">Unlocking your brilliance</div>
		<div>
			<h1 class="text-center text-5xl font-black my-6">Prizes</h1>
			<div class="flex flex-col sm:flex-row justify-center sm:space-x-3">
				<div class="hidden md:block flex-grow">
					<div class="simple-card py-4 ib-gradient opacity-80">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-6xl mt-1 text-white" />
							<div class="text-white font-bold mt-1">Juara 4</div>
							<div class="text-white font-bold text-lg">Rp 750.000</div>
						</div>
					</div>
				</div>
				<div class="hidden sm:block flex-grow">
					<div class="simple-card py-4 ib-gradient mt-6 opacity-90">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-7xl mt-3 text-white" />
							<div class="text-white font-bold text-xl mt-2">Juara 2</div>
							<div class="text-white font-bold text-xl pt-6">Rp 2.000.000</div>
						</div>
					</div>
				</div>
				<div class="flex-grow">
					<div class="simple-card py-4 ib-gradient mt-8">
						<div class="flex flex-col items-center">
							<Icon icon={faTrophy} class="text-9xl mt-4 text-white" />
							<div class="text-white font-bold text-2xl mt-3">Champion</div>
							<div class="text-white font-bold text-2xl pt-8 lg:text-3xl">Rp 3.000.000</div>
						</div>
					</div>
				</div>

				<div class="hidden sm:block flex-grow">
					<div class="simple-card py-4 ib-gradient mt-6 opacity-90">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-7xl mt-3 text-white" />
							<div class="text-white font-bold text-xl mt-2">Juara 3</div>
							<div class="text-white font-bold text-xl pt-6">Rp 1.000.000</div>
						</div>
					</div>
				</div>

				<div class="hidden md:block flex-grow">
					<div class="simple-card py-4 ib-gradient opacity-80">
						<div class="flex flex-col items-center">
							<Icon icon={faAward} class="text-6xl mt-1 text-white" />
							<div class="text-white font-bold mt-1">Juara 5</div>
							<div class="text-white font-bold text-lg">Rp 500.000</div>
						</div>
					</div>
				</div>
			</div>
			<div class="flex flex-col items-center mt-2 space-y-2">
				<div class="sm:hidden simple-card py-2 ib-gradient max-w-xs w-full opacity-80">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-6xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 2</div>
							<div class="text-white font-bold text-2xl">Rp 2.000.000</div>
						</div>
					</div>
				</div>
				<div class="sm:hidden simple-card py-2 ib-gradient max-w-xs w-full opacity-80">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-6xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 3</div>
							<div class="text-white font-bold text-2xl">Rp 1.000.000</div>
						</div>
					</div>
				</div>
				<div class="md:hidden simple-card py-2 ib-gradient max-w-xs w-full opacity-80">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-6xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 4</div>
							<div class="text-white font-bold text-2xl">Rp 750.000</div>
						</div>
					</div>
				</div>
				<div class="md:hidden simple-card py-2 ib-gradient max-w-xs w-full opacity-80">
					<div class="flex flex-row items-center justify-between px-4">
						<Icon icon={faAward} class="text-6xl mt-1 text-white" />
						<div class="flex flex-col items-center">
							<div class="text-white font-bold">Juara 5</div>
							<div class="text-white font-bold text-2xl">Rp 500.000</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div>
			<h1 class="text-center text-5xl font-black my-6">Schedule</h1>
			<div
				class="flex flex-col md:flex-row items-center md:items-stretch md:space-x-3 space-y-4 md:space-y-0"
			>
				<div class="ib-gradient simple-card py-4 max-w-sm w-full opacity-40">
					<div class="flex flex-col items-center">
						<Icon icon={faInbox} class="text-6xl m-4 text-white" />
						<div class="text-white font-bold mt-1 text-center">Deadline Penyisihan</div>
						<div class="text-white font-bold text-xl">1 Sept 2021</div>
					</div>
				</div>
				<div class="ib-gradient simple-card py-4 max-w-sm w-full">
					<div class="flex flex-col items-center">
						<Icon icon={faBullhorn} class="text-6xl m-4 text-white" />
						<div class="text-white font-bold mt-1 text-center">Hasil Penyisihan</div>
						<div class="text-white font-bold text-xl">3 Sept 2021</div>
					</div>
				</div>
				<div class="ib-gradient simple-card py-4 max-w-sm w-full">
					<div class="flex flex-col items-center justify-between">
						<Icon icon={faPencilAlt} class="text-6xl m-4 text-white" />
						<div class="text-white font-bold mt-1 text-center ">Semifinal</div>
						<div class="text-white font-bold text-xl">11 Sept 2021</div>
					</div>
				</div>
				<div class="ib-gradient simple-card py-4 max-w-sm w-full">
					<div class="flex flex-col items-center">
						<Icon icon={faPencilAlt} class="text-6xl m-4 text-white" />
						<div class="text-white font-bold mt-1">Final</div>
						<div class="text-white font-bold text-xl">12 Sept 2021</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<h1 class="text-center text-5xl font-black my-6">Penyisihan</h1>
			Penyisihan dilakukan secara online Bacon ipsum dolor amet duis tempor ribeye, chicken pork belly
			buffalo reprehenderit sausage ham id chuck nostrud shankle occaecat ullamco. Doner irure aliquip
			fatback ullamco pig et cillum pork chop spare ribs. Enim pork chop adipisicing pig nostrud labore
			ad frankfurter esse t-bone prosciutto. Ball tip ad beef adipisicing, shankle jowl exercitation
			aute tenderloin flank ea sausage shoulder. Corned beef irure nulla spare ribs tenderloin turducken
			in meatloaf exercitation chuck.
			<div class="flex flex-row justify-center mt-2">
				<button
					type="button"
					class="max-w-xs py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					<span class="text-2xl">Daftar Sekarang!</span>
				</button>
			</div>

			<h2 class="text-center text-3xl font-black my-4">Download Guidebook</h2>
			<div class="flex flex-row justify-center space-x-4">
				<button
					type="button"
					class="max-w-xs py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					Matematika
				</button>
				<button
					type="button"
					class="max-w-xs py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					IPA
				</button>
			</div>

			<h2 class="text-center text-3xl font-black my-4">Download Soal & Lembar Jawab</h2>
			<div class="flex flex-row justify-center space-x-4">
				<button
					type="button"
					class="max-w-xs py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					Matematika
				</button>
				<button
					type="button"
					class="max-w-xs py-2 px-4 bg-yellow-500 hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-indigo-200 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-lg "
				>
					IPA
				</button>
			</div>
		</div>
		<div>
			<h1 class="text-center text-5xl font-black my-6">About Us</h1>
			<div class="shadow-lg rounded-xl bg-white p-8 pt-4">
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
	class="filter drop-shadow-xl flex flex-col justify-around sm:flex-row bg-gray-50 rounded-t-3xl p-4 mt-8 space-y-4 sm:space-y-0"
>
	<div>
		<span class="text-2xl font-bold">Contact</span>
		<ul class="mt-1">
			<li>
				<a
					href="https://api.whatsapp.com/send?phone=6281333047708&text=Hi Elva! Saya ingin bertanya tentang Brilliant Competition XIII"
					class="font-bold"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 813 3304 7708 (Elva)
				</a>
			</li>
			<li>
				<a
					href="https://api.whatsapp.com/send?phone=6287786717147&text=Hi Rachel! Saya ingin bertanya tentang Brilliant Competition XIII"
					class="font-bold"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 877 8671 7147 (Rachel)
				</a>
			</li>
			<li>
				<a href="https://line.me/ti/p/Ix3uRlZSbB" class="font-bold">
					<Icon icon={faLine} class="text-2xl" />
					jas_mint5 CHANGE ASAP!</a
				>
			</li>
			<li>
				<a href="https://instagram.com/brilliantcompetition" class="font-bold">
					<Icon icon={faInstagram} class="text-2xl" />
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
	.simple-card {
		@apply filter drop-shadow-lg  rounded-xl;
	}
</style>
