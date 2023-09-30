const defaultTheme = require("tailwindcss/defaultTheme");

const sansFonts = defaultTheme.fontFamily.sans;
module.exports = {
    content: ["./**/*.{html,njk,yml,yaml}"],
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
            },
        },
    },
    variants: {},
    plugins: [require("@tailwindcss/typography")],
};
