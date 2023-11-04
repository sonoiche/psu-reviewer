@extends('layouts.app', ['page_title' => 'Add New Question', 'page_description' => 'This page allows you to create new question'])
@section('content')
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Add New Question</h5>
                                <div class="card-header-right">
                                    <a href="{{ url('admin/questions') }}" class="btn btn-outline-danger btn-sm">Back</a>
                                </div>
                            </div>
                            <div class="card-block px-4">
                                <form action="{{ url('admin/questions') }}" method="post">
                                    @csrf
                                    <div class="form-group row">
                                        <label for="course_id">Course</label>
                                        <select name="course_id" id="course_id" class="form-control">
                                            <option value="">--</option>
                                            @foreach ($courses as $item)
                                            <option value="{{ $item->id }}" {{ (session()->has('course_id') && session()->get('course_id') == $item->id) ? 'selected' : '' }}>{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group row">
                                        <label for="category">Category</label>
                                        <select name="category" id="category" class="form-control">
                                            <option value=""></option>
                                            <option value="General" {{ (session()->has('category') && session()->get('category') == 'General') ? 'selected' : '' }}>General</option>
                                            <option value="Professional" {{ (session()->has('category') && session()->get('category') == 'Professional') ? 'selected' : '' }}>Professional</option>
                                            <option value="Specialization" {{ (session()->has('category') && session()->get('category') == 'Specialization') ? 'selected' : '' }}>Specialization</option>
                                        </select>
                                    </div>
                                    <div class="form-group row">
                                        <label for="question">Question</label>
                                        <input type="text" name="question" id="question" class="form-control" />
                                    </div>
                                    <div class="row">
                                        <label>Choices</label>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-6 pl-0">
                                            <input type="text" name="choices[]" class="form-control" placeholder="A. " />
                                        </div>
                                        <div class="col-6 pr-0">
                                            <input type="text" name="choices[]" class="form-control" placeholder="B. " />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-6 pl-0">
                                            <input type="text" name="choices[]" class="form-control" placeholder="C. " />
                                        </div>
                                        <div class="col-6 pr-0">
                                            <input type="text" name="choices[]" class="form-control" placeholder="D. " />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-6 pl-0">
                                            <input type="text" name="choices[]" class="form-control" placeholder="E. " />
                                        </div>
                                        <div class="col-6 pr-0">
                                            <input type="text" name="choices[]" class="form-control" placeholder="F. " />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="answer">Correct Answer</label>
                                        <input type="text" name="answer" id="answer" class="form-control" />
                                    </div>
                                    <div class="form-group row">
                                        <div class="d-flex float-right">
                                            <button class="btn btn-primary" type="submit">Submit</button> &nbsp;
                                            <button class="btn btn-primary" type="submit" name="add_another" value="1">Save and Add Another</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
{!! JsValidator::formRequest('App\Http\Requests\QuestionRequest') !!}
@endpush