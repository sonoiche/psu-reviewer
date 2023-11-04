<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Admindek | Admin Template</title>

        <!--[if lt IE 10]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="Admindek Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
        <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
        <meta name="author" content="colorlib" />

        <link rel="icon" href="../files/assets/images/favicon.ico" type="image/x-icon" />

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Quicksand:500,700" rel="stylesheet" />

        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/bootstrap.min.css') }}" />

        <link rel="stylesheet" href="{{ url('assets/css/waves.min.css" type="text/css" media="all') }}" />

        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/feather.css') }}" />

        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.1.0/css/all.css" />

        <link rel="stylesheet" href="{{ url('assets/css/chartist.css" type="text/css" media="all') }}" />

        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/style.css') }}" />
        <link rel="stylesheet" type="text/css" href="{{ url('assets/css/pages.css') }}" />
    </head>
    <body themebg-pattern="theme1">
        @include('layouts.loader')

        <section class="login-block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif
                        <form class="md-float-material form-material" method="POST" action="{{ route('password.email') }}">
                            @csrf
                            <div class="text-center">
                                <img src="{{ url('assets/images/logo.png') }}" alt="logo.png" />
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-left">Recover your password</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="text" name="email" class="form-control @error('email') is-invalid @enderror" required />
                                        <span class="form-bar"></span>
                                        <label class="float-label">Your Email Address</label>
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Reset Password</button>
                                        </div>
                                    </div>
                                    <p class="f-w-600 text-right">Back to <a href="{{ url('login') }}">Login.</a></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

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
                                <img src="../files/assets/images/browser/chrome.png" alt="Chrome" />
                                <div>Chrome</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.mozilla.org/en-US/firefox/new/">
                                <img src="../files/assets/images/browser/firefox.png" alt="Firefox" />
                                <div>Firefox</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.opera.com">
                                <img src="../files/assets/images/browser/opera.png" alt="Opera" />
                                <div>Opera</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.apple.com/safari/">
                                <img src="../files/assets/images/browser/safari.png" alt="Safari" />
                                <div>Safari</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                                <img src="../files/assets/images/browser/ie.png" alt="" />
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

        <script type="text/javascript" src="{{ url('assets/js/modernizr.js') }}"></script>
        <script type="text/javascript" src="{{ url('assets/js/css-scrollbars.js') }}"></script>
        <script type="text/javascript" src="{{ url('assets/js/common-pages.js') }}"></script>
    </body>
</html>