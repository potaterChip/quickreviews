package com.potaterchip

class MovieReviewController {
    static scaffold = true
	
	def search() {}
	
	def search2() {}
	
	def review() {
		render (contentType: 'text/json') {
			 review = "IT SUCKS"
		}
	}
	
	def results(String movieName) {
		def movie = MovieReview.where {
			movieName =~ "%${movieName}%"
		}.get()
		return [
				movie: movie,
				term: params.movieName
			]
		
	}
}
