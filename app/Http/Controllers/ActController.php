<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Masters\Master;

class ActController extends Controller
{
    public function index(Master $m)
    {
        return $m->ActsIndex();
    }

    public function store(Request $request, Master $m)
    {
        return $m->ActsStore($request);
    }

    public function edit(Request $request, Master $m)
    {
        return $m->ActsUpdate($request);
    }

    public function delete(Request $request, Master $m)
    {
        return $m->ActsDelete($request);
    }
    public function disable(Request $request, Master $m)
    {

        return $m->ActsDisable($request);
    }
}
