<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 03/03/23
  Time: 1:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Demo App</title>
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

%{--<style type="text/css" media="screen">
#intro {
    background-image: url("https://mdbootstrap.com/img/new/fluid/city/018.jpg");
    height: 100vh;
}
</style>--}%

<style>
@media (max-width: 991px) {
    .navbar-scroll {
        background-color: #fff;
    }

    .navbar-scroll .navbar-brand,
    .navbar-scroll .nav-link,
    .navbar-scroll .fa-bars {
        color: #4f4f4f !important;
    }
}

.navbar-brand {
    letter-spacing: 3px;
    font-size: 2rem;
    font-weight: 500;
}
.navbar-scroll .navbar-brand,
.navbar-scroll .nav-link,
.navbar-scroll .fa-bars {
    color: #fff;
}

.navbar-scroll {
    box-shadow: none;
}

.navbar-scrolled {
    box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.05);
}

.navbar-scrolled .navbar-brand,
.navbar-scrolled .nav-link,
.navbar-scrolled .fa-bars {
    color: #4f4f4f;
}

.navbar-scrolled {
    background-color: #fff;
}

@media (max-width: 450px) {
    #intro {
        height: 950px !important;
    }
}

@media (min-width: 550px) and (max-width: 750px) {
    #intro {
        height: 1100px !important;
    }
}

@media (min-width: 800px) and (max-width: 990px) {
    #intro {
        height: 600px !important;
    }
}

.display-1 {
    font-weight: 500 !important;
    letter-spacing: 40px;
}

@media (min-width: 1600px) {
    .display-1 {
        font-size: 10rem;
    }
}
</style>

<script type="application/javascript">
    $(document).ready(function () {
        $('#login').click(function () {
            window.location = "${createLink(controller: "login", action: "auth")}"

        })

        $('#home').click(function () {
            window.location = "${createLink(controller: "public", action: "index")}"
        })

        $('#register').click(function () {
            $("#exampleModal").modal('show');

        })


        $("#registerForm").validate({
            ignore:'',
            rules: {
                email:{
                    remote: {
                        url : "${createLink(controller: "public",action: "checkUniqueEmail")}",
                        type : "POST",
                        dataType : "json",
                        async: false,
                        data : {
                            email: function() {
                                return $("#email").val();
                            }
                        }
                    }
                }
            },
            messages: {
                email: {remote: jQuery.validator.format("{0} is already taken, try something else instead.")}
            }
        });

        $("#registerForm").submit(function(e) {

            e.preventDefault(); // avoid to execute the actual submit of the form.

            if($(this).valid()){
                $('#register').prop('disabled', true)
            var form = $(this);
            var actionUrl = "${createLink(controller: "public", action: "register")}"

            $.ajax({
                type: "POST",
                url: actionUrl,
                data: form.serialize(), // serializes the form's elements.
                success: function(data)
                {
                    window.location = "${createLink(controller: "login", action: "auth")}"+"?success=true";
                }
            });


            }

        });

    })
</script>

<body>
<div class="container-fluid">
    %{--<div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <a class="navbar-brand" href="#">Grails Project</a>
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="#" id="home">Home <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <div class="row">
                    <div class="  my-2 my-lg-0 col-6">
                        <button id="login" class="btn btn-outline-success" >Login</button>
                    </div>
                    <div class=" my-2 my-lg-0 col-6 ">
                        <button id="register" class="btn btn-outline-primary text-center" data-toggle="modal" data-target="#exampleModal" >Register</button>
                    </div>
                    </div>


                </div>
            </nav>

        </div>

    </div>--}%

    <div>
        <header>
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg fixed-top navbar-scroll">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#!">CraftY</a>
                    <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                            data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto">
                            %{--<li class="nav-item">
                                <a class="nav-link active" aria-current="page" id="home" href="#!">Home</a>
                            </li>--}%
                            <li class="nav-item">
                                <a class="nav-link" id="login" href="#!">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="register" href="#!" data-toggle="modal" data-target="#exampleModal">Register</a>
                            </li>
                           %{-- <li class="nav-item">
                                <a class="nav-link" href="#!">Attractions</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#!">Opinions</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#!">Contact</a>
                            </li>--}%
                        </ul>
                        <ul class="navbar-nav d-flex flex-row">
                            <li class="nav-item me-3 me-lg-0">
                                <a class="nav-link" href="#!">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                            </li>
                            <li class="nav-item me-3 me-lg-0">
                                <a class="nav-link" href="#!">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>
                            <li class="nav-item me-3 me-lg-0">
                                <a class="nav-link" href="#!">
                                    <i class="fab fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Navbar -->

            <!--Section: Design Block-->
            <section>
                <div id="intro" class="bg-image" style="
                background-image: url('https://mdbootstrap.com/img/Photos/new-templates/craftsman/img(1).jpg');
                height: 100vh;
                ">
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.2);">
                        <div class="container d-flex justify-content-center align-items-center h-100">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <h1 class="mb-0 text-white display-1">Studio</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--Section: Design Block-->
        </header>

        <main>
            <div class="container my-5 py-5"></div>
        </main>
    </div>

    %{--<div id="intro" class="bg-image shadow-2-strong">
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.8);">
            <div class="container d-flex align-items-center justify-content-center text-center h-100">

            </div>
        </div>
    </div>--}%
</div>

<!-- Modal -->
<g:render template="/public/registermodel"/>

</body>
</html>