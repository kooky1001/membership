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
	$("#btn").click(function(){
		alert("ok")
		$.ajax({
		    url: "/checkTel",
		    method: "POST",
		    dataType: "text",
		    success: function(data) {
			    alert(data);
		    }
		  });
	});
})

</script>
</head>
<body>
<button id="btn">ddd</button>
</body>
</html>