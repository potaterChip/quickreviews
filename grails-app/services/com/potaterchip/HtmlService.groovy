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
	
	def contactRTApi(String movieTitle) {
		def apiKey = grailsApplication.config['rottenTomatoesApi']
		executorService.submit( {
			http.get( path : 'movies.json', query : [apikey: apiKey, q: movieTitle, page_limit: 50] ) { resp, json ->
				for(movie in json.movies) {
					createNewMovie(movie)
				}
			}
		} as Callable)
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
				if(reviewScore > 90) {
					//movieReview.setQuickReview("Yeah, it's great.");
					movieReview.setQuickReview(ReviewLists.greatReviews.get(ReviewLists.getRandomNumber(ReviewLists.greatReviews.size())));
				}else if(reviewScore > 75) {
					//movieReview.setQuickReview("It's Ok, I guess");
				movieReview.setQuickReview(ReviewLists.okReviews.get(ReviewLists.getRandomNumber(ReviewLists.okReviews.size())));
				}else if(reviewScore > 0){
					//movieReview.setQuickReview("It Sucks");
				movieReview.setQuickReview(ReviewLists.badReviews.get(ReviewLists.getRandomNumber(ReviewLists.badReviews.size())));
				}else {
				movieReview.setQuickReview(ReviewLists.noReviews.get(ReviewLists.getRandomNumber(ReviewLists.noReviews.size())));
					//movieReview.setQuickReview("No one has even seen this crap");
				}
				if(movieReview.save(failOnError: true)) {
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
