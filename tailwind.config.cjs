const config = {
	purge: ["./src/**/*.{html,js,svelte,ts}"],
	theme: {
		extend: {
			fontFamily: {
				alfa: ["Alfa Slab One", "cursive"],
				"barlow-semi": ["Barlow Semi Condensed", "sans-serif"],
				barlow: ["Barlow", "sans-serif"],
				montserrat: ["Montserrat", "sans-serif"],
			},
			colors: {
				lavender: "#b6c4e1",
				coral: "#ff9e5e",
				orangeishyellow: "#fbbf24",
				WhiteL: "#a8a29e",
				BlackX: "#171717",
				"coral-light": "#fdb98d",
			},
		},
	},
	plugins: [],
};

module.exports = config;
