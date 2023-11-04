@extends('layouts.app', ['page_title' => 'Add New Course', 'page_description' => 'This page allows you to create new course'])
@section('content')
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Add New Courses</h5>
                                <div class="card-header-right">
                                    <a href="{{ url('admin/courses') }}" class="btn btn-outline-danger btn-sm">Back</a>
                                </div>
                            </div>
                            <div class="card-block px-4">
                                <form action="{{ url('admin/courses') }}" method="post">
                                    @csrf
                                    @include('admin.courses.form')
                                    <div class="form-group row">
                                        <div class="d-flex float-right">
                                            <button class="btn btn-primary" type="submit">Submit</button>
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
{!! JsValidator::formRequest('App\Http\Requests\CourseRequest') !!}
@endpush