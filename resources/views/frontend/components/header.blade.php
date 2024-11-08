<header class="header">
    <!-- Topbar -->
    @include('frontend.components.topbar')

    <!-- Logo and Search Bar -->
    <div class="bg-light py-3">
        <div class="container">
            <div class="row justify-content-between align-items-center py-2">
                <div class="logo col-xl-8 col-xs-12">
                    <img src="{{ asset('images/logo.jpg') }}" alt="Government Polytechnic Kolhapur" class="logo-img">
                    <div class="site-info">
                        <h1>Government Polytechnic Kolhapur</h1>
                        <p>(First Autonomous Institute of Government of Maharashtra)</p>
                    </div>
                </div>
                <div class="search-bar col-xl-4 col-xs-12">
                    <form action="{{ route('search') }}" method="GET">
                        <div class="input-group">
                            <input type="text" name="query" class="form-control" placeholder="Search...">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>
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