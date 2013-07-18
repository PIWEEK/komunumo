class UrlMappings {

	static mappings = {
		name admin: "/admin" {controller = 'admin'; action = 'scaffolding'}
		name search: "/api/activity/search" {controller = 'search'; action = 'activitySearch'}
		name activityMap: "/api/activity/map" {controller = 'activity'; action = 'activityMap'}
        name index: "/" {controller = 'index'; action = 'show'}
        name activityDetail: "/activity/detail" {controller = 'activity'; action = 'activityDetail'}
        name entityDetail: "/entity/detail" {controller = 'entity'; action = 'entityDetail'}

		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")

		//"/"(view:"/index")
		"500"(view:'/error')
        "/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
	}
}
