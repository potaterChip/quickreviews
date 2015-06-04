
<%@ page import="com.potaterchip.MovieReview" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movieReview.label', default: 'MovieReview')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-movieReview" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-movieReview" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movieReview">
			
				<g:if test="${movieReviewInstance?.homeLink}">
				<li class="fieldcontain">
					<span id="homeLink-label" class="property-label"><g:message code="movieReview.homeLink.label" default="Home Link" /></span>
					
						<span class="property-value" aria-labelledby="homeLink-label"><g:fieldValue bean="${movieReviewInstance}" field="homeLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieReviewInstance?.onDemandLink}">
				<li class="fieldcontain">
					<span id="onDemandLink-label" class="property-label"><g:message code="movieReview.onDemandLink.label" default="On Demand Link" /></span>
					
						<span class="property-value" aria-labelledby="onDemandLink-label"><g:fieldValue bean="${movieReviewInstance}" field="onDemandLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieReviewInstance?.movieName}">
				<li class="fieldcontain">
					<span id="movieName-label" class="property-label"><g:message code="movieReview.movieName.label" default="Movie Name" /></span>
					
						<span class="property-value" aria-labelledby="movieName-label"><g:fieldValue bean="${movieReviewInstance}" field="movieName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieReviewInstance?.numberOfSearches}">
				<li class="fieldcontain">
					<span id="numberOfSearches-label" class="property-label"><g:message code="movieReview.numberOfSearches.label" default="Number Of Searches" /></span>
					
						<span class="property-value" aria-labelledby="numberOfSearches-label"><g:fieldValue bean="${movieReviewInstance}" field="numberOfSearches"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieReviewInstance?.quickReview}">
				<li class="fieldcontain">
					<span id="quickReview-label" class="property-label"><g:message code="movieReview.quickReview.label" default="Quick Review" /></span>
					
						<span class="property-value" aria-labelledby="quickReview-label"><g:fieldValue bean="${movieReviewInstance}" field="quickReview"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieReviewInstance?.reviewScore}">
				<li class="fieldcontain">
					<span id="reviewScore-label" class="property-label"><g:message code="movieReview.reviewScore.label" default="Review Score" /></span>
					
						<span class="property-value" aria-labelledby="reviewScore-label"><g:fieldValue bean="${movieReviewInstance}" field="reviewScore"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:movieReviewInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${movieReviewInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
