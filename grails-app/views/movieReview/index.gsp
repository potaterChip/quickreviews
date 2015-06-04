
<%@ page import="com.potaterchip.MovieReview" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movieReview.label', default: 'MovieReview')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-movieReview" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div>
		  	<g:form controller="movieReview" action="adminSearch">
    			<label>Search:</label>
   	 			<input id="query" type="text" name="query" />
    			<input type=submit value="Go" />
  			</g:form>
  		</div>
		<div id="list-movieReview" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="movieName" title="${message(code: 'movieReview.movieName.label', default: 'Movie Name')}" />
					
						<g:sortableColumn property="homeLink" title="${message(code: 'movieReview.homeLink.label', default: 'Home Link')}" />
					
						<g:sortableColumn property="numberOfSearches" title="${message(code: 'movieReview.numberOfSearches.label', default: 'Number Of Searches')}" />
					
						<g:sortableColumn property="quickReview" title="${message(code: 'movieReview.quickReview.label', default: 'Quick Review')}" />
					
						<g:sortableColumn property="reviewScore" title="${message(code: 'movieReview.reviewScore.label', default: 'Review Score')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${movieReviewInstanceList}" status="i" var="movieReviewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${movieReviewInstance.id}">${fieldValue(bean: movieReviewInstance, field: "movieName")}</g:link></td>
					
					
						<td>${fieldValue(bean: movieReviewInstance, field: "homeLink")}</td>
					
						<td>${fieldValue(bean: movieReviewInstance, field: "numberOfSearches")}</td>
					
						<td>${fieldValue(bean: movieReviewInstance, field: "quickReview")}</td>
					
						<td>${fieldValue(bean: movieReviewInstance, field: "reviewScore")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${movieReviewInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
