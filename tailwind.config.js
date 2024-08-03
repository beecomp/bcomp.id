const defaultTheme = require("tailwindcss/defaultTheme");

const sansFonts = defaultTheme.fontFamily.sans;
module.exports = {
    content: [
                "./**/*.{html,njk,yml,yaml}",
                "./src/**/*.{html,js}",
             ],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Barlow", ...sansFonts],
                semi: ["Barlow Semi Condensed", sansFonts],
                alfa: ["Alfa Slab One", "cursive"],
            },
            colors: {
                'grey-woo' : '#e9eaeb',
                'yellow-woo' : '#ffde00',
                'pink-2024' : '#f7ae9f',
                'blue-2024' : '#76cabd',
            },
        },
    },
    variants: {},
    plugins: [require("@tailwindcss/typography")],
};
