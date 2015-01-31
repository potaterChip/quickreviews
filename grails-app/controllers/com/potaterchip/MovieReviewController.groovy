package com.potaterchip

class MovieReviewController {
    static scaffold = true
	
	def search() {
		withMobileDevice { device ->
			redirect(action: "search_m");
		}
	}
	
	def search_m() {}
	
	def htmlService
	
	def review() {
		def tempName = params.movieName
		def movie = MovieReview.where {
			movieName =~ "${tempName}"
		}.get()
		
		if(movie == null) {			
			movie = htmlService.contactRTApiUnthreaded(tempName);
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
		}else if(movieTitle.size() > 3){
			htmlService.contactRTApi(movieTitle);
		}
		
		render(contentType: 'text/json') {
			movieNames
		}
	}
}
