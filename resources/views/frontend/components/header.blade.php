<header class="header">
    <!-- Topbar -->
    @include('frontend.components.topbar')

    <!-- Logo and Search Bar -->
    <div class="bg-light">
        <div class="container d-flex justify-content-between align-items-center py-2">
            <div class="logo">
                <img src="{{ asset('images/logo.jpg') }}" alt="Website Title" class="logo-img">
                <div class="site-info">
                    <h1>Website Title</h1>
                    <p>Sub - Title</p>
                </div>
            </div>
            <div class="search-bar">
                <form action="{{ route('search') }}" method="GET">
                    <div class="input-group">
                        <input type="text" name="query" class="form-control" placeholder="Search...">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    @include('frontend.components.navbar', ['menus' => $menus])

    <!-- News Ticker -->
    <div class="news-ticker">
        <div class="news-content">
            <marquee behavior="scroll" direction="left">
                Important Notices: First Year Diploma Admission Schedule | NBA
                Accredited Institute
            </marquee>
        </div>
    </div>
</header>