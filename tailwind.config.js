module.exports = {
    content: [
      "./app/views/**/*.html.erb",
      "./app/helpers/**/*.rb",
      "./app/assets/stylesheets/**/*.css",
      "./app/javascript/**/*.js",
      "./app/javascript/**/*.jsx",
    ],
    theme: {
      extend: {
        colors: {
          "custom-purple": "rgb(78,11,104)",
          "faint-purple": "rgb(151,110,166)",
          "border-purple": "rgb(237,231,241)",
          "custom-gray": "rgb(148,148,148)",
          "custom-black": "rgb(48,48,49)",
          "custom-background": "rgb(248,250,252)",
          "custom-red": "rgb(234, 51, 36)", 
        },
      },
    },
  };
  