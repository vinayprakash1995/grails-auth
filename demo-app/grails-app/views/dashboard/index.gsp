<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 03/03/23
  Time: 11:56 AM
--%>

<%@ page import="com.yourapp.Role; com.yourapp.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery.validate.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'popper.min.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.css')}" type="text/css" />
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap.rtl.css')}" type="text/css" />
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-grid.css')}" type="text/css" />
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-grid.rtl.css')}" type="text/css" />
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-reboot.css')}" type="text/css" />
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-reboot.rtl.css')}" type="text/css" />
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-utilities.css')}" type="text/css" />
    <link rel="stylesheet" href="${resource(dir: 'bootstrap/css', file: 'bootstrap-utilities.rtl.css')}" type="text/css" />
    <script type="text/javascript" src="${resource(dir: 'bootstrap/js', file: 'bootstrap.bundle.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'bootstrap/js', file: 'bootstrap.esm.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'bootstrap/js', file: 'bootstrap.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'notify.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file:'toastr.min.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'toastr.css')}" type="text/css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
</head>

<script type="application/javascript">
    $( document ).ready(function() {


        $('#logout').click(function () {
            window.location = "${createLink(controller: "logout")}";
        })

        $('#home').click(function () {
            window.location = "${createLink(controller: "public", action: "index")}"

        })

        $('#user').click(function () {
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'dashboard', action: 'userList')}",
                data: {test : "test"},
                success: function(response)
                {
                    $('#page-wrapper').html(response)
                }
            });
        })
        $('#list').click(function () {
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'dashboard', action: 'userCards')}",
                data: {test : "test"},
                success: function(response)
                {
                    $('#page-wrapper').html(response)
                }
            });

        })


        $('#username').click(function () {
            var bsOffcanvas = new bootstrap.Offcanvas($('#offcanvasRight'))
            bsOffcanvas.show()

        })

        $('#close-canvas').click(function () {
            debugger
            var bsOffcanvas = new bootstrap.Offcanvas($('#offcanvasRight'))
            bsOffcanvas.hide()

        })

        $('#user').click()

        <g:if test="${userList}">
        $('#list').click()
        </g:if>



    });

</script>

<body class="bg-light">
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        <a class="navbar-brand" href="#" id="home">My App</a>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" id="user" href="#" aria-current="page" >User List</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="list" href="#">User Cards</a>
                            </li>
                        </ul>
                        <div>
                            <a class="nav-link  my-2 mx-2" href="#" id="username">Welcome ${user.firstname+" "+user.lastname } </a>
                        </div>
                        <div>
                            <button class="btn btn-outline-danger" id="logout" type="button">Logout</button>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            %{--container div--}%
            <div id="page-wrapper" >
            </div>
        </div>
    </div>

</div>


%{--off canvas--}%
<div class="offcanvas offcanvas-top h-auto" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header bg-primary">
        <h5 class="offcanvas-title" id="offcanvasRightLabel">${user.firstname+" "+user.lastname }</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>

            <div class="offcanvas-body bg-light">
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <div class="card text-center">
                            <div class="card-header">
                                ${user.username}
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${user.authorities.authority.toString()}</h5>
                                <p class="card-text">test</p>
                                <a href="#" id="close-canvas" class="btn btn-danger">Close</a>
                            </div>
                            <div class="card-footer text-muted">
                                2 days ago
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</div>

</body>
</html>