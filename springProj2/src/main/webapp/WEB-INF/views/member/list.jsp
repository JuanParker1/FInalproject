<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원목록</title>
</head>
<body>
<!-- 
varStatus
*1) count : 1부터 순서적으로 1씩 증가
*2) index : 0부터 순서적으로 1씩 증가
3) current : 현재의 아이템
4) first : 처음 반복되는 것인지 반환
5) last : 마지막 반복인지 반환
6) begin : 시작값
7) end : 끝값
8) step : 증가값
-->
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>가입일</th>
		<th>보유 카드번호</th>
	</tr>
	<c:forEach var="memberVO" items="${list}" varStatus="stat">
	<tr>
		<td>${stat.count}</td>
		<td>${memberVO.name}</td>
		<td>${memberVO.email}</td>
		<td>${memberVO.regdate}</td>
		<td>
			<c:forEach var="cardVO" items="${memberVO.cardList}">
				${cardVO.no}&nbsp;
			</c:forEach>
		</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>


