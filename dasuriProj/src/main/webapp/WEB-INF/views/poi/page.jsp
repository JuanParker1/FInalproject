<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
	<title>엑셀 파일 다운로드</title>
</head>
<body>
<form id="ExcelForm" name="ExcelForm" action="/poi/page" method="post">
	날짜 입력시 엑셀 파일에 그대로 입력되어 출력됩니다.<br/>
	<!-- 엑셀파일로 다운로드 받을 날짜를 입력받았다고 가정해보자 ! -->
	<input type="date" id="day1" name="day1" value="">
	<input type="date" id="day2" name="day2" value="">
<button type="submit" class="btn btn-default">엑셀 다운</button>
</form>
</body>


<script type="text/javascript">
// function poiExcel() {
// 	var formObj = $('#ExcelForm');
// 	formObj.attr('action', '/poiExcel');
// 	formObj.attr('method', 'post');
// 	formObj.submit();
// }
</script>

</html>
  
