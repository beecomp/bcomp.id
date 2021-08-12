<script context="module">
	export const prerender = true;
</script>

<script>
	import { onMount } from "svelte";
	import { goto } from "$app/navigation";
	onMount(async () => {
		goto("https://drive.google.com/file/d/1PuC-VFzFnyR0gHyKNrXs3fNSSWTAuVZa/view");
	});
</script>
