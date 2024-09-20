const mix = require("laravel-mix");

// Correctly handle JavaScript file
mix.js("resources/js/app.js", "public/js/app.js");
mix.js("resources/js/home.js", "public/js/home.js");

// Assuming you have app.css and want to output to style.css in public/css directory.
mix.css("resources/css/app.css", "public/css/style.css");

// If you have additional CSS files to compile, add them here similarly:
mix.css("resources/css/homestyle.css", "public/css/homestyle.css");

if (mix.inProduction()) {
    mix.version();
}
