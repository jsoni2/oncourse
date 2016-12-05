<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OnCourse - Project</title>
</head>
<body>
<h2><!-- <a href="/oncourse">OnCourse</a> --> &gt;
<a href="list">Programs</a></h2>
<h3>${program.department.name}: ${program.name}</h3>
<p>${program.description}</p>
<c:forEach items="${program.blocks}" var="block" varStatus="status">
<h4>${status.index}. ${block.name}</h4>
<p>${block.description}</p>
<table border="1">
  <c:forEach items="${block.courses}" var="course">
  <tr><td>${course.code}</td><td>${course.name}</td></tr>
  </c:forEach>
</table>
</c:forEach>
</body>
</html>
