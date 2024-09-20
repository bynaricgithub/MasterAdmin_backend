<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Homemenu;

class HomeController extends Controller
{
    public function index()
    {
        // Fetch all top-level menu items with their submenus
        $menus = HomeMenu::whereNull('parent_id')
            ->orderBy('order')
            ->with('children')
            ->get();

        // Pass $menus to the view
        return view('frontend.home', compact('menus'));
    }
}
