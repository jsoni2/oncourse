<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Grades</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
						alert(data.code);
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
		$("#user-form1").dialog({
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
		$("#user-form1").dialog("open");
	});
</script>
<script type="text/javascript">
	function addGrade() {
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
						alert(data.code);
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
		$("#grade-form1").dialog({
			autoOpen : false,
			buttons : {
				"Save" : function() {
					addGrade()
					$(this).dialog("close");
				}
			}
		});
	});
	$("#addgrade").click(function() {
		$("#grade-form1").dialog("open");
	});
</script>
</head>
<body>
	<!-- <h2><a href="/oncourse">OnCourse</a></h2> -->
	<h3>${user.name}'sGrades</h3>
	<p>
		<button id="addgrade">Add Grade</button>
	</p>
	<div id="grade-form1">
		<form>
			<p>
				<select name="season">
					<option value="F">Fall</option>
					<option value="W">Winter</option>
					<option value="S">Spring</option>
					<option value="X">Summer</option>
				</select> <select name="year">
					<c:forEach items="${years}" var="year">
						<option>${year}</option>
					</c:forEach>
				</select> <select name="courseId">
					<c:forEach items="${courses}" var="course">
						<option value="${course.id}">${course.code}</option>
					</c:forEach>
				</select> <select name="gradeId">
					<c:forEach items="${grades}" var="grade">
						<option value="${grade.id}">${grade.symbol}</option>
					</c:forEach>
				</select>
				<!-- <input type="submit" name="add" value="Add" /> -->
			</p>
		</form>
	</div>
	<table border="1">
		<tr>
			<th>Term</th>
			<th>Course</th>
			<th>Grade</th>
		</tr>
		<c:forEach items="${gradeRecords}" var="gradeRecord">
			<tr>
				<td>${gradeRecord.term.fullName}</td>
				<td>${gradeRecord.course.code}</td>
				<td style="text-align: center">${gradeRecord.grade.symbol}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
