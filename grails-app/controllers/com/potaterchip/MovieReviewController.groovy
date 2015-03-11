package com.potaterchip

class MovieReviewController {
    static scaffold = true
	def grailsApplication
	
	def search() {
		withMobileDevice { device ->
			redirect(action: "search_m");
		}
	}
	
	def search_m() {}
	
	def login()  {
		if(params.cName) 
			return [cName: params.cName, aName: params.aName]
	}
	
	def validate() {
		def usss = grailsApplication.config['adminUser']
		def passs = grailsApplication.config['adminPass']
		def pussss = params.username
		def ppasss = params.password
		if(params.username == grailsApplication.config['adminUser'] &&
			params.password == grailsApplication.config['adminPass']) {
			session.loggedIn = true;
			if(params.cName) {
				redirect controller: params.cName, action: params.aName
			}else {
				redirect controller: 'tekEvent', action: 'index'
			}
		}else {
			flash.message = "Invalid username and password."
			render view:'login'
		}
	}
	
	def htmlService
	
	def review() {
		def tempName = params.movieName
		def movie = MovieReview.where {
			movieName =~ "${tempName}"
		}.get()
		
		if(movie == null) {			
			movie = htmlService.contactRTApiUnthreaded(tempName);
			htmlService.contactRTApi(tempName, 1);
		}
		
		if(movie != null) {
			render (contentType: 'text/json') {
				review = movie
		   }
		}else {
			render (contentType: 'text/json') {
				review = { quickReview = "Try entering an actual movie." }
			}
		}
		
	}
	
	def results() {
		def movieTitle = params.term
		
		def movies = MovieReview.where {
			movieName =~ "%${movieTitle}%" && reviewScore > -1
		}
		
		def movieNames = []
		if(movies.size() > 0) {
			for(movie in movies) {
				movieNames.add(movie.getMovieName())
			}
		}else if(movieTitle.size() > 3 && MovieReview.count() < 1){
			htmlService.contactRTApi(movieTitle, 1);
		}
		
		render(contentType: 'text/json') {
			movieNames
		}
	}
}
