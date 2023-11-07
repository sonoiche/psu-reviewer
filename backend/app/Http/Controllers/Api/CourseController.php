<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;

class CourseController extends Controller
{
    public function index()
    {
        $data['data'] = Course::orderBy('name')->get();
        $data['statusCode'] = 200;
        return response()->json($data);
    }
}
