<script context="module">
	export const prerender = true;
</script>

<script>
	import { onMount } from "svelte";
	import { goto } from "$app/navigation";
	onMount(async () => {
		goto(
			"https://docs.google.com/forms/d/e/1FAIpQLSfcbC-AjV7EHEh3PuyCWZPm_9ZOLvhLQlMi_4ocHeUky9wqpw/viewform",
		);
	});
</script>
