<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<!-- 
스프링 폼 태그 라이브러리
 - 스프링 폼은 HTML 폼을 표시하기 위한 태그 라이브러리
 - 스프링 폼을 이용하면 HTML 폼과 자바 객체를 쉽게 바인딩할 수 있음

path : 폼 항목에 바인딩되는 폼 객체(Controller에 있음)의 프로퍼티를 지정
-->
<form:form modelAttribute="memberVO" method="post" action="/member/insert">
	<p>
		아이디 : <form:input path="memberid" />
		<font color="red">
			<form:errors path="memberid" />
		</font>
	</p>
	<p>
		이름 : <form:input path="name" />
		<font color="red">
			<form:errors path="name" />
		</font>
	</p>
	<p>
		비밀번호 : <form:password path="password" />
		<font color="red">
			<form:errors path="password" />
		</font>
	</p>
	<p>
		이메일 : <form:input path="email" />
		<font color="red">
			<form:errors path="email" />
		</font>
	</p>
	<p>
		자기소개 : 
		<form:textarea path="introduction" rows="6" cols="30" />
	</p>
	<p>
		취미 : 
		<form:checkboxes path="hobbyList" items="${hobbyMap}" />
	</p>
	<p>
		취미(hobbyArray) : 
		<form:checkbox path="hobbyArray" value="안찰수" label="안찰수" /><br />
		<form:checkbox path="hobbyArray" value="이재면" label="이재면" /><br />
		<form:checkbox path="hobbyArray" value="윤선열" label="윤선열" /><br />
		<form:checkbox path="hobbyArray" value="심상전" label="심상전" /><br />
	</p>
	<p>
		성별 :
<%-- 		<form:radiobuttons path="gender" items="달러{genderMap}" /> --%>
		<form:radiobutton path="gender" value="Male" label="Male" />&nbsp;
		<form:radiobutton path="gender" value="Female" label="Female" />&nbsp;
		<form:radiobutton path="gender" value="Other" label="Other" />
	</p>
	<form:button name="register">등록</form:button>
</form:form>
</body>
</html>




