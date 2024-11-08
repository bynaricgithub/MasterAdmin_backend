const mix = require("laravel-mix");

// Compile JavaScript files
mix.js("resources/js/app.js", "public/js").js(
    "resources/js/home.js",
    "public/js"
);

// Compile CSS files using PostCSS
mix.postCss("resources/css/app.css", "public/css", [
    require("postcss-import"),
    require("autoprefixer"),
]);

mix.postCss("resources/css/homestyle.css", "public/css");

// Versioning for production
if (mix.inProduction()) {
    mix.version();
}
