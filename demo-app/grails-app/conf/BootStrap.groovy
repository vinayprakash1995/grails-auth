import com.yourapp.Role
import com.yourapp.User
import com.yourapp.UserRole

class BootStrap {

    def init = { servletContext ->



        if(Role.findAll().isEmpty()){
            Role role1 = new Role()
            role1.authority = "CLIENT"
            role1.save(flush: true)
            Role role = new Role()
            role.authority = "ADMIN"
            role.save(flush: true)
            User user = new User()
            user.username = "test@test.com"
            user.password = "test"
            user.enabled = true
            user.save(flush: true)
            UserRole userRole = new UserRole()
            userRole.user = user
            userRole.role = role
            userRole.save(flush: true)
        }
    }
    def destroy = {
    }
}
