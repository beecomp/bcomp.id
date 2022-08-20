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
				saffron: "#fbbf24",
				WhiteL: "#d4d4d8",
				"coral-light": "#fdb98d",
			},
		},
	},
	plugins: [],
};

module.exports = config;
