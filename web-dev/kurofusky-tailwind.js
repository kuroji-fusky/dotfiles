/**
 * This is a TailwindCSS config file for styling and
 * branding conventions
 */

/** @type {import('tailwindcss').Config} */
const plugin = require("tailwindcss/plugins")
const fonts = require("tailwindcss/defaultTheme")

module.exports = {
	content: [
		// For Next.js / React projects
		"./src/pages/**/*.{js,ts,jsx,tsx}",
		"./src/components/**/*.{js,ts,jsx,tsx}",
		// For Nuxt.js / Vue.js projects
		"./src/**/*.{js,ts,vue}",
		"app.vue"
	],
	theme: {
		extend: {},
	},
	plugins: [
		plugin(function ({ addBase, addComponents, theme }) {
			addBase({
				'h1': { fontSize: theme('fontSize.5xl') },
				'h2': { fontSize: theme('fontSize.4xl') },
				'h3': { fontSize: theme('fontSize.3xl') },
				'h4': { fontSize: theme('fontSize.2xl') },
				'h5': { fontSize: theme('fontSize.xl') },
			}),
			addComponents({
				'.container-2xl': {
					width: theme('width.screen2xl'),
				}
			})
		})]
}