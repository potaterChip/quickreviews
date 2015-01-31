<html>
<head>
	<title>Quick Reviews</title>
	<asset:stylesheet src="jquery-ui-m.css" />
	<asset:stylesheet src="reviews_m.css"/>
	<g:javascript library="jquery" />
	
	<g:javascript library="jquery-ui"></g:javascript>
	<!--  <r:require module="jquery-ui" /> -->
	<!-- <asset:javascript src="autocomplete.js" /> -->
	 <r:layoutResources/> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<script type="text/javascript">
		$(document).ready(function() {
			var submitFunction = function(term) {
				$("#theReview").hide();
				$("#theInfo").hide();
				var title = term ? term : $("#movieName").val();
				$.ajax({
					url: "review",
					data: { movieName : title},
					success: function(results) {
						$("#movieName").blur();
						$("#theReview").text(results.review.quickReview);
						$("#theReview").fadeIn(2000, function() {
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
			};
			
			$("#search").click(function() {
					submitFunction(null);
					return false;
			});

		$("#movieName").autocomplete({
				source: "results",
				minLength : 2,
				select: function(event, ui) {submitFunction(ui.item.value);},
				html : true,
				appendTo: "#searchWrapDiv"
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
							<div align="left" id="searchWrapDiv" class="searchWrap">
								<input id="movieName" class="searchBox" type="text"> <input id="search" class="searchSubmit" type="submit" value>
							</div>
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
 
</body>
</html>