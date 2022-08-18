<script>
	import Icon from "fa-svelte";
	import { faTrophy, faAward } from "@fortawesome/free-solid-svg-icons";
</script>

<h1 class="font-montserrat text-gray-700 italic text-center text-5xl font-black md:mb-0">PRIZES</h1>
<div class="flex flex-col items-center sm:items-start sm:flex-row justify-center mt-3">
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
				<div class="font-barlow-semi text-white font-bold text-xl pt-6">Rp 2.250.000</div>
			</div>
		</div>
	</div>
	<div class="flex-grow mx-1 max-w-xs">
		<div class="rounded shadow-2xl py-4 bg-coral md:mt-10 px-10 ">
			<div class="flex flex-col items-center">
				<Icon icon={faTrophy} class="text-9xl mt-4 text-white" />
				<div class="font-barlow-semi text-white font-bold text-2xl mt-3">JUARA 1</div>
				<div
					class="font-barlow-semi text-white font-bold text-4xl sm:text-2xl sm:pt-12 lg:text-3xl"
				>
					Rp 3.500.000
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
				<div class="text-white font-bold text-xl">Rp 2.250.000</div>
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
