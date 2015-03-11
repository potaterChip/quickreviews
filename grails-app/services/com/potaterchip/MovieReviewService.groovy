package com.potaterchip

import quickreviews.ReviewLists;
import grails.transaction.Transactional
import groovyx.net.http.HTTPBuilder;

@Transactional
class MovieReviewService {

	def static HTTPBuilder http = new HTTPBuilder('http://api.rottentomatoes.com/api/public/v1.0/');
	
	def callApiForOneMovie(apiKey, movieTitle) {
		def json = http.get( path : 'movies.json', query : [apikey: apiKey, q: movieTitle, page_limit: 1] ) { resp, json ->
			json
		}
		if(json && json.movies) {
			return createNewMovie(json.movies[0]);
		}
		
		return null;
	}
	
	def callAndSaveApi(apiKey, movieTitle, pageNumber) {
		def moviesLeft = false;
		def json = http.get( path : 'movies.json', query : [apikey: apiKey, q: movieTitle, page_limit: 50, page: pageNumber] ) { resp, json ->
			json
		}
		if(json) {
			for(movie in json.movies) {
				createNewMovie(movie)
			}
			
			if(json.links && json.links.next && json.links.next.size() > 0) {
				moviesLeft = true;
			}else {
				def somethingToBreakOn = "this";
			}
		}
		return moviesLeft;
	}
	
	private createNewMovie(movie) {
		if(movie != null) {
			def existingMovie = MovieReview.where {
				movieName =~ "${movie.title}"
			}.get()
			if(existingMovie == null) {
				def movieReview = new MovieReview()
				def movieSaved = false;
				MovieReview.withTransaction {
				movieReview.setMovieName(movie.title);
				movieReview.setHomeLink(movie.links.alternate)
				def reviewScore = movie.ratings.critics_score;
				movieReview.setReviewScore(reviewScore);
				try {
				if(reviewScore > 90) {
					movieReview.setQuickReview(ReviewLists.getRandomGreatString())
				}else if(reviewScore > 75) {
					movieReview.setQuickReview(ReviewLists.getRandomOkString());
				}else if(reviewScore > 0){
					movieReview.setQuickReview(ReviewLists.getRandomBadString());
				}else {
					movieReview.setQuickReview(ReviewLists.getRandomNoString());
				}
				}catch(e) {
					e.printStackTrace();
					movieReview.setQuickReview("something errored");
				}
					movieSaved = movieReview.save(failOnError: true);
				}
				if(movieSaved) {
					print "movie saved"
					return movieReview;
				}else {
					return null;
				}
			}else {
				return existingMovie;
			}
		}
	}
}
