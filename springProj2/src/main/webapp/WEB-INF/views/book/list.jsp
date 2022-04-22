<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>책 목록</title>
<script type="text/javascript">
function fn_create(){
	location.href="/create";
}
</script>
</head>
<body>
<h1>책 목록</h1>
<p>
	<!-- 
		form 태그의 기본 HTTP 메소드는 GET. 
		action 속성을 생략하면 현재 url(/list)를 요청
	-->
<!-- 	<form method="get" action="/list"> -->
	<form>
		<input type="text" name="keyword" value="${param.keyword}" />
		<input type="submit" value="검색" />
	</form>
</p>
<table border="1">
	<thead>
		<tr>
			<th>제목</th>
			<th>카테고리</th>
			<th>가격</th>
		</tr>
	</thead>
	<tbody>
		<!-- data 객체의 타입 : List<BookVO> -->
		<c:forEach var="row" items="${data}">
		<tr>
			<td><a href="/detail?bookId=${row.bookId}">${row.title}</a></td>
			<td>${row.category}</td>
			<td>${row.price}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<input type="button" value="책입력" onclick="fn_create();" />
</body>
</html>


