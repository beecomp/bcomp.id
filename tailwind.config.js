module.exports = {
  content: ["./**/*.{html,njk,yml,yaml}"],
  theme: {
    extend: {
      fontFamily: {
        alfa: ["Alfa Slab One", "cursive"],
        "barlow-semi": ["Barlow Semi Condensed", "sans-serif"],
        barlow: ["Barlow", "sans-serif"],
        montserrat: ["Montserrat", "sans-serif"],
      },
      colors: {},
    },
  },
  variants: {},
  plugins: [require("@tailwindcss/typography")],
};
