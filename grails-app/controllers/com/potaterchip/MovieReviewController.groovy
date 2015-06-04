package com.potaterchip

class MovieReviewController {
    static scaffold = true
    		
	def htmlService
	def movieReviewService
	def grailsApplication
	
	def search() {
		withMobileDevice { device ->
			redirect(action: "search_m");
		}
	}
	
	def search_m() {}
	
	def adminSearch() {
		if(params.query){
			   def query = params.query
			   def movieReviewCriteria = MovieReview.createCriteria()
			   def events = movieReviewCriteria.list {
				   like ("movieName", "%${query}%")
				   maxResults(5)
				   order("numberOfSearches", "desc")
				   order("reviewScore", "desc")
			   }
			   [events : events]	
		}
	}
	
	def login()  {
		if(params.cName) 
			return [cName: params.cName, aName: params.aName]
	}
	
	def validate() {
		if(params.username == grailsApplication.config['adminUser'] &&
			params.password == grailsApplication.config['adminPass']) {
			session.loggedIn = true;
			if(params.cName) {
				redirect controller: params.cName, action: params.aName
			}else {
				redirect controller: 'movieReview', action: 'index'
			}
		}else {
			flash.message = "Invalid username and password."
			render view:'login'
		}
	}
	
	def review() {
		def tempName = params.movieName
		log.info("User searched for " + tempName);
		def movie = MovieReview.where {
			movieName =~ "${tempName}"
		}.get()
		
		if(movie == null) {
			movie = htmlService.contactRTApiUnthreaded(tempName); 
			htmlService.contactRTApi(tempName, 1);
		}
		
		if(movie == null) {			
			render (contentType: 'text/json') {
				review = { quickReview = "Try entering an actual movie." }
			}
		}else {
			movieReviewService.incrementNumberOfSearchesForMovieReview(movie)
			render (contentType: 'text/json') {
				review = movie
			}		
		}
	}
	
	def results() {
		def movieTitle = params.term
		
		def movieReviewCriteria = MovieReview.createCriteria()
		def movies = movieReviewCriteria.list {
			like ("movieName", "%${movieTitle}%")
			maxResults(5)
			order("numberOfSearches", "desc")
			order("reviewScore", "desc")
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
