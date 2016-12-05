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
