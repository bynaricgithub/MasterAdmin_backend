<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Models\HomeMenu;
use App\Http\Middleware\CheckTokenExpiryForAdmin;
use Carbon\Carbon;
use Illuminate\Support\Facades\Route;
use Laravel\Passport\Passport;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // Ignore the default Passport routes if you're using custom routes
        Passport::ignoreRoutes();
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Share the $menus variable with all views
        View::composer('*', function ($view) {
            $menus = HomeMenu::whereNull('parent_id')
                ->orderBy('order')
                ->with('children')
                ->get();

            // Share the $menus data with all views
            $view->with('menus', $menus);
        });

        // Set token expiry times for Passport
        Passport::tokensExpireIn(Carbon::now()->addSeconds(30));
        Passport::refreshTokensExpireIn(Carbon::now()->addDays(30));

        // Register middleware for token expiry checks
        $this->registerMiddleware();
    }

    /**
     * Register middleware for checking token expiry for admin.
     */
    protected function registerMiddleware()
    {
        Route::middlewareGroup('check.token.expiry.admin', [
            CheckTokenExpiryForAdmin::class,
        ]);
    }
}
