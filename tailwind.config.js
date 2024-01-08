/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js"
  ],
  theme: {
    extend: {},
    screens: {
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'x12': '1200px',
      'xl': '1280px',
      '2xl': '1536px',
    },
  },
  plugins: [],
  purge: {
    // 明示的に保持するクラスを追加
    safelist: [
      'bg-green-500',
    ],
  },
}
