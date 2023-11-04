@extends('layouts.app', ['page_title' => 'Update Course', 'page_description' => 'This page allows you to update specific course'])
@section('content')
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h5>Update Course</h5>
                                <div class="card-header-right">
                                    <a href="{{ url('admin/courses') }}" class="btn btn-outline-danger btn-sm">Back</a>
                                </div>
                            </div>
                            <div class="card-block px-4">
                                <form action="{{ url('admin/courses', $course->id) }}" method="post">
                                    @csrf
                                    @method('PUT')
                                    @include('admin.courses.form')
                                    <div class="form-group row">
                                        <div class="d-flex float-right">
                                            <input type="hidden" name="id" value="{{ $course->id }}">
                                            <button class="btn btn-primary" type="submit">Save Changes</button>
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