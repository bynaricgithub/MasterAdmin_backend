<?php

use App\Http\Controllers\ActController;
use App\Http\Controllers\Announcements\AnnouncementsController;
use App\Http\Controllers\Api\CountController;
use App\Http\Controllers\Auth\AuthenticationController;
use App\Http\Controllers\Controller;
use App\Http\Controllers\HomeMenu\HomeMenuController;
use App\Http\Controllers\LatestUpdate\LatestUpdateController;
use App\Http\Controllers\NoticeBoard\NoticeBoardController;
use App\Http\Controllers\SliderImages\SliderImagesController;
use App\Http\Controllers\NewsAndEvents\NewsAndEventController;
use App\Http\Controllers\AnnualReport\AnnualReportController;
use App\Http\Controllers\Norms\NormsController;
use App\Http\Controllers\Circular\CircularController;
use App\Http\Controllers\Corrigedum\CorrigedumController;
use App\Http\Controllers\FeesInformation;
use App\Http\Controllers\Minutes\MinutesController;
use App\Http\Controllers\GR\GRController;
use App\Http\Controllers\GrievanceController;
use App\Http\Controllers\MembersController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

//?-----------only for the testing--------------------------------
// Route::get('/testing', function (Request $request) {
//     $password = 'admiin';
//     $hashedPassword = Hash::make($password);
//     echo $hashedPassword;
// });
//?-------------------------------------------------------------------

Route::post('/login', [AuthenticationController::class, 'create'])->name('adminLogin');
//?-------------if you want to do the registration for the admin----------------------------------------------------
Route::post('/registration', [AuthenticationController::class, 'registration'])->name('adminRegistration');

//?-----------------------------------------------------------------------------------------------------------------


//?-------------landing page apis----------------------------

//?--------------------- Fees Information ---------------------------------- 
Route::get('/institutes', [FeesInformation::class, 'index'])->name('FeesInformation.index');
Route::get('/fees', [FeesInformation::class, 'feesIndex'])->name('FeesInformation.feesIndex');


//?------------------Grievance Outer-----------------------------
Route::post('/grievance/add', [GrievanceController::class, 'store'])->name('Grievance.store');
Route::post('/grievance/mobile/otp', [GrievanceController::class, 'sendOTP'])->name('Grievance.sendOTP');
Route::post('/grievance/mobile/otp/verify', [GrievanceController::class, 'verifyOTP'])->name('Grievance.verifyOTP');
Route::get('/grievance/status/{complaint_id}', [GrievanceController::class, 'statusIndex'])->name('Grievance.statusIndex');

Route::get('/district', [GrievanceController::class, 'getDistrict'])->name('Grievance.district');
Route::get('/taluka', [GrievanceController::class, 'getTaluka'])->name('Grievance.taluka');
Route::get('/courses', [GrievanceController::class, 'getCourses'])->name('Grievance.courses');


//?-----------------------------------------------------------------------------------------------------------------

//?-------------landing page apis----------------------------
Route::get('/homemenu/fetchHomeMenu', [HomemenuController::class, 'fetchHomeMenu'])->name('homemenus.fetchHomeMenu');
Route::get('/latest-update/fetchLatestUpdate', [LatestUpdateController::class, 'fetchLatestUpdate'])->name('latesUpdate.fetchLatestUpdate');
Route::get('/slider-images/HomeSlider', [SliderImagesController::class, 'fetchSliderImages'])->name('sliderImages.fetchSliderImages');
Route::get('/curriculums/fetchCurriculums', [AnnouncementsController::class, 'fetchAnnoucements'])->name('curriculums.fetchAnnoucements');
Route::get('/news-and-events/fetchNewAndEvent', [NewsAndEventController::class, 'fetchNewAndEvent'])->name('newsAndEvents.fetchNewAndEvent');
Route::get('/notice-board/fechNoticeBoard', [NoticeBoardController::class, 'fechNoticeBoard'])->name('noticeBoard.fechNoticeBoard');

Route::post('/reorder/up', [HomemenuController::class, 'reorderUp'])->name('noticeBoard.reorderUp');
Route::post('/reorder/down', [HomemenuController::class, 'reorderDown'])->name('noticeBoard.reorderDown');
Route::post('/reorder/menu', [HomemenuController::class, 'reorderMenu'])->name('noticeBoard.reorderMenu');

//?---visitorCount-----
Route::post('/visitor', [HomemenuController::class, 'saveVisitorCount']);
Route::get('/visitor/count', [HomemenuController::class, 'getUserVisitCount']);
Route::get('/lastUpdateDate', [HomemenuController::class, 'getLastUpdateDate']);

