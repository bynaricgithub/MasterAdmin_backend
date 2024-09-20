<?php

namespace App\Http\Controllers\NewsAndEvents;

use App\Http\Controllers\Controller;
use App\Services\Masters\Master;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NewsAndEventController extends Controller
{
    public function fetchNewAndEvent(Request $request, Master $m)
    {
        return $m->fetchNewsAndEvent($request);
    }

    public function index(Request $request, Master $m)
    {
        return $m->indexNewsAndEvent($request);
    }
    public function store(Request $request, Master $m)
    {
        return $m->storeNewsAndEvent($request);
    }

    public function edit(Request $request, Master $m)
    {
        return $m->editNewsAndEvent($request);
    }

    public function disable(Request $request, Master $m)
    {
        return $m->disableNewsAndEvent($request);
    }

    public function delete(Request $request, Master $m)
    {
        return $m->deleteNewsAndEvent($request);
    }

    public function reOrdering(Request $request, Master $m)
    {
        return $m->reOrderingNewsAndEvent($request);
    }
}
