package com.potaterchip

class MovieReviewController {
    static scaffold = true
	
	def search() {}
	
	def search2() {}
	
	def review() {
		def tempName = params.movieName
		def movie = MovieReview.where {
			movieName =~ "${tempName}"
		}.get()
		
		
		if(movie != null) {
			render (contentType: 'text/json') {
				review = movie.quickReview
		   }
		}else {
			render (contentType: 'text/json') {
				review = "Try entering an actual movie."
			}
		}
		
	}
	
	/*def results(String movieName) {
		def movie = MovieReview.where {
			movieName =~ "%${movieName}%"
		}.get()
		return [
				movie: movie,
				term: params.movieName
			]
		
	}*/
	def results() {
		def movieName = params.term
		
		def movies = MovieReview.where {
			movieName =~ "%${movieName}%"
		}
		
		def movieNames = []
		
		for(movie in movies) {
			movieNames.add(movie.getMovieName())
		}
		
		render(contentType: 'text/json') {
			movieNames
		}
	}
}
