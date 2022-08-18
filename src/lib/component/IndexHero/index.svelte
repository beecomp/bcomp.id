<script type="text/javascript">
	import stripedCircle from "./striped-circle.svg";
	import stripedPentagon from "./striped-pentagon.svg";
	import squiggle from "./squiggle.svg";
</script>

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
			x="4"
			y="2"
			class="text-2xl font-alfa italic tracking-wide stroke-current text-orangeishyellow stroke-1"
			dominant-baseline="central"
			fill="transparent"
			text-anchor="middle"
		>
			BRILLIANT
		</text>

		<text
			x="0"
			y="25"
			class="text-2xl font-barlow-semi italic tracking-wide fill-current text-WhiteL"
			dominant-baseline="central"
			text-anchor="middle"
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
			A NEW AGE OF BRILLIANCE
		</text>
	</svg>
</div>

<style lang="postcss">
	.top-128 {
		top: 32rem;
	}
</style>
