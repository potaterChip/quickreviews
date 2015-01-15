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
				$("#theInfo").hide();
				$.ajax({
					url: "review",
					data: { movieName : $("#movieName").val()},
					success: function(results) {
						$("#theReview").text(results.review.quickReview);
						$("#theReview").fadeIn("slow", function() {
								if(results.review.homeLink) {
									$("#outsideMovieLink").attr("href", results.review.homeLink);
									$("#theInfo").show();
								}
							});
					},
					error: function(results) {
						alert("didn't work");
					}
				});
				
				return false;
			});

		$("#movieName").autocomplete({
				source: "results",
				minLength : 2,

				html : true
			});

		});
	</script>
</head>
<body>
 
	 					
	<div id="fullscreenDiv">
		<span style="display: block;">
			<center>
		<div class="centerText">ENTER A MOVIE
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
		<div id="movieInfoDiv">
			<span id="theInfo" style="display: none;">Don't believe it? Click <a id="outsideMovieLink" href="#" target="_blank">here</a></span>
		</div>
			</center>
		</span>
	</div>
</div>
 
</body>
</html>