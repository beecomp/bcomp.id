const defaultTheme = require("tailwindcss/defaultTheme");

const sansFonts = defaultTheme.fontFamily.sans;
module.exports = {
    content: ["./**/*.{html,njk,yml,yaml}"],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Barlow", ...sansFonts],
                semi: ["Barlow Semi Condensed", sansFonts],
            },
            colors: {
                'yellow-2024' : '#ffb435',
                'shadeyellow-2024' : '#ff9c44',
                'blue-2024' : '#d8fcf4',
                'shadeblue-2024' : '#0bb4a1',
                'shadeblue2-2024' : '#089080',
                'silver' : '#c0c0c0',
                'bronze' : '#cf7f32',
                'gold' : '#ffde40',
            },
        },
    },
    variants: {},
    plugins: [require("@tailwindcss/typography")],
};
