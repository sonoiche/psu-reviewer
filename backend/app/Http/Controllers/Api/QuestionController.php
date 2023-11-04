<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    public function show(Request $request, $course_id)
    {
        $category = $request['category'];
        $data['data'] = Question::where('course_id', $course_id)
            ->where('category', $category)
            ->get();

        return response()->json($data);
    }
}
