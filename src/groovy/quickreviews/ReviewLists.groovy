package quickreviews

class ReviewLists {

	private static Random random = new Random()
	private static Random randomGreatNumber = new Random()
	private static Random randomOkNumber = new Random()
	private static Random randomBadNumber = new Random()
	private static Random randomNoNumber = new Random()
	
	public static greatReviews = ['Best. Movie. Ever.', 
		'See this shit now!'];
	public static okReviews = ["It's ok, I guess.",
		 "Meh."];
	public static badReviews = ["It sucks.", "How about...no",
		 "What were they thinking when they made this?"];
	public static noReviews = ["No one has even seen this crap",
		 "No one cares."];
	
	def static getRandomNumber(integer) {
		return random.next(integer);
	}
	
	def static String getRandomGreatString() {
		return greatReviews[randomGreatNumber.nextInt(greatReviews.size())]
	}
	
	def static String getRandomOkString() {
		return okReviews[randomOkNumber.nextInt(okReviews.size())]
	}
	
	def static String getRandomBadString() {
		return badReviews[randomBadNumber.nextInt(badReviews.size())]
	}
	
	def static String getRandomNoString() {
		return noReviews[randomNoNumber.nextInt(noReviews.size())]
	}
}
