<html>
<body>

<div class="row justify-content-center">

    <div class="offset-md-1 col-md-10">
        <h1 class="text-capitalize text-md-center text-success">User List</h1>
        <div class="table-responsive-md overflow-auto h-50">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th scope="col" class="text-center">ID</th>
                <th scope="col" class="text-center">First Name</th>
                <th scope="col" class="text-center">Last Name</th>
                <th scope="col" class="text-center">Email</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${com.yourapp.User.findAll()}" var="user" status="i">
                <tr>
                    <th scope="row" class="text-center">${user.getId()}</th>
                    <td class="text-center">${user.firstname}</td>
                    <td class="text-center">${user.lastname}</td>
                    <td class="text-center">${user.username}</td>
                </tr>

            </g:each>
            </tbody>
        </table>
        </div>
    </div>

</div>




</body>
</html>

