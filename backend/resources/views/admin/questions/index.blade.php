@extends('layouts.app', ['page_title' => 'Manage Questionaires', 'page_description' => 'List of available Questions'])
@section('content')
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>Manage Questionaires</h5>
                                <div class="card-header-right">
                                    <a href="{{ url('admin/questions/create') }}" class="btn btn-outline-primary btn-sm">Add New Question</a>
                                </div>
                            </div>
                            <div class="card-block p-b-5">
                                {!! $dataTable->table() !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('css')
<link rel="stylesheet" type="text/css" href="{{ url('assets/datatables.net-bs4/css/dataTables.bootstrap4.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ url('assets/datatables.net-bs4/css/buttons.dataTables.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ url('assets/datatables.net-bs4/css/responsive.bootstrap4.min.css') }}">
@endsection

@push('scripts')
<script src="{{ url('assets/datatables.net-bs4/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ url('assets/datatables.net-bs4/js/dataTables.buttons.min.js') }}"></script>
<script src="{{ url('assets/datatables.net-bs4/js/buttons.print.min.js') }}"></script>
<script src="{{ url('assets/datatables.net-bs4/js/buttons.html5.min.js') }}"></script>
<script src="{{ url('assets/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ url('assets/datatables.net-bs4/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ url('vendor/datatables/buttons.server-side.js') }}"></script>
{!! $dataTable->scripts() !!}
@endpush