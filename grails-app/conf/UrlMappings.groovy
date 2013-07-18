class UrlMappings {

	static mappings = {

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		name admin: "/admin" {controller = 'admin'; action = 'scaffolding'}
		name search: "/api/activity/search" {controller = 'search'; action = 'activitySearch'}
		name activityMap: "/api/activity/map" {controller = 'activity'; action = 'activityMap'}
        name index: "/" {controller = 'index'; action = 'show'}
        name activityShow: "/activity/show" {controller = 'activity'; action = 'activityShow'}

		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")

		//"/"(view:"/index")
		"500"(view:'/error')
	}
}
