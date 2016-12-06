<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Programs</title>
</head>
<body>
<!-- <h2><a href="/oncourse">OnCourse</a></h2> -->
<h3>Programs</h3>
<table border="1">
<tr><th>Department</th><th>Name</th></tr>
<c:forEach items="${programs}" var="program">
<tr>
  <td>${program.department.name}</td>
  <td><a href="view?id=${program.id}">${program.name}</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Programs</title>
<script type="text/javascript">
	function viewCourse() {
		var id = $(this).closest("tr").attr("data-user-id");

		$.ajax({
			url : "searchProgram/" + id,
			method : "GET",
			dataType : "json",
			success : function(data) {
				alert("");

				/* $("#user-form #fname").val(data["cou"]);
				$("#user-form #lname").val(data["lastName"]);
				$("#user-form #email").val(data["email"]);
				$("#user-form #hdnId").val(data["id"]); */

			}
		});
		$("#program-form").dialog("open");

	}
	$(function() {

		$("#program-form").dialog({
			autoOpen : false
		});
	});

	$(".view").click(viewCourse);
</script>
</head>
<body>
	<h2>
		<a href="..">OnCourse</a>
	</h2>
	<h3>Programs</h3>
	<table id="tableView" border="1">
		<tr>
			<th>Department</th>
			<th>Name</th>
		</tr>
		<c:forEach items="${programs}" var="program">

			<tr data-user-id="${program.id}">
				<td>${program.department.name}</td>
				<td><a class="view" href="javascript:void(0)">${program.name}</a></td>
			</tr>

		</c:forEach>

	</table>
	<div id="program-form">
		<table>
			<tr>
				<th>Code</th>
				<td data-field="code"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td data-field="course_name"></td>
			</tr>
			<tr>
				<th>Unit</th>
				<td data-field="unit"></td>
			</tr>
			<tr>
				<th>Email</th>
				<td data-field="email"></td>
			</tr>
		</table>
	</div>
</body>
</html> --%>
