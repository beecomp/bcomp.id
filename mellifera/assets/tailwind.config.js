// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin");

module.exports = {
    content: ["./js/**/*.js", "../lib/*_web.ex", "../lib/*_web/**/*.*ex"],
    theme: {
        extend: {
            fontFamily: {
                sans: ["Barlow", "sans-serif"],
                semi: ["Barlow Semi Condensed", "sans-serif"],
                alfa: ["Alfa Slab One", "cursive"],
            },
        },
    },
    plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/typography"),
        plugin(({ addVariant }) =>
            addVariant("phx-no-feedback", [
                "&.phx-no-feedback",
                ".phx-no-feedback &",
            ]),
        ),
        plugin(({ addVariant }) =>
            addVariant("phx-click-loading", [
                "&.phx-click-loading",
                ".phx-click-loading &",
            ]),
        ),
        plugin(({ addVariant }) =>
            addVariant("phx-submit-loading", [
                "&.phx-submit-loading",
                ".phx-submit-loading &",
            ]),
        ),
        plugin(({ addVariant }) =>
            addVariant("phx-change-loading", [
                "&.phx-change-loading",
                ".phx-change-loading &",
            ]),
        ),
    ],
};