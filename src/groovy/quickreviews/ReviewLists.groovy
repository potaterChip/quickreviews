package quickreviews

class ReviewLists {

	private static Random random = new Random()
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
}
