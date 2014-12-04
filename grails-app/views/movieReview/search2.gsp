<html>
<head>
	<title>Quick Reviews</title>
	<asset:stylesheet src="reviews.css"/>
	<asset:stylesheet src="autocomplete.css" />
	<asset:stylesheet src="jquery-ui.css" />
	<g:javascript library="jquery" />
	
	<g:javascript library="jquery-ui"></g:javascript>
	<!--  <r:require module="jquery-ui" /> -->
	<!-- <asset:javascript src="autocomplete.js" /> -->
	 <r:layoutResources/> 
	<script type="text/javascript">
		$(document).ready(function() {
			$("#search").click(function() {
				$("#theReview").hide();
				$.ajax({
					url: "review",
					data: { movieName : $("#movieName").val()},
					success: function(results) {
						$("#theReview").text(results.review);
						$("#theReview").fadeIn(1500);
					},
					error: function(results) {
						alert("didn't work");
					}
				});
				
				return false;
			});

			var availableTags = [
			                     "ActionScript",
			                     "AppleScript",
			                     "Asp",
			                     "BASIC",
			                     "C",
			                     "C++",
			                     "Clojure",
			                     "COBOL",
			                     "ColdFusion",
			                     "Erlang",
			                     "Fortran",
			                     "Groovy",
			                     "Haskell",
			                     "Java",
			                     "JavaScript",
			                     "Lisp",
			                     "Perl",
			                     "PHP",
			                     "Python",
			                     "Ruby",
			                     "Scala",
			                     "Scheme"
			                   ];

		$("#movieName").autocomplete({
				//source : availableTags,
				//source: "http://localhost:8080/category/fakeTestJson"
				source: "results",
				minLength : 2,

				html : true, // optional (jquery.ui.autocomplete.html.js required)

				// optional (if other layers overlap autocomplete list)
				/*open : function(event, ui) {
					$(".ui-autocomplete").css("z-index", 1000);
				}*/
			});

		});
	</script>
</head>
<body>
 
	 					
	<div id="fullscreenDiv">
		<span style="display: block;">
			<center>
		<div class="centerText">ENTER A MOVIE TITLE BELOW
			<div>
				<formset>
					<g:form name="woo" action="results">
						<g:textField name="movieName" autocomplete="off" />
						<g:submitButton name="search" value="Search" />	
					</g:form>
				</formset>
			</div>
		</div>
		<div id="reviewDiv">
			<span id="theReview" style="display: none;"></span>
		</div>
			</center>
		</span>
	</div>
	<!-- <div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags"> -->
</div>
 
</body>
</html>