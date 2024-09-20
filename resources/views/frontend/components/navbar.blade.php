<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                @foreach($menus as $menu)
                    @if($menu->children->isNotEmpty())
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="{{ $menu->url }}" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                {{ $menu->label }}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                @foreach($menu->children as $subMenu)
                                    <a class="dropdown-item" href="{{ $subMenu->url }}">{{ $subMenu->label }}</a>
                                @endforeach
                            </div>
                        </li>
                    @else
                        <li class="nav-item">
                            <a class="nav-link" href="{{ $menu->url }}">{{ $menu->label }}</a>
                        </li>
                    @endif
                @endforeach
            </ul>
        </div>
    </div>
</nav>