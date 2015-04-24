package com.potaterchip

class MovieReview {

	String movieName
	String quickReview
	int reviewScore
	String homeLink
	int numberOfSearches
	
    static constraints = {
		homeLink nullable: true
    }
	
}
