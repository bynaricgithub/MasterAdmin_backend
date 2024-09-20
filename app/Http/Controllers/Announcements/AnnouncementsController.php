<?php

namespace App\Http\Controllers\Announcements;

use App\Http\Controllers\Controller;
use App\Services\Masters\Master;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class AnnouncementsController extends Controller
{
    public function index(Request $request, Master $m)
    {
        return $m->AnnouncementsIndex($request);
    }

    public function store(Request $request, Master $m)
    {
        return $m->AnnouncementsStore($request);
    }

    public function edit(Request $request, Master $m)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            // "type" => "required",
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }


        return $m->AnnouncementsEdit($request);
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
        return $m->Announcementsdisable($request);
    }


    public function delete(Request $request, Master $m)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:curriculum,id',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        return $m->AnnouncementsDelete($request);
    }


    public function reOrdering(Request $request, Master $m)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:homemenu,id',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        return $m->AnnouncementsReOrdering($request);
    }


    public function fetchAnnoucements(Request $request, Master $m)
    {
        return $m->fetchAnnoucements($request);
    }

    public function demo(Request $request)
    {
        // Validate the request
        $request->validate([
            'file' => 'required|mimes:pdf|max:614400', // 614400 KB = 600 MB
        ]);

        // Store the uploaded file
        if ($request->file('file')) {
            $file = $request->file('file');
            $path = Storage::disk('ftp')->putFile('fra/pdf', $file);

            return response()->json(['message' => 'File uploaded successfully', 'path' => $path]);
        }

        return response()->json(['message' => 'No file uploaded'], 400);
    }


}
