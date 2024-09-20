<?php

namespace App\Http\Controllers\LatestUpdate;

use App\Http\Controllers\Controller;
use App\Services\Masters\Master;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LatestUpdateController extends Controller
{
    public function index(Request $request, Master $m)
    {
        return $m->LatestUpdateIndex($request);
    }
    public function store(Request $request, Master $m)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'link' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        return $m->LatestUpdateStore($request);
    }

    public function edit(Request $request, Master $m)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }

        return $m->LatestUpdateEdit($request);
    }

    public function disable(Request $request, Master $m)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'status' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        return $m->LatestUpdateDisable($request);
    }

    public function delete(Request $request, Master $m)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:latest_update,id',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        return $m->LatestUpdateDelete($request);
    }

    public function reOrdering(Request $request, Master $m)
    {
        return $m->LatestUpdateReOrdering($request);
    }

    public function fetchLatestUpdate(Request $request, Master $m)
    {
        return $m->fetchLatestUpdate($request);
    }
}
