<?php

namespace App\Services\Masters;

use App\Jobs\SendEmailJob;
use App\Models\Act;
use App\Models\HomeMenu;
use App\Models\LatestUpdate;
use App\Models\NoticeBoard;
use App\Models\SliderImages;
use App\Models\NewsAndEvent;
use App\Models\Circular;
use App\Models\curriculum;
use App\Models\Members;
use App\Models\User_Tracker;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

class Master
{

    //?----------------------------VisitorCount-start--------------------------------------------------------------

    public function getUserVisitCount()
    {
        try {
            $res = User_Tracker::count();
            return response()->json([
                'status' => 'success',
                'message' => 'Visitor Count fetched successfully',
                'data' => $res
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
                'data' => ''
            ], 500);
        }
    }

    public function getLastUpdateDate()
    {
        try {
            $result = DB::select(
                "SELECT MAX(maxDate) as 'lastUpdatedDate' FROM 
                ( 
                    SELECT MAX(updated_at) as 'maxDate' FROM acts 
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM annual_reports 
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM circulars 
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM corrigedums
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM curriculums
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM g_r_s
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM homemenu
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM home_page_slider
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM latest_update
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM news_and_events
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM norms
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM notice_boards
                    UNION SELECT MAX(updated_at) as 'maxDate' FROM p_d_f_s
                ) my_tab;"
            );
            if ($result) {
                $date = $result[0]->lastUpdatedDate ? Carbon::createFromFormat('Y-m-d H:i:s', $result[0]->lastUpdatedDate, env('APP_TIMEZONE'))->getPreciseTimestamp(3) : '';
                return response()->json([
                    'status' => 'success',
                    'message' => "Last updated date fetched successfully",
                    'data' => $date
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Latest Updates...Error:' . $e->getMessage()
            ], 400);
        }
    }

    //?----------------------------VisitorCount-end----------------------------------------------------------------
    //?----------------------------HomeMenu-start--------------------------------------------------------------
    public function indexHomeMenu($request)
    {
        try {
            $result = HomeMenu::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'msg' => 'Menus list fetched successfully.',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Homemenu...Error:' . $e->getMessage(),
            ], 500);
        }
    }

    public function storeHomeMenu($input)
    {
        try {
            $result = HomeMenu::create($input);
            $id = $result->id;
            if (empty($input['parent_id'])) {
                $res = HomeMenu::whereColumn('id', 'parent_id')->get();
                HomeMenu::where('id', $id)->update([
                    'parent_id' => $id,
                    'order_id' => count($res) + 1
                ]);
            } else {
                $res = HomeMenu::where('parent_id', $input['parent_id'])->get();
                HomeMenu::where('id', $id)->update([
                    'order_id' => count($res) + 1
                ]);
            }

            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Homemenu added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add homemenu',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function updateHomeMenu($request)
    {
        try {
            $result = DB::table('homemenu')->where('id', $request['id'])->limit(1)->update([
                'title' => $request['title'],
                'parent_id' => $request['parent_id'],
                'menu_url' => $request['menu_url'],
                'order_id' => $request['order_id']
            ]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Homemenu updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to edit homemenu because of no change in data',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function destroyHomeMenu($request)
    {
        try {
            $result = HomeMenu::where('id', $request->id)->delete();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Homemenu deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete Homemenu',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function disable($request)
    {
        try {

            $result = HomeMenu::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->id == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    public function fetchHomeMenu($request)
    {
        try {
            $result = HomeMenu::where('status', 1)->get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'msg' => 'Menus list fetched successfully.',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Homemenu...Error:' . $e->getMessage(),
            ], 400);
        }
    }
    //?----------------------------HomeMenu-end--------------------------------------------------------------

    //?----------------------------latestUpdate-start--------------------------------------------------------------
    public function LatestUpdateIndex()
    {
        try {
            $result = LatestUpdate::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Latest Update list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Latest update...Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function LatestUpdateStore($request)
    {
        try {
            $lastId = LatestUpdate::orderBy('id', 'desc')->first();
            $latestUpdate = [
                'title' => $request->title,
                'order_id' => $lastId ? ($lastId->id) + 1 : 1,
                'link' => $request->link,
            ];
            // if ($request->hasFile('link')) {
            //     $file = $request->file('link');
            //     $title = Str::slug($request->title);
            //     $filename1 = uploadFile($file, $title, null, 'latestUpdateUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename1;
            //     $filename = $filename1;
            //     $latestUpdate['link'] = $filename;
            // }
            $result = LatestUpdate::create($latestUpdate);
            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'Latest update record added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add latest update record',
                ], 400);
            }
        } catch (\Exception $e) {

            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function LatestUpdateEdit($request)
    {
        try {
            $latestUpdate = [
                'title' => $request->title,
                // 'link' => $request->link,
            ];
            if ($request->link) {
                $latestUpdate['link'] = $request->link;
            }
            $id = $request->id;
            // if ($request->hasFile('link')) {
            //     $file = $request->file('link');
            //     $title = Str::slug($request->title);
            //     $filename1 = uploadFile($file, $title, null, 'latestUpdateUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename1;
            //     $filename = $filename1;

            //     $latestUpdate['link'] = $filename;
            // }
            $result = LatestUpdate::where('id', $id)->update($latestUpdate);

            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Latest Update record updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to edit Latest Update record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function LatestUpdateDisable($request)
    {
        try {

            $result = LatestUpdate::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->status == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    public function LatestUpdateDelete($request)
    {
        try {
            $result = LatestUpdate::where('id', $request->id)->delete();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Latest update record deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete latest update record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function LatestUpdateReOrdering($request)
    {
        try {

            // $result = LatestUpdateModel::where('id', $request->id)->delete();
            // if ($result) {
            //     return response()->json([
            //         'status'     => 'success',
            //         'message' => 'Homemenu deleted successfully',
            //     ], 200);
            // } else {
            //     return response()->json([
            //         'status'     => 'failure',
            //         'message' => 'Failed to delete Homemenu',
            //     ], 400);
            // }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    public function fetchLatestUpdate()
    {
        try {
            $result = LatestUpdate::where('status', 1)->get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Latest Update list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Latest update...Error:' . $e->getMessage(),
            ], 400);
        }
    }
    //?----------------------------latestUpdate-end--------------------------------------------------------------

    //?------------------------SliderImages-start----------------------------------------------------



    public function SliderImagesIndex()
    {
        try {
            $result = SliderImages::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Slider image list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Homemenu...Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function SliderImagesStore($request)
    {
        try {
            $lastId = SliderImages::orderBy('id', 'desc')->first();
            $sliderImage = [
                'order_id' => $lastId ? ($lastId->id) + 1 : 1,
                // 'header' => $request->header,
                // 'subHeader' => $request->subHeader,
                'image' => $request->image,
                'alternate_name' => ($lastId ? ($lastId->id) + 1 : 1) . "-slider"
            ];
            // if ($request->hasFile('image')) {
            //     $file = $request->file('image');
            //     $lastId = $lastId ? $lastId->id + 1 : 1;
            //     $filename1 = uploadFile($file, $lastId.'-slider', null, 'sliderImageUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename1;
            //     $filename = $filename1;

            //     $sliderImage['image'] = $filename;
            //     $sliderImage['alternate_name'] = $lastId.'-slider';
            // }
            $result = SliderImages::create($sliderImage);
            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'Slider image added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add slider image',
                ], 400);
            }
        } catch (\Exception $e) {
            // checkExitsFile($filename1);
            DB::rollback();

            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }



    public function SliderImagesEdit($request)
    {
        try {
            $sliderImage = [
                'header' => $request->header,
                'subHeader' => $request->subHeader,
                'image' => $request->image,
            ];
            $id = $request->id;
            // if ($request->hasFile('image')) {
            //     $file = $request->file('image');
            //     $filename = uploadFile($file, $id.'-slider', null, 'sliderImageUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename;
            //     $filename = $filename;

            //     $sliderImage['image'] = $filename;
            //     $sliderImage['alternate_name'] = $id.'-slider';
            // }
            $result = SliderImages::where('id', $id)->update($sliderImage);

            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Homemenu updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to edit homemenu',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function SliderImagesDisable($request)
    {
        try {

            $result = SliderImages::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->status == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    public function SliderImagesDelete($request)
    {
        try {


            $result = SliderImages::where('id', $request->id)->delete();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Slider image deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete Slider image',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function SliderImagesReOrdering($request)
    {
        try {

            // $result = SliderImagesModel::where('id', $request->id)->delete();
            // if ($result) {
            //     return response()->json([
            //         'status'     => 'success',
            //         'message' => 'Homemenu deleted successfully',
            //     ], 200);
            // } else {
            //     return response()->json([
            //         'status'     => 'failure',
            //         'message' => 'Failed to delete Homemenu',
            //     ], 400);
            // }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }



    //

    public function fetchSliderImages()
    {
        try {
            $result = SliderImages::where('status', 1)->get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Slider image list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching slider image...Error:' . $e->getMessage(),
            ], 400);
        }
    }
    //?------------------------SliderImages-end----------------------------------------------------

    //?------------------------curriculums-start----------------------------------------------------



    public function AnnouncementsIndex()
    {
        try {
            $result = curriculum::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Announcement list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Announcement...Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function AnnouncementsStore($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required',
                'sub_title' => 'required',
                'link' => 'required',
                'image' => 'required'
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $lastId = curriculum::orderBy('id', 'desc')->first();
            $announcement = [
                'title' => $request->title,
                'order_id' => $lastId ? ($lastId->id) + 1 : 1,
                'pdf_link' => $request->link,
                'sub_title' => $request->sub_title,
                'image' => $request->image,
            ];
            // if ($request->hasFile('link')) {

            //     $file = $request->file('link');

            //     $filename1 = uploadFile($file, ($lastId ? ($lastId->id) + 1 : 1).'-announcement', null, 'announcementUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename1;
            //     $filename = $filename1;

            //     $announcement['pdf_link'] = $filename;

            // } else {
            //     $announcement['pdf_link'] = $request->link;
            // }

            $result = curriculum::create($announcement);

            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'Announcement record added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add Announcement record',
                ], 400);
            }
        } catch (\Exception $e) {


            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function AnnouncementsEdit($request)
    {
        try {
            $announcement = [
                'title' => $request->title,
                'sub_title' => $request->sub_title,
                // "type" => $request->type,
            ];
            if ($request->link) {
                $announcement['pdf_link'] = $request->link;
            }
            if ($request->image) {
                $announcement['image'] = $request->image;
            }

            $id = $request->id;
            // if ($request->hasFile('link')) {
            //     $lastId = Announcements::where('id', $id)->first();
            //     if (! empty($lastId->pdf_link)) {
            //         checkExitsFile($lastId->pdf_link);
            //     }
            //     $file = $request->file('link');
            //     $filename1 = uploadFile($file, ($lastId ? $lastId->id : 1).'-announcement', null, 'announcementUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename1;
            //     $filename = $filename1;

            //     $announcement['pdf_link'] = $filename;
            // }

            $result = curriculum::where('id', $id)->update($announcement);
            // $result = 1;

            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Announcement record updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to edit Announcement record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function Announcementsdisable($request)
    {
        try {

            $result = curriculum::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->status == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    public function AnnouncementsDelete($request)
    {
        try {

            $data = curriculum::where('id', $request->id)->first();
            // checkExitsFile($data->pdf_link);

            $result = curriculum::where('id', $request->id)->delete();
            if ($result) {

                return response()->json([
                    'status' => 'success',
                    'message' => 'Announcement record deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete Announcement record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function AnnouncementsReOrdering($request)
    {
        try {

            // $result = AnnouncementsModel::where('id', $request->id)->delete();
            // if ($result) {
            //     return response()->json([
            //         'status'     => 'success',
            //         'message' => 'Homemenu deleted successfully',
            //     ], 200);
            // } else {
            //     return response()->json([
            //         'status'     => 'failure',
            //         'message' => 'Failed to delete Homemenu',
            //     ], 400);
            // }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function fetchAnnoucements()
    {
        try {
            $result = curriculum::where('status', 1)->get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Announcement list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Announcement...Error:' . $e->getMessage(),
            ], 400);
        }
    }
    //?------------------------curriculums-end----------------------------------------------------


    public function reorderUp($request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'parent_id' => 'required',
            // 'order_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        if ($request->order_id) {
            $updateData = ['order_id' => $request->order_id - 1];
        } else {
            $updateData = ['order_id' => 1];
        }
        // $result = HomeMenu::where('parent_id', $request->parent_id)->get();

        // foreach ($result as $item) {
        //     if ($item->order_id == $request->order_id - 1) {
        //         $res = HomeMenu::where('id', $item->id)->first();
        //         HomeMenu::where('id', $res->id)->update(['order_id' => $res->order_id + 1]);
        //     }
        // }
        HomeMenu::where('id', $request->id)->update($updateData);

        return response()->json([
            'status' => 'success',
            'message' => 'Moved Up',
        ], 200);
    }
    public function reorderDown($request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'parent_id' => 'required',
            // 'order_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'failure',
                'message' => $validator->errors()->first(),
            ], 400);
        }
        if ($request->order_id) {
            $updateData = ['order_id' => $request->order_id + 1];
        } else {
            $updateData = ['order_id' => 1];
        }
        // $result = HomeMenu::where('parent_id', $request->parent_id)->get();
        // foreach ($result as $item) {
        //     if ($item->order_id == $request->order_id + 1) {
        //         $res = HomeMenu::where('id', $item->id)->first();
        //         HomeMenu::where('id', $res->id)->update(['order_id' => $res->order_id - 1]);
        //     }
        // }
        HomeMenu::where('id', $request->id)->update($updateData);
        return response()->json([
            'status' => 'success',
            'message' => 'Moved Down',
        ], 200);
    }


    //?----------------------------Notic Board-start--------------------------------------------------------------
    public function NoticeBoardIndex()
    {
        try {
            $result = NoticeBoard::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Notice board record list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching notice board record...Error:' . $e->getMessage(),
            ], 400);
        }
    }
    public function NoticeBoardFetch($request)
    {
        try {
            $result = NoticeBoard::where('status', 1)->get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Notice board record list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching notice board record...Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function NoticeBoardStore($request)
    {
        try {
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

            $lastId = NoticeBoard::orderBy('id', 'desc')->first();
            $noticeBoard = [
                'title' => $request->title,
                'order_id' => $lastId ? ($lastId->id) + 1 : 1,
                'link' => $request->link,
            ];
            // if ($request->hasFile('link')) {
            //     $file = $request->file('link');
            //     $filename1 = uploadFile($file, ($lastId ? ($lastId->id) + 1 : 1).'-noticeBoard', null, 'noticeBoardUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename1;
            //     $filename = $filename1;

            //     $noticeBoard['link'] = $filename;
            // } else {
            //     $noticeBoard['link'] = $request->link;
            // }
            $result = NoticeBoard::create($noticeBoard);
            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'Notice board record added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add notice board record',
                ], 400);
            }
        } catch (\Exception $e) {

            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function NoticeBoardEdit($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $noticeBoard = [
                'title' => $request->title,
                // 'link' => $request->link,
            ];
            if ($request->link) {
                $noticeBoard['link'] = $request->link;
            }
            $id = $request->id;
            // if ($request->hasFile('link')) {
            //     $lastId = NoticeBoard::where('id', $id)->first();
            //     $file = $request->file('link');
            //     $filename1 = uploadFile($file, ($lastId ? $lastId->id : 1).'-noticeBoard', null, 'noticeBoardUpload');
            //     // $filename = Config::get('constants.PROJURL') . '/' . $filename1;
            //     $filename = $filename1;

            //     $noticeBoard['link'] = $filename;
            // } else {
            //     $noticeBoard['link'] = $request->link;
            // }
            $result = NoticeBoard::where('id', $id)->update($noticeBoard);

            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Notice board record updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to edit notice board record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function NoticeBoardDisable($request)
    {
        try {
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
            $result = NoticeBoard::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->status == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    public function NoticeBoardDelete($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $result = NoticeBoard::where('id', $request->id)->delete();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Notice Board record deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete notice Board record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function NoticeBoardReOrder($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required|exists:news_and_events,id',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }
            // $result = NoticeBoardModel::where('id', $request->id)->delete();
            // if ($result) {
            //     return response()->json([
            //         'status'     => 'success',
            //         'message' => 'Homemenu deleted successfully',
            //     ], 200);
            // } else {
            //     return response()->json([
            //         'status'     => 'failure',
            //         'message' => 'Failed to delete Homemenu',
            //     ], 400);
            // }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    //?----------------------------Notic Board-End--------------------------------------------------------------

    //?----------------------------News and events -start--------------------------------------------------------------
    public function fetchNewsAndEvent($request)
    {
        try {
            $result = NewsAndEvent::where('status', 1)->get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'News and events list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching news and events...Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function indexNewsAndEvent($request)
    {
        try {
            $result = NewsAndEvent::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'News and events list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching news and events...Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function storeNewsAndEvent($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required',
                'link' => 'required',
                'image' => 'required',
                // "type" => "required",
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $lastId = NewsAndEvent::orderBy('id', 'desc')->first();
            $newsAndEvents = [
                'title' => $request->title,
                'order_id' => $lastId ? ($lastId->id) + 1 : 1,
                'link' => $request->link,
                'image' => $request->image,

            ];
            // if ($request->hasFile('link')) {
            //     $file = $request->file('link');
            //     $filenamePdf = uploadFile($file, ($lastId ? ($lastId->id) + 1 : 1).'-newsAndEventsPdf', null, 'newsAndEventsPDFUpload');
            //     // $filenamePdf = Config::get('constants.PROJURL') . '/' . $filenamePdf;
            //     $filenamePdf = $filenamePdf;

            //     $newsAndEvents['link'] = $filenamePdf;
            // } else {
            //     $newsAndEvents['link'] = $request->link;
            // }

            // if ($request->hasFile('image')) {
            //     $file = $request->file('image');
            //     $filenameImage = uploadFile($file, ($lastId ? ($lastId->id) + 1 : 1).'-newsAndEventsImage', null, 'newsAndEventsImageUpload');
            //     // $filenameImage = Config::get('constants.PROJURL') . '/' . $filenameImage;
            //     $filenameImage = $filenameImage;

            //     $newsAndEvents['image'] = $filenameImage;
            // }
            $newsAndEvents['subtitle'] = $request->subtitle;
            $result = NewsAndEvent::create($newsAndEvents);
            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'News and event record added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add news and event record',
                ], 400);
            }
        } catch (\Exception $e) {


            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function editNewsAndEvent($request)
    {
        try {
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

            $newsAndEvents = [
                'title' => $request->title,
                // "type" => $request->type,
                'subtitle' => $request->subtitle,
            ];
            if ($request->link) {
                $newsAndEvents['link'] = $request->link;
            }
            if ($request->image) {
                $newsAndEvents['image'] = $request->image;
            }
            $id = $request->id;
            $lastId = NewsAndEvent::where('id', $id)->first();
            // if ($request->hasFile('link')) {
            //     $file = $request->file('link');
            //     $filenamePdf = uploadFile($file, ($lastId ? ($lastId->id) + 1 : 1).'-newsAndEventsPdf', null, 'newsAndEventsPDFUpload');
            //     // $filenamePdf = Config::get('constants.PROJURL') . '/' . $filenamePdf;
            //     $filenamePdf = $filenamePdf;

            //     $newsAndEvents['link'] = $filenamePdf;
            // } else {
            //     $newsAndEvents['link'] = $request->link;
            // }

            // if ($request->hasFile('image')) {
            //     $file = $request->file('image');
            //     $filenameImage = uploadFile($file, ($lastId ? ($lastId->id) + 1 : 1).'-newsAndEventsImage', null, 'newsAndEventsImageUpload');
            //     // $filenameImage = Config::get('constants.PROJURL') . '/' . $filenameImage;
            //     $filenameImage = $filenameImage;

            //     $newsAndEvents['image'] = $filenameImage;
            // }
            $result = NewsAndEvent::where('id', $id)->update($newsAndEvents);

            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'News and event record updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to edit news and event record',
                ], 400);
            }
        } catch (\Exception $e) {
            if (!empty($filenamePdf)) {
                checkExitsFile($filenamePdf);
            }
            if (!empty($filenameImage)) {
                checkExitsFile($filenameImage);
            }
            DB::rollback();

            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function disableNewsAndEvent($request)
    {
        try {
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
            $result = NewsAndEvent::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->status == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    public function deleteNewsAndEvent($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required|exists:news_and_events,id',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $result = NewsAndEvent::where('id', $request->id)->delete();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'News and event record deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete news and event record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function reOrderingNewsAndEvent($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required|exists:homemenu,id',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }
            // $result = NewsAndEvent::where('id', $request->id)->delete();
            // if ($result) {
            //     return response()->json([
            //         'status'     => 'success',
            //         'message' => 'Homemenu deleted successfully',
            //     ], 200);
            // } else {
            //     return response()->json([
            //         'status'     => 'failure',
            //         'message' => 'Failed to delete Homemenu',
            //     ], 400);
            // }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    //?----------------------------News and events -end--------------------------------------------------------------


    public function CircularIndex()
    {
        try {
            $result = Circular::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Circular list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Circular ..Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function CircularStore($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'date' => 'required',
                'title' => 'required',
                'link' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }
            $lastId = Circular::orderBy('id', 'desc')->first();
            $circular = [
                'date' => $request->date,
                'title' => $request->title,
                'order_id' => $lastId ? ($lastId->id) + 1 : 1,
                'link' => $request->link,
            ];

            $result = Circular::create($circular);
            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'Circular record added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add Circular record',
                ], 400);
            }
        } catch (\Exception $e) {


            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function CircularUpdate($request)
    {
        try {
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

            $circular = [
                'title' => $request->title,
                "date" => $request->date,
                // "type" => $request->type,
                //  'subtitle' => $request->subtitle,
            ];
            if ($request->link) {
                $circular['link'] = $request->link;
            }
            $id = $request->id;

            $result = Circular::where('id', $id)->update($circular);

            if ($result) {
                DB::commit();

                return response()->json([
                    'status' => 'success',
                    'message' => 'Circular record updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to edit Circular record',
                ], 400);
            }
        } catch (\Exception $e) {
            if (!empty($filenamePdf)) {
                checkExitsFile($filenamePdf);
            }
            if (!empty($filenameImage)) {
                checkExitsFile($filenameImage);
            }
            DB::rollback();

            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function CircularDelete($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required|exists:circulars,id',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $result = Circular::where('id', $request->id)->delete();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Circular record deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete Circular record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function Circulardisable($request)
    {
        try {
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
            $result = Circular::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->status == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    //?----------------------------Circular-end--------------------------------------------------------------

    //?----------------------------Members-start--------------------------------------------------------------

    public function indexMembers($request)
    {
        try {
            $result = Members::get();
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'data' => $result,
                    'message' => 'Members list fetched successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => 'Problem Fetching Members...Error:' . $e->getMessage(),
            ], 400);
        }
    }

    public function storeMembers($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required',
                'image' => 'required',
                // 'link' => 'required',
                // "type" => "required",
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $lastId = Members::orderBy('id', 'desc')->first();
            $Members = [
                'title' => $request->title,
                'order_id' => $lastId ? ($lastId->id) + 1 : 1,
                'link' => $request->link,
                'image' => $request->image,
            ];

            $Members['subtitle'] = $request->subtitle;

            $result = Members::create($Members);

            if ($result) {
                DB::commit();
                return response()->json([
                    'status' => 'success',
                    'message' => 'Member record added successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to add Members record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function editMembers($request)
    {
        try {
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

            $Members = [
                'title' => $request->title,
                'subtitle' => $request->subtitle,
                // "type" => $request->type,
            ];
            if ($request->image) {
                $Members['image'] = $request->image;
            }
            // if ($request->link) {
            //     $Members['link'] = $request->link;
            // }

            $id = $request->id;

            $result = Members::where('id', $id)->update($Members);

            if ($result) {
                DB::commit();
                return response()->json([
                    'status' => 'success',
                    'message' => 'Members record updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to Members and event record',
                ], 400);
            }
        } catch (\Exception $e) {
            DB::rollback();

            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function disableMembers($request)
    {
        try {
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
            $result = Members::where('id', $request->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => $request->status == 1 ? 'Status enabled successfully' : 'Status disabled successfully',
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    public function deleteMembers($request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'failure',
                    'message' => $validator->errors()->first(),
                ], 400);
            }

            $result = Members::where('id', $request->id)->delete();

            if ($result) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Members record deleted successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 'failure',
                    'message' => 'Failed to delete Members record',
                ], 400);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'failure',
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    //?----------------------------Members-end----------------------------------------------------------------
}
