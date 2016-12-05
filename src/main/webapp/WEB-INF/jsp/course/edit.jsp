<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OnCourse - Edit Course</title>
</head>
<body>
<!-- <h2><a href="/oncourse">OnCourse</a></h2> -->
<h3>Edit Course</h3>
<form:form modelAttribute="course">
<table>
  <tr><td>Code</td><td><form:input path="code" /></td></tr>
  <tr><td>Name</td><td><form:input path="name" /></td></tr>
  <tr><td>Unit</td><td><form:input path="units" /></td></tr>
  <tr><td>Obsolete</td><td><form:checkbox path="obsolete" /></td></tr>
  <tr><td colspan="2"><input type="submit" name="save" value="Save" /></td></tr>
</table>
</form:form>
</body>
</html>
