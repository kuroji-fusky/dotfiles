const viewportFill = {
  minHeight: "100vh",
  width: "100%",
}

module.exports = {
  plugins: [
    require("tailwindcss/plugin")(({ addBase }) => {
      addBase({
        html: {
          scrollBehavior: "smooth",

          "@media (prefers-reduced-motion)": {
            scrollBehavior: "auto",
          },
        },
        body: {
          overflowX: "hidden",
        },
        // Next.js fill
        "#__next": viewportFill,
        // Nuxt.js fill
        "#__nuxt": viewportFill,
      })
    }),
  ],
}
