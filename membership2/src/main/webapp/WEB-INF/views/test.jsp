<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(function(){
	var btn = $("#savebutton");

	$(btn).click(function(){
		
		submitContents($("#ir1"));
		
	})
	
})

function submitContents(elClickedObj) {
 // 에디터의 내용이 textarea에 적용된다.
 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

 // 에디터의 내용에 대한 값 검증은 이곳에서
 document.getElementById("ir1").value;

 try {
     elClickedObj.form.submit();
 } catch(e) {}

</script>
</head>
<body>
<form action="/test">
<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
<button id="savebutton">등록</button>
</form>
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
</script>
</html>