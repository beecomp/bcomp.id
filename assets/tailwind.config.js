// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

let plugin = require('tailwindcss/plugin')

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],

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
        "coral-light": "#fdb98d",
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    plugin(({ addVariant }) => addVariant('phx-no-feedback', ['&.phx-no-feedback', '.phx-no-feedback &'])),
    plugin(({ addVariant }) => addVariant('phx-click-loading', ['&.phx-click-loading', '.phx-click-loading &'])),
    plugin(({ addVariant }) => addVariant('phx-submit-loading', ['&.phx-submit-loading', '.phx-submit-loading &'])),
    plugin(({ addVariant }) => addVariant('phx-change-loading', ['&.phx-change-loading', '.phx-change-loading &']))
  ]
}
