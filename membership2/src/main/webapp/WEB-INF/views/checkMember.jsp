<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
</head>
<body>
<h2>주민번호 확인</h2>

<form action="/checkMember" method="post">
	이름:<input type="text" name="name" id="name"><br>
	주민번호:<input type="text" name="rr_no" id="rr"><br>
	전화번호:<input type="text" name="tel" id="tel">
	<button id="btnTel" type="button">전화번호 확인</button><br>
	확인번호:<input type="text" name="checkTel" id="checkTel"><br>
	<button id="btnSubmit">확인</button>
</form>
</body>
</html>