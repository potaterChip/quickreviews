<html>
<head>
	<title>Quick Reviews</title>
	<asset:stylesheet src="reviews.css"/>
	<g:javascript library="jquery" />
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
</body>
</html>