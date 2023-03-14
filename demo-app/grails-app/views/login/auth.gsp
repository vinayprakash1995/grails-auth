<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
	<g:javascript library='jquery' />
	<r:layoutResources/>
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

	<style type='text/css' media='screen'>
	.gradient-custom {
		/* fallback for old browsers */
		background: #e8a20b;

		/* Chrome 10-25, Safari 5.1-6 */
		background: -webkit-linear-gradient(to right, rgb(204, 104, 21), rgb(232, 162, 11));

		/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		background: linear-gradient(to right, rgb(204, 104, 21), rgb(232, 162, 11))
	}
	</style>
</head>

<script type="application/javascript">
	$(document).ready(function () {
		<g:if test="${newUser == "true"}">
		toastr.info('User Registered Successfully!')
		</g:if>

		$('#home').click(function () {
			window.location = "${createLink(controller: "public", action: "index")}"

		})

	})
</script>

<body>
<div class="container-fluid">

<section class="vh-100 gradient-custom">
	<div class="container py-5 h-100">
		<div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card bg-dark text-white" style="border-radius: 1rem;">
					<div class="card-body p-5 text-center">

						<div class="mb-md-5 mt-md-4 pb-5">

							<h2 class="fw-bold mb-2 text-uppercase">Login</h2>
							<p class="text-white-50 mb-5">Please enter your login and password!</p>

							<g:if test='${flash.message}'>
								<div class='login_message text-danger'>${flash.message}</div>
							</g:if>

							<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
							<div class="form-outline form-white mb-4">
								<input type="email" id="typeEmailX" class="form-control form-control-lg" name='j_username' />
								<label class="form-label" for="typeEmailX">Email</label>
							</div>

							<div class="form-outline form-white mb-4">
								<input type="password" id="typePasswordX" class="form-control form-control-lg"  name='j_password' />
								<label class="form-label" for="typePasswordX">Password</label>
							</div>
							<button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>

							</form>

							<button class="btn btn-outline-secondary btn-lg px-5" id="home" type="button">Home</button>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>

</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
