@extends('layouts.app', ['page_title' => 'Dashboard', 'page_description' => 'This is the admin dashboard'])
@section('content')
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">
            <div class="page-body">
                <div class="row">
                    {{-- <div class="col-md-12 col-xl-8">
                        <div class="card sale-card">
                            <div class="card-header">
                                <h5>Deals Analytics</h5>
                            </div>
                            <div class="card-block">
                                <div id="sales-analytics" class="chart-shadow" style="height: 380px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-xl-4">
                        <div class="card comp-card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6 class="m-b-25">Impressions</h6>
                                        <h3 class="f-w-700 text-c-blue">1,563</h3>
                                        <p class="m-b-0">May 23 - June 01 (2017)</p>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-eye bg-c-blue"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card comp-card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6 class="m-b-25">Goal</h6>
                                        <h3 class="f-w-700 text-c-green">30,564</h3>
                                        <p class="m-b-0">May 23 - June 01 (2017)</p>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-bullseye bg-c-green"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card comp-card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6 class="m-b-25">Impact</h6>
                                        <h3 class="f-w-700 text-c-yellow">42.6%</h3>
                                        <p class="m-b-0">May 23 - June 01 (2017)</p>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-hand-paper bg-c-yellow"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-12">
                        <div class="card proj-progress-card">
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-xl-3 col-md-6">
                                        <h6>Published Project</h6>
                                        <h5 class="m-b-30 f-w-700">532<span class="text-c-green m-l-10">+1.69%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-red" style="width: 25%;"></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <h6>Completed Task</h6>
                                        <h5 class="m-b-30 f-w-700">4,569<span class="text-c-red m-l-10">-0.5%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-blue" style="width: 65%;"></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <h6>Successfull Task</h6>
                                        <h5 class="m-b-30 f-w-700">89%<span class="text-c-green m-l-10">+0.99%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-green" style="width: 85%;"></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <h6>Ongoing Project</h6>
                                        <h5 class="m-b-30 f-w-700">365<span class="text-c-green m-l-10">+0.35%</span></h5>
                                        <div class="progress">
                                            <div class="progress-bar bg-c-yellow" style="width: 45%;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-xl-4">
                        <div class="card card-blue text-white">
                            <div class="card-block p-b-0">
                                <div class="row m-b-50">
                                    <div class="col">
                                        <h6 class="m-b-5">Sales In July</h6>
                                        <h5 class="m-b-0 f-w-700">$2665.00</h5>
                                    </div>
                                    <div class="col-auto text-center">
                                        <p class="m-b-5">Direct Sale</p>
                                        <h6 class="m-b-0">$1768</h6>
                                    </div>
                                    <div class="col-auto text-center">
                                        <p class="m-b-5">Referal</p>
                                        <h6 class="m-b-0">$897</h6>
                                    </div>
                                </div>
                                <div id="sec-ecommerce-chart-line" class style="height: 60px;"></div>
                                <div id="sec-ecommerce-chart-bar" style="height: 195px;"></div>
                            </div>
                        </div>
                    </div> --}}

                </div>
            </div>
        </div>
    </div>
</div>
@endsection