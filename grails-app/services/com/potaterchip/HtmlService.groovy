package com.potaterchip

import grails.transaction.Transactional
import groovyx.net.http.HTTPBuilder

import java.util.concurrent.Callable

import quickreviews.ReviewLists;
import groovyx.net.http.ContentType

@Transactional
class HtmlService {

	
	def grailsApplication
	def executorService
	def movieReviewService
	def static HTTPBuilder http = new HTTPBuilder('http://api.rottentomatoes.com/api/public/v1.0/');
	
	
	def contactRTApiUnthreaded(String movieTitle) {
		def apiKey = grailsApplication.config['rottenTomatoesApi']
		http.get(path : 'movies.json', query : [apikey: apiKey, q: movieTitle, page_limit: 1]) { resp, json ->
			if(json.movies.size() > 1) {
				return;
			}else {
				def movieReview = createNewMovie(json.movies[0]);
				if(movieReview != null) {
					return movieReview;
				}
			}
		}
	}
	
	def loadMovieData() {
		
		contactRTApi("a", 1);
	}
	
	def contactRTApi(String movieTitle, pageNumber) {
		def apiKey = grailsApplication.config['rottenTomatoesApi']
		def callAgain = true;
		def number = 1;
		while(callAgain) {
			callAgain = movieReviewService.callAndSaveApi(apiKey, movieTitle, number);
			number = number + 1;
			sleep 1000
		}
	}

	private createNewMovie(movie) {
		if(movie != null) {
			def existingMovie = MovieReview.where {
				movieName =~ "${movie.title}"
			}.get()
			if(existingMovie == null) {
				def movieReview = new MovieReview()
				movieReview.setMovieName(movie.title);
				movieReview.setHomeLink(movie.links.alternate)
				def reviewScore = movie.ratings.critics_score;
				movieReview.setReviewScore(reviewScore);
				try {
				if(reviewScore > 90) {
					//movieReview.setQuickReview("Yeah, it's great.");
					movieReview.setQuickReview(ReviewLists.greatReviews.get(ReviewLists.getRandomNumber(ReviewLists.greatReviews.size()) - 1));
				}else if(reviewScore > 75) {
					//movieReview.setQuickReview("It's Ok, I guess");
					movieReview.setQuickReview(ReviewLists.okReviews.get(ReviewLists.getRandomNumber(ReviewLists.okReviews.size()) - 1));
				}else if(reviewScore > 0){
					//movieReview.setQuickReview("It Sucks");
					movieReview.setQuickReview(ReviewLists.badReviews.get(ReviewLists.getRandomNumber(ReviewLists.badReviews.size()) - 1));
				}else {
					movieReview.setQuickReview(ReviewLists.noReviews.get(ReviewLists.getRandomNumber(ReviewLists.noReviews.size()) -1));
					//movieReview.setQuickReview("No one has even seen this crap");
				}
				}catch(e) {
					e.printStackTrace();
					movieReview.setQuickReview("something errored");
				}
				if(movieReview.save(failOnError: true)) {
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
