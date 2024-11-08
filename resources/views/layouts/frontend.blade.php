<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'My Website')</title>

    <meta name="description" content="@yield('meta_description', 'Default description for My Website')">
    <meta name="keywords" content="@yield('meta_keywords', 'default, keywords')">
    <meta property="og:title" content="@yield('og_title', 'My Website')">
    <meta property="og:description" content="@yield('og_description', 'Default description for My Website')">
    <meta property="og:image" content="@yield('og_image', asset('images/default-og-image.jpg'))">
    <meta property="og:url" content="@yield('og_url', url()->current())">
    <link rel="canonical" href="@yield('canonical', url()->current())">

    <!-- Include Bootstrap, FontAwesome, Owl Carousel, Lightbox -->
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- Manually reference your app's compiled CSS (output from Laravel Mix or directly) -->
    <link href="{{ asset('css/homestyle.css') }}" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
        rel="stylesheet">


</head>

<body>
    @include('frontend.components.header', ['menus' => $menus])

    <main>
        @yield('content')
    </main>

    @include('frontend.components.footer')

    <!-- External JS libraries -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>

    <!-- Manually reference your app's compiled JavaScript -->
    <script src="{{ asset('js/home.js') }}"></script>
    <script src="{{ asset('js/app.js') }}"></script>

</body>

</html>