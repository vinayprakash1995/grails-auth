package demo.app

import com.yourapp.User
import grails.converters.JSON

class DashboardController {

    def springSecurityService
    def dashboardService

    def index() {
        User loggedInUser = springSecurityService.getCurrentUser()
        def userRoles = loggedInUser.authorities
        List<String> roles =  userRoles.collect {com.yourapp.Role it-> it.authority}
        def isAdmin = roles.contains("ADMIN") ? true : false
        def userList = false
        if(params?.userlist == "true"){
            userList = true
        }

        render(view: "index",model: [user : loggedInUser, isAdmin : isAdmin,userList:userList])


    }

    def userList(){
        render(view: "userlist" )
    }

    def userCards(){
        render(view: "usercard" )
    }

    def updateUser(){
        render dashboardService.updateUser(params) as JSON
    }
}
