<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Departments</title>
</head>
<body>
<!-- <h2><a href="/oncourse">OnCourse</a></h2> -->
<h3>Departments</h3>
<table border="1">
<tr><th>Name</th><th>Programs</th></tr>
<c:forEach items="${departments}" var="department">
<tr>
  <td>${department.name}</td>
  <td style="text-align: center">${fn:length(department.programs)}</td>
</tr>
</c:forEach>
</table>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Departments</title>
<script type="text/javascript">
	function addDepartment() {

		$
				.ajax({
					url : "departmentadd",
					method : "POST",
					dataType : "json",
					processData : false,
					contentType : "application/json",
					data : JSON.stringify({
						name : $("input[name='DEPARTMENT']").val(),
						
					}),
					success : function(data) {
						alert(data.program);
						var newRow = $("<tr data-course-id='" + data.id + "'>"
								+ "<td data-field='dname'>"
								+ data.name
								+ "</td>")
						$("#department").append(newRow);

					}
				});
	}

	$(function() {
		$("#department-user-form").dialog({
			autoOpen : false,
			buttons : {
				"Save" : function() {

					addDepartment()
					$(this).dialog("close");
				}
			}
		});
	});

	$("#departmentAdd").click(function() {

		$("#department-user-form").dialog("open");

	});
</script>

</head>
<body>
	<h2>
		<a href="..">OnCourse</a>
	</h2>
	<h3>Departments</h3>
	<p>
		<button id="departmentAdd">Add Department</button>

	</p>
	<table id="department" border="1">
		<tr>
			<th>Name</th>
			<th>Programs</th>
		</tr>
		<c:forEach items="${departments}" var="department">
			<tr>
				<td data-field='dname'>${department.name}</td>
				<td data-field='program' style="text-align: center">${fn:length(department.programs)}</td>
			</tr>
		</c:forEach>
		
	</table>
	<div id="department-user-form">
		<form>
			<table>
				<tr>
					<th>Deaprtment</th>
					<td><input id="department" name="DEPARTMENT" type="text" /></td>
				</tr>


			</table>

		</form>
	</div>
</body>
</html> --%>
