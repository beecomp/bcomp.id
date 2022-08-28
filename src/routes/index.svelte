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
</script>

<svelte:head>
	<title>Brilliant Competition XIV</title>
</svelte:head>

<div class="bg-gradient-to-b from-stone-700 to-stone-800">
	<div class="bg-no-repeat bg-[left_top_217rem] bg-[length:20rem]" style="background-image: url('/pat-hex-a.png');">
		<div class="bg-no-repeat bg-[right_top_182rem] bg-[length:20rem]" style="background-image: url('/pat-hex-a.png');">
			<div class="bg-no-repeat bg-[length:20rem]" style="background-image: url('/pat-hex-a.png'); background-position: 0px 2280px;">
				<div class="bg-no-repeat bg-[length:20rem]" style="background-image: url('/pat-hex-b.png'); background-position: 1050px 1800px;">
					<div class="bg-no-repeat bg-[left_top_88rem] bg-[length:20rem]" style="background-image: url('/pat-hex-b.png');x">
						<div class="bg-no-repeat bg-[right_top_60rem] bg-[length:20rem]" style="background-image: url('/pat-hex-a.png');">
							<div class="bg-no-repeat bg-[left_top_37rem] bg-[length:20rem]" style="background-image: url('/pat-hex-a.png');">
								<div class="pt-16" use:scrollRef={"top-index"}> 
									<IndexHero />
								</div>

								<div class="container mx-auto">
									<div class="max-w-7xl px-4 sm:px-6 lg:px-8 mx-auto space-y-0">
										<div class=" max-w-4xl drop-shadow-lg rounded-md bg-stone-700 p-4 m-4 mx-auto">
											<p class="font-barlow text-lg text-white text-justify">
												Brilliant Competition (BComp) adalah kegiatan kompetisi olimpiade untuk bidang
												Matematika dan IPA tingkat SMP berskala nasional yang akan diselenggarakan untuk keempat
												belas kalinya di SMAK PENABUR Gading Serpong. Brilliant Competition sebelumnya diikuti
												oleh ratusan peserta dari delapan provinsi dan lebih dari 50 sekolah yang tersebar di
												Indonesia.
											</p>
										</div>

										<div class="-mt-16 pt-16" use:scrollRef={"about-us"}>
											<AboutUs />
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
									</div>
								</div>
								<Footer />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<style lang="postcss">
	.btn {
		@apply font-barlow font-medium py-2 px-4 bg-coral hover:bg-yellow-600 focus:ring-yellow-600 focus:ring-offset-yellow-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded;
	}
</style>