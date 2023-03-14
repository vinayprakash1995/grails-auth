<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Please fill in the details:</h5>
            </div>
            <div class="modal-body">
                <form action='register' method='POST' id='registerForm' class='cssform' autocomplete='off'>

                    <div class="form-outline form-white mb-4">
                        <label class="form-label" for="firstname">First name</label>
                        <input type="text" id="firstname" class="form-control form-control-lg" name='firstname' required />
                    </div>

                    <div class="form-outline form-white mb-4">
                        <label class="form-label" for="lastname">Last Name</label>
                        <input type="text" id="lastname" class="form-control form-control-lg" name='lastname' required />
                    </div>

                    <div class="form-outline form-white mb-4">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" id="email" class="form-control form-control-lg" name='email' />
                    </div>

                    <div class="form-outline form-white mb-4">
                        <label class="form-label" for="password">Password</label>
                        <input type="password" id="password" class="form-control form-control-lg"  name='password' required />
                    </div>
                    <div class="text-center">
                    <button class="btn btn-outline-success btn-lg px-5" type="submit">Register</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>