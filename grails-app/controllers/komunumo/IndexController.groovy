package komunumo

import net.kaleidos.komunumo.ActivityType;
import net.kaleidos.komunumo.Neighbourhood;
import grails.plugins.springsecurity.Secured

class IndexController {

    def show() {
		 render view:'/index', model:[dataView: 'HomeView', neigbourhoodList: Neighbourhood.list(), activityTypeList: ActivityType.list()]
	}
}
