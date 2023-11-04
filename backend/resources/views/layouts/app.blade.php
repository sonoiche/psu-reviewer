<!DOCTYPE html>
<html lang="en">
    <head>
        <title>{{ config('app.name') }} | {{ $page_title }}</title>

        <!--[if lt IE 10]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="Admindek Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
        <meta name="keywords" content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app" />
        <meta name="author" content="colorlib" />

        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet" />

        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/bootstrap.min.css') }}" />

        <link rel="stylesheet" href="{{ url('assets/css/waves.min.css') }}" type="text/css" media="all" />

        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/feather.css') }}" />

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.1.0/css/all.css" />

        <link rel="stylesheet" href="{{ url('assets/css/chartist.css') }}" type="text/css" media="all" />

        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/style.css') }}" />
        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/widget.css') }}" />
        @yield('css')
    </head>
    <body>
        <div class="loader-bg">
            <div class="loader-bar"></div>
        </div>

        <div id="pcoded" class="pcoded">
            <div class="pcoded-overlay-box"></div>
            <div class="pcoded-container navbar-wrapper">
                @include('layouts.navbar')

                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        @include('layouts.sidebar')

                        <div class="pcoded-content">
                            <div class="page-header card">
                                <div class="row align-items-end">
                                    <div class="col-lg-8">
                                        <div class="page-header-title">
                                            <i class="feather icon-home bg-c-blue"></i>
                                            <div class="d-inline">
                                                <h5>{{ $page_title }}</h5>
                                                <span>{{ $page_description }}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="page-header-breadcrumb">
                                            <ul class="breadcrumb breadcrumb-title">
                                                <li class="breadcrumb-item">
                                                    <a href="index.html"><i class="feather icon-home"></i></a>
                                                </li>
                                                <li class="breadcrumb-item"><a href="#!">{{ $page_title }}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            @yield('content')

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--[if lt IE 10]>
            <div class="ie-warning">
                <h1>Warning!!</h1>
                <p>
                    You are using an outdated version of Internet Explorer, please upgrade <br />
                    to any of the following web browsers to access this website.
                </p>
                <div class="iew-container">
                    <ul class="iew-download">
                        <li>
                            <a href="http://www.google.com/chrome/">
                                <img src="assets/images/browser/chrome.png" alt="Chrome" />
                                <div>Chrome</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.mozilla.org/en-US/firefox/new/">
                                <img src="assets/images/browser/firefox.png" alt="Firefox" />
                                <div>Firefox</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.opera.com">
                                <img src="assets/images/browser/opera.png" alt="Opera" />
                                <div>Opera</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.apple.com/safari/">
                                <img src="assets/images/browser/safari.png" alt="Safari" />
                                <div>Safari</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                                <img src="assets/images/browser/ie.png" alt="" />
                                <div>IE (9 & above)</div>
                            </a>
                        </li>
                    </ul>
                </div>
                <p>Sorry for the inconvenience!</p>
            </div>
        <![endif]-->

        <script type="text/javascript" src="{{ url('assets/js/jquery.min.js') }}"></script>
        <script type="text/javascript" src="{{ url('assets/js/jquery-ui.min.js') }}"></script>
        <script type="text/javascript" src="{{ url('assets/js/popper.min.js') }}"></script>
        <script type="text/javascript" src="{{ url('assets/js/bootstrap.min.js') }}"></script>

        <script src="{{ url('assets/js/waves.min.js') }}"></script>

        <script type="text/javascript" src="{{ url('assets/js/jquery.slimscroll.js') }}"></script>

        <script src="{{ url('assets/js/jquery.flot.js') }}"></script>
        <script src="{{ url('assets/js/jquery.flot.categories.js') }}"></script>
        <script src="{{ url('assets/js/curvedLines.js') }}"></script>
        <script src="{{ url('assets/js/jquery.flot.tooltip.min.js') }}"></script>

        <script src="{{ url('assets/js/chartist.js') }}"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/amcharts/3.21.15/amcharts.js"></script>
        <script src="{{ url('assets/js/serial.js') }}"></script>
        <script src="{{ url('assets/js/light.js') }}"></script>

        <script src="{{ url('assets/js/pcoded.min.js') }}"></script>
        <script src="{{ url('assets/js/vertical-layout.min.js') }}"></script>
        <script type="text/javascript" src="{{ url('assets/js/custom-dashboard.min.js') }}"></script>
        <script type="text/javascript" src="{{ url('assets/js/script.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
        @stack('scripts')
    </body>
</html>