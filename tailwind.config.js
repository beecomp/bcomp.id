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
                something : "#d4d4d8",
                grey_1 : "847163",
                grey_2 : "bca699",
                grey_3 : "745a4b",
            },
        },
    },
    variants: {},
    plugins: [require("@tailwindcss/typography")],
};
