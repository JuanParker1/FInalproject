<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Logout</title>
</head>
<body>

<form method="post" action="/logout">
	<sec:csrfInput/>
	<button type="submit">๋ก๊ทธ์์</button>
</form>

</body>
</html>