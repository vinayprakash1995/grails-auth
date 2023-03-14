<html>
<body>

<div class="row">
    <div class="col-md-12">
        <h1 class="text-capitalize text-md-center text-success">User Cards</h1>
        <div class="row justify-content-start">
            <g:each in="${com.yourapp.User.findAll()}" var="user" status="i">
            <div class="offset-md-1 col-md-4  mb-5 ">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title text-center">${user.firstname}</h5>
                        <p class="card-text text-center">${user.username}</p>
                        <g:if test="${user.isEnabled()}">
                            <div class="text-center">
                                <button  class="btn btn-danger user-disable-button" name="${user.getId()}">Disable User</button>
                            </div>
                        </g:if>
                        <g:else>
                            <div class="text-center">
                                <button  class="btn btn-primary user-enable-button" name="${user.getId()}">Enable User</button>
                            </div>
                        </g:else>
                    </div>
                </div>
            </div>
            </g:each>
        </div>
    </div>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="user-edit-model">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Are you Sure?</h5>
            </div>
            <div class="modal-body">
                <p id="user-edit-model-text"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary " id="user-edit-model-btn" data-dismiss="modal">Yes</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>

            </div>
        </div>
    </div>
</div>
<script type="application/javascript">
    $('.user-disable-button').click(function () {
        var id = $(this).attr('name');
        $('#user-edit-model-text').text("user will be disabled.")
        $('#user-edit-model-btn').attr('name',id)
        $('#user-edit-model-btn').attr('edit-type','disable')
        $('#user-edit-model').modal('show')
    })

    $('#user-edit-model-btn').click(function () {
        var id = $(this).attr('name')
        var editType = $(this).attr('edit-type')

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'dashboard', action: 'updateUser')}",
            data: {id : id, editType : editType},
            success: function(response)
            {
                if(editType == 'disable'){
                    toastr.success("User disabled successfully")
                }else {
                    toastr.success("User enabled successfully")
                }
                window.location = "${createLink(controller: 'dashboard',action: 'index')}"+"?userlist=true"
            },

        });

    })

    $('.user-enable-button').click(function () {
        debugger
        var id = $(this).attr('name');
        $('#user-edit-model-text').text("user will be enabled.")
        $('#user-edit-model-btn').attr('name',id)
        $('#user-edit-model-btn').attr('edit-type','enable')
        $('#user-edit-model').modal('show')
    })
</script>

</body>
</html>

