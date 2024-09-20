<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Government Polytechnic Kolhapur')</title>

    <!-- Meta Tags for SEO -->
    <meta name="description" content="@yield('meta_description', 'Government Polytechnic Kolhapur')">
    <meta name="keywords" content="@yield('meta_keywords', 'polytechnic, kolhapur, education')">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    <!-- Additional SEO and Social Media Tags -->
    <meta property="og:title" content="@yield('og_title', 'Government Polytechnic Kolhapur')">
    <meta property="og:description"
        content="@yield('og_description', 'Government Polytechnic Kolhapur offers a wide range of diplomas...')">
    <meta property="og:image" content="@yield('og_image', asset('images/default-og-image.jpg'))">
    <meta property="og:url" content="@yield('og_url', url()->current())">

    <!-- Canonical Link -->
    <link rel="canonical" href="@yield('canonical', url()->current())">
</head>