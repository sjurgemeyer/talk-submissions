package cacoethes

import grails.plugins.springsecurity.Secured

@Secured("ROLE_ADMIN")
class MailTemplateController {
    static scaffold = true
}
