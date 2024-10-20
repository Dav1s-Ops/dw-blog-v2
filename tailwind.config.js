module.exports = {
  purge: {
    content: [
      './app/views/**/*.html.erb',
      './app/helpers/**/*.rb',
      './app/assets/stylesheets/**/*.css',
      './app/javascript/**/*.js',
    ],
    options: {
      safelist: [
        'pagy',
        'nav',
        'pagy.nav',
        'current',
        'disabled',
      ],
    },
  },
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [],
};
