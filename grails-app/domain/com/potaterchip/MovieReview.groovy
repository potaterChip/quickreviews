package com.potaterchip

class MovieReview {

	String movieName
	String quickReview
	int reviewScore
	String homeLink
	
    static constraints = {
		homeLink nullable: true
    }
}
