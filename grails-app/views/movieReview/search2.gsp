<html>
<head>
	<title>Quick Reviews</title>
	<asset:stylesheet src="reviews.css"/>
</head>
<body>
	<div id="fullscreenDiv">
		<span style="display: block;">
			<center>
		<div class="centerText">ENTER A MOVIE TITLE BELOW
			<div>
				<formset>
					<g:form action="results">
						<g:textField name="movieName" />
						<g:submitButton name="search" value="Search" />
					</g:form>
				</formset>
			</div>
		</div>
			</center>
		</span>
	</div>
</body>
</html>