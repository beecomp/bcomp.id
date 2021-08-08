<script>
	import Icon from "fa-svelte";
	import { faWhatsapp, faLine, faInstagram } from "@fortawesome/free-brands-svg-icons";
</script>

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
				<a
					href="https://wa.me/6288809999128?text=Hi Juan! Saya ingin bertanya tentang Brilliant Competition XIII"
					class="text-lg sm:text-base"
				>
					<Icon icon={faWhatsapp} class="text-2xl" />
					+62 888 0999 9128 (Juan)
				</a>
			</li>
			<li>
				<a href="https://line.me/ti/p/07hb3R21yq" class="text-lg sm:text-base">
					<Icon icon={faLine} class="text-2xl" />
					jas_mint5</a
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
