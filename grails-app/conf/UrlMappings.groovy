class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		/* "/"(view:"/index") */
          "/"(controller: 'MovieReview', action: 'search')
        "500"(view:'/error')
	}
}