Route::get('/gr/listing', [GRController::class, 'index'])->name('gr.index');
Route::get('/annual-report/listing', [AnnualReportController::class, 'index'])->name('annual-report.index');
Route::get('/norms/listing', [NormsController::class, 'index'])->name('norms.index');
Route::get('/circular/listing', [CircularController::class, 'index'])->name('circular.index');
Route::get('/corrigedum/listing', [CorrigedumController::class, 'index'])->name('corrigedum.index');
Route::get('/acts/listing', [ActController::class, 'index'])->name('acts.index');
Route::get('/minutes/listing', [MinutesController::class, 'index'])->name('minutes.index');
Route::get('/members/listing', [MembersController::class, 'index'])->name('members.index');
//?----------------------------------------------------------

Route::post('/uploadImage', [AnnouncementsController::class, 'demo'])->name('uploadImage');


//--------Minuits ----------


//---------------------------------------------------------------------------------------------------------------------
//artical - articles - php artisan make:model article 
//artical - articles - php artisan make:controller articleController 
Route::middleware(['auth:api', 'check.token.expiry.admin'])->group(function () {

    //?---Grievance-----
    Route::get('/grievance/listing', [GrievanceController::class, 'index'])->name('Grievance.fetch');
    Route::put('/grievance/update', [GrievanceController::class, 'edit'])->name('Grievance.edit');

    //?---Acts-----
    // Route::get('/acts/listing', [ActController::class, 'index'])->name('acts.index');
    Route::post('/acts/add', [ActController::class, 'store'])->name('acts.add');
    Route::put('/acts/update', [ActController::class, 'edit'])->name('acts.update');
    Route::delete('/acts/delete', [ActController::class, 'delete'])->name('acts.delete');
    Route::put('/acts/disable', [ActController::class, 'disable'])->name('acts.disable');

    //?---Minutes-----
    // Route::get('/minutes/listing', [MinutesController::class, 'index'])->name('minutes.index');
    Route::post('/minutes/add', [MinutesController::class, 'store'])->name('minutes.add');
    Route::put('/minutes/update', [MinutesController::class, 'edit'])->name('minutes.update');
    Route::delete('/minutes/delete', [MinutesController::class, 'delete'])->name('minutes.delete');
    Route::put('/minutes/disable', [MinutesController::class, 'disable'])->name('minutes.disable');
    //?---HomeMenu-----
    Route::get('/homemenu', [HomemenuController::class, 'index'])->name('homemenus.indexHomemenu');
    Route::post('/homemenu', [HomemenuController::class, 'store'])->name('homemenus.addHomemenu');
    Route::delete('/homemenu', [HomemenuController::class, 'destroy'])->name('homemenus.deleteHomemenu');
    Route::put('/homemenu', [HomemenuController::class, 'update'])->name('homemenus.updateHomemenu');
    Route::post('/homemenu/disable', [HomemenuController::class, 'disable'])->name('homemenus.disableHomemenu');
    //?---latestUpdate-----
    Route::get('/latest-update/listing', [LatestUpdateController::class, 'index'])->name('latesUpdate.index');
    Route::post('/latest-update/add', [LatestUpdateController::class, 'store'])->name('latesUpdate.add');
    Route::put('/latest-update/update', [LatestUpdateController::class, 'edit'])->name('latesUpdate.update');
    Route::put('/latest-update/disable', [LatestUpdateController::class, 'disable'])->name('latesUpdate.disable');
    Route::delete('/latest-update/delete', [LatestUpdateController::class, 'delete'])->name('latesUpdate.delete');
    Route::post('/latest-update/re-ordering', [LatestUpdateController::class, 'reOrdering'])->name('latesUpdate.reOrdering');
    //?---Slider Images---
    Route::get('/slider-images/listing', [SliderImagesController::class, 'index'])->name('sliderImages.index');
    Route::post('/slider-images/add', [SliderImagesController::class, 'store'])->name('sliderImages.add');
    Route::put('/slider-images/update', [SliderImagesController::class, 'edit'])->name('sliderImages.update');
    Route::post('/slider-images/disable', [SliderImagesController::class, 'disable'])->name('sliderImages.disable');
    Route::delete('/slider-images/delete', [SliderImagesController::class, 'delete'])->name('sliderImages.delete');
    Route::post('/slider-images/re-ordering', [SliderImagesController::class, 'reOrdering'])->name('sliderImages.reOrdering');
    //?---Announcements---
    Route::get('/curriculums/listing', [AnnouncementsController::class, 'index'])->name('curriculums.index');
    Route::post('/curriculums/add', [AnnouncementsController::class, 'store'])->name('curriculums.add');
    Route::put('/curriculums/update', [AnnouncementsController::class, 'edit'])->name('curriculums.update');
    Route::put('/curriculums/disable', [AnnouncementsController::class, 'disable'])->name('curriculums.disable');
    Route::delete('/curriculums/delete', [AnnouncementsController::class, 'delete'])->name('curriculums.delete');
    Route::post('/curriculums/re-ordering', [AnnouncementsController::class, 'reOrdering'])->name('curriculums.reOrdering');

    //---Notice Board---
    Route::get('/notice-board/listing', [NoticeBoardController::class, 'index'])->name('noticeBoard.index');
    Route::post('/notice-board/add', [NoticeBoardController::class, 'store'])->name('noticeBoard.add');
    Route::put('/notice-board/update', [NoticeBoardController::class, 'edit'])->name('noticeBoard.update');
    Route::put('/notice-board/disable', [NoticeBoardController::class, 'disable'])->name('noticeBoard.disable');
    Route::delete('/notice-board/delete', [NoticeBoardController::class, 'delete'])->name('noticeBoard.delete');
    Route::post('/notice-board/re-ordering', [NoticeBoardController::class, 'reOrdering'])->name('noticeBoard.reOrdering');

    //---News And Events---
    Route::get('/news-and-events/listing', [NewsAndEventController::class, 'index'])->name('newsAndEvents.index');
    Route::post('/news-and-events/add', [NewsAndEventController::class, 'store'])->name('newsAndEvents.add');
    Route::put('/news-and-events/update', [NewsAndEventController::class, 'edit'])->name('newsAndEvents.update');
    Route::put('/news-and-events/disable', [NewsAndEventController::class, 'disable'])->name('newsAndEvents.disable');
    Route::delete('/news-and-events/delete', [NewsAndEventController::class, 'delete'])->name('newsAndEvents.delete');

    //---Members---
    // Route::get('/members/listing', [MembersController::class, 'index'])->name('members.index');
    Route::post('/members/add', [MembersController::class, 'store'])->name('members.add');
    Route::put('/members/update', [MembersController::class, 'edit'])->name('members.update');
    Route::put('/members/disable', [MembersController::class, 'disable'])->name('members.disable');
    Route::delete('/members/delete', [MembersController::class, 'delete'])->name('members.delete');


    Route::get('whoAmI', [AuthenticationController::class, 'whoAmI'])->name('whoAmI');

    //------GR-------
    // Route::get('/gr/listing', [GRController::class, 'index'])->name('gr.index');
    Route::post('/gr/add', [GRController::class, 'store'])->name('gr.add');
    Route::put('/gr/update', [GRController::class, 'edit'])->name('gr.update');
    Route::delete('/gr/delete', [GRController::class, 'delete'])->name('gr.delete');
    Route::put('/gr/disable', [GRController::class, 'disable'])->name('gr.disable');


    //-------Annual Report------

    // Route::get('/annual-report/listing', [AnnualReportController::class, 'index'])->name('annual-report.index');
    Route::post('/annual-report/add', [AnnualReportController::class, 'store'])->name('annual-report.add');
    Route::put('/annual-report/update', [AnnualReportController::class, 'edit'])->name('annual-report.update');
    Route::delete('/annual-report/delete', [AnnualReportController::class, 'delete'])->name('annual-report.delete');
    Route::put('/annual-report/disable', [AnnualReportController::class, 'disable'])->name('annual-report.disable');


    //-------Norms------

    // Route::get('/norms/listing', [NormsController::class, 'index'])->name('norms.index');
    Route::post('/norms/add', [NormsController::class, 'store'])->name('norms.add');
    Route::put('/norms/update', [NormsController::class, 'edit'])->name('norms.update');
    Route::delete('/norms/delete', [NormsController::class, 'delete'])->name('norms.delete');
    Route::put('/norms/disable', [NormsController::class, 'disable'])->name('norms.disable');

    //-------Circular------

    // Route::get('/circular/listing', [CircularController::class, 'index'])->name('circular.index');
    Route::post('/circular/add', [CircularController::class, 'store'])->name('circular.add');
    Route::put('/circular/update', [CircularController::class, 'edit'])->name('circular.update');
    Route::delete('/circular/delete', [CircularController::class, 'delete'])->name('circular.delete');
    Route::put('/circular/disable', [CircularController::class, 'disable'])->name('circular.disable');

    //-------Corrigedum------

    // Route::get('/corrigedum/listing', [CorrigedumController::class, 'index'])->name('corrigedum.index');
    Route::post('/corrigedum/add', [CorrigedumController::class, 'store'])->name('corrigedum.add');
    Route::put('/corrigedum/update', [CorrigedumController::class, 'edit'])->name('corrigedum.update');
    Route::delete('/corrigedum/delete', [CorrigedumController::class, 'delete'])->name('corrigedum.delete');
    Route::put('/corrigedum/disable', [CorrigedumController::class, 'disable'])->name('corrigedum.disable');

    Route::get('/count/{table}', [CountController::class, 'getCount']);


    //-----------logout--------
    Route::post('logout', [AuthenticationController::class, 'logout'])->name('logout');

    //?----------------this is testing part---------------------------------------------------------
    Route::get('/testing', function (Request $request) {

        echo 'working...';
    });
});

// Route::resource('authentication', AuthenticationController::class);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
