class UrlMappings {

	static mappings = {
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		name admin: "/admin" {controller = 'admin'; action = 'scaffolding'}
		name search: "/api/activity/search" {controller = 'search'; action = 'activitySearch'}
        name index: "/" {controller = 'index'; action = 'show'}
		
		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")

		//"/"(view:"/index")
		"500"(view:'/error')
	}
}
