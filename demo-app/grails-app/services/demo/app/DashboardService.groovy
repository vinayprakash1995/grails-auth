package demo.app

import com.yourapp.User
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class DashboardService {

    def updateUser(GrailsParameterMap params){
        String id = params?.id
        String editType = params?.editType
        User user = User.findById(id)
        if(editType == "disable"){
            user.enabled = false
        }else {
            user.enabled = true
        }
        user.save(flush: true)
        return [status: true ,message:'success']
    }

}
