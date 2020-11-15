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
	$("#btnSubmit").click(function(){
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		$("#tel").val(tel1+"-"+tel2+"-"+tel3);
		
		var rr_no1 = $("#rr_no1").val();
		var rr_no2 = $("#rr_no2").val();
		var rr = { rr_no : rr_no1+rr_no2 };

// 		var checkRR = true;
// 		$.ajax({ 
// 			url :'/checkRR',
// 			type : 'post', 
// 			dataType : 'json', 
// 			data : rr, 
// 			success: function(dataa){
// 				console.log(dataa);
// 		} });

// 		if(checkRR == false){
// 			return false;
// 		}
		
		$("#rr_no").val(rr_no1+"-"+rr_no2);
	});

	$("btnTel").click(function(){
		
	});
});
</script>
</head>
<body>
<h2>주민번호 확인</h2>

<form action="/checkMember" method="post">
	이름:<input type="text" name="name" id="name"><br>
	주민번호:<input type="text" name="rr_no1" id="rr_no1">-<input type="password" name="rr_no2" id="rr_no2">
	<input type="hidden" name="rr_no" id="rr_no"><br>
	전화번호:<input type="text" id="tel1" name="tel1" placeholder="000" class="tel"> - 
  	<input type="text" id="tel2" name="tel2" placeholder="0000" class="tel"> - 
  	<input type="text" id="tel3" name="tel3" placeholder="0000" class="tel">
  	<input type="hidden" id="tel" name="tel" class="tel">
	<button id="btnTel" type="button">전화번호 확인</button><br>
	확인번호:<input type="text" name="checkTel" id="checkTel"><br>
	<button id="btnSubmit">확인</button>
</form>
</body>
</html>