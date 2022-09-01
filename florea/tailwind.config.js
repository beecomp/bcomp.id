const defaultTheme = require("tailwindcss/defaultTheme");

const sansFonts = defaultTheme.fontFamily.sans;
module.exports = {
    content: ["./**/*.{html,njk,yml,yaml}"],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Barlow", ...sansFonts],
                semi: ["Barlow Semi Condensed", ...sansFonts],
                alfa: ["Alfa Slab One", "cursive"],
            },
            colors: {},
        },
    },
    variants: {},
    plugins: [require("@tailwindcss/typography")],
};
