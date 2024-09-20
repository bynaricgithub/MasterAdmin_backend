<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\View;

// Route for the homepage
Route::get('/', function () {
    return view('frontend.pages.home');  // Ensure this file exists
});


// Dynamic route to load pages from frontend/pages directory
Route::get('/{page}', function ($page) {
    if (View::exists("frontend.pages.$page")) {
        return view("frontend.pages.$page");
    } else {
        abort(404);  // Show 404 if the page does not exist
    }
})->where('page', '.*');

Route::get('/search', [App\Http\Controllers\SearchController::class, 'index'])->name('search');
