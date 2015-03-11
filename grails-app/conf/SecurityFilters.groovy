
class SecurityFilters {
	def filters = {
		doLogin(controller:'*', action: '*') {
			before = {
				if(!controllerName)
					return true;
				def allowedActions = ['search', 'search_m', 'results','review', 'login', 'validate', 'index']
				def holder = request.requestURI
				if(!session.loggedIn && !allowedActions.contains(actionName) && 
					!(request.requestURI.contains(".js") || request.requestURI.contains(".css"))) {
					redirect(controller:'movieReview', action:'login', params: ['cName': controllerName, 'aName': actionName])
					return false;
				}
			}
		}
	}
}

