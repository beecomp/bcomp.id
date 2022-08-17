<script>
	import FaqBox from "./FaqBox.svelte";
	export let qnas;
</script>

<h1 class="font-montserrat italic text-center text-5xl text-gray-700">FAQ</h1>
<div class="flex flex-col space-y-2 max-w-4xl mt-3 mx-auto">
	{#each qnas as { q, a }}
		<FaqBox {q} {a} />
	{/each}
	<span class="font-bold text-center">
		Tidak bisa menemukan pertanyaanmu?
		<br />
		Tanya langsung lewat widget di kanan bawah layar (jangan lupa memasukkan alamat email) atau kontak
		yang tersedia.
	</span>
</div>
