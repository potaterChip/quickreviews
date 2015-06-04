<%@ page import="com.potaterchip.MovieReview" %>



<div class="fieldcontain ${hasErrors(bean: movieReviewInstance, field: 'homeLink', 'error')} ">
	<label for="homeLink">
		<g:message code="movieReview.homeLink.label" default="Home Link" />
		
	</label>
	<g:textField name="homeLink" value="${movieReviewInstance?.homeLink}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieReviewInstance, field: 'onDemandLink', 'error')} ">
	<label for="onDemandLink">
		<g:message code="movieReview.onDemandLink.label" default="On Demand Link" />
		
	</label>
	<g:textField name="onDemandLink" value="${movieReviewInstance?.onDemandLink}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieReviewInstance, field: 'movieName', 'error')} required">
	<label for="movieName">
		<g:message code="movieReview.movieName.label" default="Movie Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="movieName" required="" value="${movieReviewInstance?.movieName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieReviewInstance, field: 'numberOfSearches', 'error')} required">
	<label for="numberOfSearches">
		<g:message code="movieReview.numberOfSearches.label" default="Number Of Searches" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numberOfSearches" type="number" value="${movieReviewInstance.numberOfSearches}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieReviewInstance, field: 'quickReview', 'error')} required">
	<label for="quickReview">
		<g:message code="movieReview.quickReview.label" default="Quick Review" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quickReview" required="" value="${movieReviewInstance?.quickReview}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: movieReviewInstance, field: 'reviewScore', 'error')} required">
	<label for="reviewScore">
		<g:message code="movieReview.reviewScore.label" default="Review Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="reviewScore" type="number" value="${movieReviewInstance.reviewScore}" required=""/>

</div>

