<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
		/* $("#tabs").on(
				"tabsactivate",
				function(event, ui) {
					window.location.href = ui.newTab.find('a.ui-tabs-anchor')
							.attr('href');
				}); */
		$("#tabs").bind("tabsselect", function(event, ui) {
			window.location.href = $(ui.panel).find('a:first').attr('href');
		});
	});
</script>
</head>
<body>
	<h2>
		<a href="/oncourse">OnCourse</a>
	</h2>

	<security:authorize access="anonymous">
		<li><a href="<c:url value='/login' />">Login</a></li>
		<p>OnCourse is a system that helps students to stay on course in
			their academic career.</p>
	</security:authorize>
	<div id="tabs">
		<ul>
			<security:authorize access="authenticated">
				<security:authorize access="hasAnyRole('ADMIN','ADVISOR')">
					<li><a href="course/list">Courses</a></li>
					<li><a href="department/list">Departments</a></li>
					<li><a href="program/list">Programs</a></li>
				</security:authorize>
				<li><a href="grade/list">Grades</a></li>
				<li><a href="<c:url value='/logout' />">Logout</a></li>
			</security:authorize>
		</ul>


	</div>
</body>
</html>
