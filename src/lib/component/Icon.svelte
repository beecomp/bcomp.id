<script type="text/javascript">
	export let icon;
	$: classes = "icon text-white" + ($$props.class ? $$props.class : "");
</script>

<svg aria-hidden="true" class={classes} role="img" xmlns="http://www.w3.org/2000/svg">
	<image href={icon} />
</svg>

{console.log(icon)}

<object class={classes} type="image/svg+xml" data={icon} />

<style>
	.icon {
		width: 1em;
		height: 1em;
		overflow: visible;
		display: inline-block;
	}
</style>
