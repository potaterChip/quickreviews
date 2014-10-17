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
	}
}
