package demo.app

class PublicController {

    def publicService

    def index() {
    }

    def register(){
        publicService.registerNewUser(params)
        render(true)
    }

    def checkUniqueEmail() {
        render(publicService.checkDuplicateEmail(params))
    }
}
