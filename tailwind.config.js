/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
  purge: {
    // 明示的に保持するクラスを追加
    safelist: [
      'bg-green-500',
    ],
  },
}
