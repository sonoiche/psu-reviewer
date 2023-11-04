<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\Question;
use App\Models\UserExam;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ExamController extends Controller
{
    public function store(Request $request)
    {
        $question_id = $request['question_id'];
        $question    = Question::find($question_id);
        $user_id     = $request['user_id'];

        UserExam::updateOrCreate(
            [
                'user_id'           => $user_id, 
                'question_id'       => $question_id, 
                'course_id'         => $question->course_id, 
                'category'          => $question->category, 
                'date_submitted'    => Carbon::now()->format('Y-m-d')
            ],
            [
                'user_answer'       => $request['user_answer'],
                'correct_answer'    => $question->answer,
                'status'            => $question->answer == $request['user_answer'] ? 'Correct' : 'Wrong'
            ]
        );

        $data['statusCode'] = 200;
        return response()->json($data);
    }

    public function show(Request $request, $user_id)
    {
        $category       = $request['category'];
        $course_id      = $request['course_id'];

        $data['data']   = UserExam::where('user_id', $user_id)
            ->where('course_id', $course_id)
            ->where('category', $category)
            ->first();

        $data['statusCode'] = 200;
        return response()->json($data);
    }
}
