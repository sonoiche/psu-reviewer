<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\DataTables\QuestionsDataTable;
use App\Http\Requests\QuestionRequest;
use App\Models\Course;
use App\Models\Question;

class QuestionController extends Controller
{
    public function index(QuestionsDataTable $dataTable)
    {
        return $dataTable->render('admin.questions.index');
    }

    public function create()
    {
        $data['courses'] = Course::orderBy('name')->get();
        return view('admin.questions.create', $data);
    }

    public function store(QuestionRequest $request)
    {
        $question = new Question();
        $question->question     = $request['question'];
        $question->category     = $request['category'];
        $question->course_id    = $request['course_id'];
        $question->json_options = json_encode(array_filter($request['choices']));
        $question->answer       = $request['answer'];
        $question->save();

        if(isset($request['add_another'])) {
            return redirect()->to('admin/questions/create')->with(['course_id' => $request['course_id'], 'category' => $request['category']]);
        }

        return redirect()->to('admin/questions');
    }
}
