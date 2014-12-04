import com.potaterchip.MovieReview;

class BootStrap {

    def init = { servletContext ->
		environments {
			development {
				if (!MovieReview.count()) createSampleData()
			}
			test {
				if (!MovieReview.count()) createSampleData()
			}
		}
    }
    def destroy = {
    }
	
	private createSampleData() {
		println "Creating sample data"
		
		def movieReview = new MovieReview(
			movieName: "The Dark Knight",
			quickReview: "Best. Movie. Ever.",
			director: "Christopher Nolan",
			reviewScore: 94
		).save(failOnError: true)
		def movieReview2 = new MovieReview(
			movieName: "The Dark Knight Rises",
			quickReview: "Ruined the trilogy",
			director: "Christopher Nolan",
			reviewScore: 94
		).save(failOnError: true)
		def movieReview3 = new MovieReview(
			movieName: "Darkman",
			quickReview: "Watch it, right now!",
			director: "Christopher Nolan",
			reviewScore: 94
		).save(failOnError: true)
		def movieReview4 = new MovieReview(
			movieName: "The Dark Knight",
			quickReview: "Best. Movie. Ever.",
			director: "Christopher Nolan",
			reviewScore: 94
		).save(failOnError: true)
		def movieReview5 = new MovieReview(
			movieName: "Donnie Darko",
			quickReview: "Hipster Garbage",
			director: "Christopher Nolan",
			reviewScore: 94
		).save(failOnError: true)
		def movieReview6 = new MovieReview(
			movieName: "Save the Last Dance",
			quickReview: "How about...no",
			director: "Christopher Nolan",
			reviewScore: 94
		).save(failOnError: true)
	}
}
