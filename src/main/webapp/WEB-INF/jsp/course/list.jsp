<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OnCourse - Courses</title>
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
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
	var row;
	function editCourse() {
		var courseId = $(this).closest("tr").attr("data-user-id");
		
			$.ajax({
			url : "getcourse/" + userId,
			dataType : "json",
			processData : false,
			contentType : "application/json",
			data : courseId,
			success : function(data) {

				$("#course-form1 #code").val(data["code"]);
				$("#course-form1 #course_name").val(data["name"]);
				$("#course-form1 #unit").val(data["units"]);
				$("#course-form1 #hdnId").val(data.id);

			}
		});
		$("#course-form1").dialog("open");
		row = $(this);

	}

	function updateCourse(Id) {
		
		$
				.ajax({
					url : "edit/" + Id,
					method : "PUT",
					processData : false,
					contentType : "application/json",
					data : JSON.stringify({
						code : $("#course-form1 input[name='CODE']").val(),
						name : $("#course-form1 input[name='COURSE_NAME']").val(),
						units : $("#course-form1 input[name='UNIT']").val()
					}),
					success : function(data) {
						
						var newRow = $("<tr data-course-id='" + data.id + "'>"
								+ "<td data-field='ccode'>"
								+ $("#course-form1 input[name='CODE']").val()
								+ "</td>"
								+ "<td data-field='cname'>"
								+ $("#course-form1 input[name='COURSE_NAME']").val()
								+ "</td>"
								+ "<td data-field='cunits' style='text-align: center;'>"
								+ $("#course-form1 input[name='UNIT']").val()
								+ "</td>"
								+ "<td><a class='edit' href='javascript:void(0)'>Edit</a></td>")
						row.closest("tr").replaceWith(newRow);
						 $("input[name='id']").val("");

					}
				});
		$("#course-form1").dialog("close");

	}
	$(function() {
		$("#course-form1").dialog({
			autoOpen : false,
			buttons : {
				"Save" : function() {
					if ($("input[name='ID']").val()) {
						updateCourse($("input[name='ID']").val());
					} else {
						addUser();
					};
					$(this).dialog("close");
				}
			}
		});
	});
	$(".edit").click(editCourse);
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
			<input name="ID" type="hidden" id="hdnId" />
		</form>
	</div>
</body>
</html>
