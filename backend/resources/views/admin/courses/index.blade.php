@extends('layouts.app', ['page_title' => 'Manage Courses', 'page_description' => 'List of available courses'])
@section('content')
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card table-card">
                            <div class="card-header">
                                <h5>Manage Courses</h5>
                                <div class="card-header-right">
                                    <a href="{{ url('admin/courses/create') }}" class="btn btn-outline-primary btn-sm">Add New Course</a>
                                </div>
                            </div>
                            <div class="card-block p-b-0">
                                <div class="table-responsive">
                                    <table class="table table-hover m-b-0">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse ($courses as $key => $item)
                                            <tr>
                                                <td style="width: 3%">{{ $key+1 }}</td>
                                                <td style="width: 85%">{{ $item->name }}</td>
                                                <td style="width: 15%">
                                                    <div class="dropdown-primary dropdown open">
                                                        <button class="btn btn-primary btn-xs dropdown-toggle waves-effect waves-light" type="button" id="dropdown-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Action</button>
                                                        <div class="dropdown-menu" aria-labelledby="dropdown-2" data-dropdown-in="fadeIn" data-dropdown-out="fadeOut">
                                                            <a class="dropdown-item waves-light waves-effect" href="{{ url('admin/courses', $item->id) }}/edit">Edit</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item waves-light waves-effect" href="javascript:;" onclick="removeCourse({{ $item->id }})">Delete</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            @empty
                                            <tr>
                                                <td colspan="3" class="text-center">No data available</td>
                                            </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
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
<script>
function removeCourse(id) {
    if(confirm('Are you sure you want to delete this course? All questions tied up on this course will also be deleted.')) {
        $.ajax({
            type: "DELETE",
            url: "{{ url('admin/courses') }}/"+id,
            dataType: "json",
            success: function (response) {
                location.reload();
            }
        });
    }
}
</script>
@endpush