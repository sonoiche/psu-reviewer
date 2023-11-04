<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\CourseRequest;
use App\Models\Course;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function index()
    {
        $data['courses'] = Course::latest()->get();
        return view('admin.courses.index', $data);
    }

    public function create()
    {
        return view('admin.courses.create');
    }

    public function store(CourseRequest $request)
    {
        $course = new Course();
        $course->name = $request['name'];
        $course->save();

        return redirect()->to('admin/courses');
    }

    public function edit($id)
    {
        $data['course'] = Course::find($id);
        return view('admin.courses.edit', $data);
    }

    public function update(CourseRequest $request, $id)
    {
        $course = Course::find($id);
        $course->name = $request['name'];
        $course->save();

        return redirect()->to('admin/courses');
    }
}
