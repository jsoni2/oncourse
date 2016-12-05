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
