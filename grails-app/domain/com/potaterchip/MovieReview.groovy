package com.potaterchip

class MovieReview {

	String movieName
	String quickReview
	int reviewScore
	String homeLink
	int numberOfSearches
	String onDemandLink
	
    static constraints = {
		homeLink nullable: true
		onDemandLink nullable: true
    }
	
}
