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
                'pink-2024' : '#f7ae9f',
                'darkpink-2024' : '#de9c8f',
                'blue-2024' : '#76cabd',
                'shadeblue-2024' : '#5ea197',
                'shadeblue2-2024' : '#528d84',
                'darkblue-2024' : '#028080',
                'silver' : '#c0c0c0',
                'bronze' : '#cf7f32',
                'gold' : '#ffde40',
            },
        },
    },
    variants: {},
    plugins: [require("@tailwindcss/typography")],
};
