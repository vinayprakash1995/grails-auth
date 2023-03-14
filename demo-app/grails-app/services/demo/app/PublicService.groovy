package demo.app

import com.yourapp.Role
import com.yourapp.User
import com.yourapp.UserRole
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class PublicService {

    def springSecurityService


    def checkDuplicateEmail(GrailsParameterMap params){
        String email = params?.email
        User user = User.findByUsername(email)
        if(user){
            return false
        }
        return true
    }

    def registerNewUser(GrailsParameterMap params){
        User user = new User()
        user.firstname = params?.firstname
        user.lastname = params?.lastname
        user.username = params?.email
        user.accountExpired = false
        user.accountLocked = false
        user.passwordExpired = false
        user.enabled = true
        user.password = params?.password
        user.save(flush: true)
        Role role = Role.findByAuthority("CLIENT")
        UserRole userRole = new UserRole()
        userRole.user = user
        userRole.role = role
        userRole.save(flush: true)

    }
}
