const defaultTheme = require("tailwindcss/defaultTheme");

const sansFonts = defaultTheme.fontFamily.sans;
module.exports = {
    content: ["./**/*.{html,njk,yml,yaml}"],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Barlow", ...sansFonts],
                semi: ["Barlow Semi Condensed", sansFonts],
                bangers: ['Bangers', cursive],
            },
            colors: {
                'honey-400' : '#ffb435',
                'honey-500' : '#ff9c44',
                'snow-100' : '#d8fcf4',
                'tosca-500' : '#0bb4a1',
                'tosca-600' : '#089080',
                'silver' : '#c0c0c0',
                'bronze' : '#cf7f32',
                'gold' : '#ffde40',
            },
        },
    },
    variants: {},
    plugins: [require("@tailwindcss/typography")],
};
