<html>
<head>
	<title>Quick Reviews</title>
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
	<asset:stylesheet src="jquery-ui.css" />
	<asset:stylesheet src="reviews.css"/>
	<g:javascript library="jquery" />
	
	<g:javascript library="jquery-ui"></g:javascript>
	<!--  <r:require module="jquery-ui" /> -->
	<!-- <asset:javascript src="autocomplete.js" /> -->
	 <r:layoutResources/> 
	<script type="text/javascript">
		$(document).ready(function() {
			var submitFunction = function(term) {
				$("#theReview").hide();
				$("#theInfo").hide();
				$("#onDemand").hide();
				$("#theReview").stop(true, true);
				var title = term ? term : $("#movieName").val();
				$.ajax({
					url: "movieReview/review",
					data: { movieName : title},
					success: function(results) {
						$("#theReview").text(results.review.quickReview);
						$("#theReview").fadeIn(2000, function() {
								if(results.review.homeLink && $("#theReview").is(':visible')) {
									$("#outsideMovieLink").attr("href", results.review.homeLink);
									$("#theInfo").show();
								}
								if(results.review.onDemandLink && $("#theReview").is(':visible')) {
									$("#onDemandLink").attr("href", results.review.onDemandLink);
									$("#onDemand").show();
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

			$("#movieName").click(function() {
				if($("#theReview").text() !== "") {
					this.value = '';
				}
			});

			$("#movieName").autocomplete({
				source: "movieReview/results",
				minLength : 2,
				select: function(event, ui) {submitFunction(ui.item.value);},
				html : true,
				appendTo: "#searchWrapDiv"
			}).keyup(function(e) {
				if(e.which === 13) {
					$(".ui-menu").hide();
				}
			});

			$("#aboutLink").click(function() {
				$("#dialog").dialog();
				$('.ui-dialog :button').blur();
			});

		});
	</script>
</head>
<body>
	 					
	<div id="fullscreenDiv">
		<span class="mainFont" style="display: block;">
			<center>
		<div class="centerText">ENTER A MOVIE
			<div>
				<formset>
					<g:form name="woo" action="results">
							<div id="searchWrapDiv" class="searchWrap">
								<input id="movieName" class="searchBox" type="text"> <input id="search" class="searchSubmit" type="submit" value>
							</div>
							<!-- <g:textField name="movieName" autocomplete="off" />
						<g:submitButton name="search" value="Search" /> -->
					</g:form>
				</formset>
			</div>
		</div>
		
		<div id="reviewDiv">
			<span id="theReview" style="display: none;"></span>
		</div>
		<div id="movieInfoDiv">
			<span id="theInfo" style="display: none;">Don't believe it? Click <a id="outsideMovieLink" class="link" href="#" target="_blank">here</a></span>
		</div>
		<div id="movieOnDemand">
			<span id="onDemand" style="display: none;">Wanna watch it? Click <a id="onDemandLink" class="link" href="#" target="_blank">here</a></span>
		</div>
			</center>
		</span>
		<div class="footer mainFont">
<%--			<div>--%>
<%--				<p>HEY YOU GUYS</p>--%>
<%--			</div>--%>
			<div id="aboutLink" class="mainFont">ABOUT | CONTACT
			</div>
		</div>
	</div>

 
 <div id="dialog" title="True Critic">
 	<p>Get the REAL movie reviews here</p>
 </div>
</body>
</html>