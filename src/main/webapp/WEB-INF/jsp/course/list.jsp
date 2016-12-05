<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Courses</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> -->
<script type="text/javascript">
	function addUser() {
		$
				.ajax({
					url : "addcourse",
					method : "POST",
					dataType : "json",
					processData : false,
					contentType : "application/json",
					data : JSON.stringify({
						code : $("input[name='CODE']").val(),
						name : $("input[name='COURSE_NAME']").val(),
						units : $("input[name='UNIT']").val()
					}),
					success : function(data) {
						var newRow = $("<tr data-course-id='" + data.id + "'>"
								+ "<td data-field='ccode'>"
								+ data.code
								+ "</td>"
								+ "<td data-field='cname'>"
								+ data.name
								+ "</td>"
								+ "<td data-field='cunits' style='text-align: center;'>"
								+ data.units
								+ "</td>"
								+ "<td><a class='edit' href='javascript:void(0)'>Edit</a></td>")
						$("#courses").append(newRow);
					}
				});
	}
	$(function() {
		$("#course-form1").dialog({
			autoOpen : false,
			buttons : {
				"Save" : function() {
					addUser()
					$(this).dialog("close");
				}
			}
		});
	});
	$("#add").click(function() {
		$("form")[0].reset();
		$("#course-form1").dialog("open");
	});
</script>
</head>
<body>
	<h3>Courses</h3>
	<p>
		<button id="add">Add User</button>
	</p>
	<table id="courses" border="1">
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Units</th>
			<th></th>
		</tr>
		<c:forEach items="${courses}" var="course">
			<tr data-user-id="${course.id}">
				<td data-field="ccode">${course.code}</td>
				<td data-field="cname">${course.name}</td>
				<td data-field="cunits" style="text-align: center;">${course.units}</td>
				<td><a class="edit" href="javascript:void(0)">Edit</a></td>
			</tr>
		</c:forEach>
	</table>
	<div id="course-form1">
		<form>
			<table>
				<tr>
					<th>CODE</th>
					<td><input id="code" name="CODE" type="text" /></td>
				</tr>
				<tr>
					<th>COURSE NAME</th>
					<td><input id="course_name" name="COURSE_NAME" type="text" /></td>
				</tr>
				<tr>
					<th>UNIT</th>
					<td><input id="unit" name="UNIT" type="text" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
