<?php
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use App\Http\Controllers\Controller;

class CountController extends Controller
{
    /**
     * Get the count of records from a given table.
     *
     * @param string $table
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCount($table)
    {
        try {
            // List of allowed tables for security
            $allowedTables = [
                'homemenu',
                'notice_boards',
                'home_page_slider',
                'latest_update',
                'news_and_events',
                'members',
                'circulars',
            ];

            if (!in_array($table, $allowedTables)) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Table not allowed.',
                ], 400);
            }

            // Check if the table exists in the database
            if (!Schema::hasTable($table)) {
                return response()->json([
                    'status' => 'success',
                    'count' => 0,  // Return 0 if table doesn't exist
                ]);
            }

            // Count the records in the specified table
            $count = DB::table($table)->count();

            return response()->json([
                'status' => 'success',
                'count' => $count,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'success',  // Change to 'success' to always return success
                'count' => 0,           // Return 0 on any error
            ]);
        }
    }
}
