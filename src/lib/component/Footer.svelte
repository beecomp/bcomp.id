<script>
	import Icon from "fa-svelte";
	import { faWhatsapp, faLine, faInstagram } from "@fortawesome/free-brands-svg-icons";
</script>

<div
	class="filter shadow-2xl flex flex-col justify-around sm:flex-row bg-stone-600 p-4 mt-8 space-y-4 sm:space-y-0"
>
	<div>
		<span class="font-montserrat text-white italic">CONTACT</span>
		<ul class="mt-1 space-y-1 font-barlow">
			<li>
				<a
					href="https://wa.me/6283829128451?text=Hi Celine! Saya ingin bertanya tentang Brilliant Competition XIV"
					class="text-white sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 838 2912 8451 (Celine)
				</a>
			</li>
			<li>
				<a
					href="https://wa.me/62895377506699?text=Hi Jessica! Saya ingin bertanya tentang Brilliant Competition XIV"
					class="text-white sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 895 3775 06699 (Jessica)
				</a>
			</li>
			<li>
				<a
					href="https://wa.me/6281953500409?text=Hi Catherine! Saya ingin bertanya tentang Brilliant Competition XIV"
					class="text-white sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 819 5350 0409 (Catherine)
				</a>
			</li>
			<li>
				<a href="https://line.me/ti/p/ooaPNdepAR" class="text-white sm:text-base">
					<Icon icon={faLine} class="text-2xl" />
					Rachel</a
				>
			</li>
			<li>
				<a href="https://instagram.com/brilliantcompetition" class="text-white sm:text-base">
					<Icon icon={faInstagram} class="text-2xl" />
					@brilliantcompetition
				</a>
			</li>
			<li>
				<a href="https://www.instagram.com/debrilliantclass" class="text-white sm:text-base">
					<Icon icon={faInstagram} class="text-2xl" />
					@debrilliantclass
				</a>
			</li>
		</ul>
	</div>
	<div class="max-w-xs font-barlow">
		<h3 class="text-white font-montserrat italic">ADDRESS</h3>
		<p class="text-white mt-2">
			Jl. Kelapa Gading Barat, Pakulonan Barat, Kecamatan Kelapa Dua, Tangerang, Banten 15113,
			Indonesia
		</p>
	</div>
</div>
