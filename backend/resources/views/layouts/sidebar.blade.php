<nav class="pcoded-navbar">
    <div class="nav-list">
        <div class="pcoded-inner-navbar main-menu">
            <div class="pcoded-navigation-label">Navigation</div>
            <ul class="pcoded-item pcoded-left-item">
                <li class="">
                    <a href="{{ url('home') }}" class="waves-effect waves-dark">
                        <span class="pcoded-micon">
                            <i class="feather icon-home"></i>
                        </span>
                        <span class="pcoded-mtext">Dashboard</span>
                    </a>
                </li>
            </ul>
            <ul class="pcoded-item pcoded-left-item">
                <li class="pcoded-hasmenu">
                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                        <span class="pcoded-micon"><i class="feather icon-help-circle"></i></span>
                        <span class="pcoded-mtext">Questionaires</span>
                    </a>
                    <ul class="pcoded-submenu">
                        <li class="">
                            <a href="{{ url('admin/courses') }}" class="waves-effect waves-dark">
                                <span class="pcoded-mtext">Courses</span>
                            </a>
                        </li>
                        <li class>
                            <a href="{{ url('admin/questions/create') }}" class="waves-effect waves-dark">
                                <span class="pcoded-mtext">Create Question</span>
                            </a>
                        </li>
                        <li class>
                            <a href="{{ url('admin/questions') }}" class="waves-effect waves-dark">
                                <span class="pcoded-mtext">Questions</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>