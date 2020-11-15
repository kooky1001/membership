<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/temp.css">
<style type="text/css">

.side {
/* 	border: solid 1px black; */
}

/* 타이틀 */
#title {
	text-align: center;
	border-bottom: 2px solid #94CCC4;
}

/* 메인 */
#main {
	color: #5d5d5d;
	justify-content: center;
 	width: 100%; 
 	padding-right: 10%;
 	padding-left: 10%;
}

.maintitle {
	margin-bottom: 20px;
}

.mtitle {
	margin-top: 30px;
	border-left: 5px solid #94CCC4;
	padding-left: 10px;
}
.ptitle {
	color: #94CCC4;
	margin-top: 30px;
	border-bottom: solid 1px #CBE2B8;
	padding-bottom: 20px;
}

/* 테이블 */
.table {
 	width: 100%; 
 	border-collapse: collapse;
}

.table tr {
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.table th {
	text-align: left;
	padding-right: 50px;
	padding-bottom: 20px;
	padding-top: 20px;
	margin-right: 0px;
	width: 30%;
	border-bottom: 1px solid #ddd;
}
.table td {
	text-align: left;
	padding-left: 30px;
	padding-bottom: 20px;
	padding-top: 20px;
	margin-left: 0px;
	border-bottom: 1px solid #ddd;
}

.tel {
	width: 60px;
}

.table .input {
	height: 30px;
 	width: 230px; 
}

.table button {
	margin-left: 10px;
	height: 30px;
	background-color: #94CCC4;
	
	  border: none;
	  color: white;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  transition-duration: 0.4s;
	  cursor: pointer;
}

.table button:hover {
  background-color: white;
  color: #94CCC4;
}

.table span {
	color: #94CCC4;
	font-size: 12px;
	padding-top: 10px;
}

#sex {
	height: 30px;
	width: 50px;
	text-align: center;
}

#addr1 {
	height: 30px;
	width: 150px;
	margin-bottom: 5px;
}

#addr2 {
	height: 30px;
	width: 400px;
	margin-bottom: 5px;
}
#addr3 {
	height: 30px;
	width: 400px;
}


/* 버튼 */
.btn {
	margin-left: 10px;
	height: 30px;
	background-color: #94CCC4;
	
	  border: none;
	  color: white;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  transition-duration: 0.4s;
	  cursor: pointer;
	  width: 100px;
}

.btn:hover {
  background-color: white;
  color: #94CCC4;
}

#bot {
	margin-top: 50px;
	justify-content: center;
	display: flex;
	margin-bottom: 50px;
}

.choice {
	margin-top: 30px;
	padding-top: 30px;
}

#tel, #name, #rr_no{
	border: none;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(function(){
	var id1;
	//아이디 중복확인을 했는지 알기위한 변수
	var checkId = true;

	//가입버튼을 눌렀을때 적용할 기능
	$("#btnJoin").click(function(){
		if($("#id").val() == ""){
			checkId = true;
			alert("아이디를 입력해주세요.");
			return false;
		}

		if (id1 != $("#id").val()){
			checkId = true;
		}
		
		if (checkId){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
// 		var tel1 = $("#tel1").val();
// 		var tel2 = $("#tel2").val();
// 		var tel3 = $("#tel3").val();
// 		$("#tel").val(tel1+tel2+tel3);
		
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		$("#email").val(email1+"@"+email2);
		
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		$("#addr").val(addr1+" "+addr2+" "+addr3);
		
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		if(pwd1 != pwd2){
			alert("비밀번호를 확인해주세요.")
			return false;
		} else{
			$("#pwd").val(pwd1);
		}
	});

	//주소를 찾기위하여 api를 적용
	$("#btnAddr").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            $("#addr1").val(data.zonecode);
	            var bname = "";
	            if(data.buildingName != ""){
					bname = " ("+data.buildingName+")";
			    }
	            $("#addr2").val(data.address+bname);
	        }
	    }).open();
	});

	//아이디 중복확인 버튼을 눌렀을때 동작
	$("#btnId").click(function(){
		var id = $("#id").val();

		if($("#id").val() == ""){
			checkId = true;
			alert("아이디를 입력해주세요.");
			return false;
		}
		$.ajax({ 
			url :'/checkId', 
			type : 'post', 
			dataType : 'json', 
			data : { id : id }, 
			success: function(data){
				if(data>0){
					alert("이미 존재하는 아이디입니다.");
					$("#id").val("");
				} else{
					alert("사용 가능한 아이디입니다.");
					checkId = false;
					id1 = $("#id").val();
				}
		} });

	});
});
</script>
</head>
<body>

<!-- Header Start -->
<%--      <jsp:include page="/header.jsp"></jsp:include> --%>
<!-- 	Header End -->

<div class="row">
  <div class="column side"></div>
  <div class="column middle">
  	<div id="title">
  		<h1>회원가입</h1>
  	</div>
  	<div id="main">
  		<div class="maintitle">
  			<h2 class="mtitle">개인정보입력</h2>
  		</div>
  		
  		<form id="form" action="/insertMember" method="post">
  		<div class="essential">
  			<h3 class="ptitle">필수입력사항</h2>
  			<div>
  				<table class="table">
  					<tr>
  						<th>이름</th>
  						<td><input type="text" id="name" name="name" class="input" value="${m.name }" readonly="readonly"></td>
  					</tr>
  					<tr>
  						<th>고객아이디</th>
  						<td><input type="text" id="id" name="id" class="input">
  							<button type="button" id="btnId">중복확인</button>
  						</td>
  					</tr>
  					<tr>
  						<th>비밀번호</th>
  						<td><input type="password" id="pwd1" name="pwd1" class="input" minlength="8" maxlength="20"><br><span>* 8~20자의 영문 대소문자, 숫자, 특수문자 중 2종류 이상 조합</span></td>
  					</tr>
  					<tr>
  						<th>비밀번호 확인</th>
  						<td><input type="password" id="pwd2" name="pwd2" class="input" minlength="8" maxlength="20"></td>
  						<td><input type="hidden" id="pwd" name="pwd" class="input"></td>
  					</tr>
  					<tr>
  						<th>주민등록번호</th>
  						<td><input type="text" id="rr_no" name="rr_no" class="input" value="${m.rr_no }" required="required" readonly="readonly"></td>
  					</tr>
  					<tr>
  						<th>연락처</th>
  						<td>  							
<%--   							<input type="text" id="tel1" name="tel1" placeholder="000" class="tel" value="${m.tel1 }"> -  --%>
<%--   							<input type="text" id="tel2" name="tel2" placeholder="0000" class="tel" value="${m.tel2 }"> -  --%>
<%--   							<input type="text" id="tel3" name="tel3" placeholder="0000" class="tel" value="${m.tel3 }"> --%>
  							<input type="text" id="tel" name="tel" class="input" value="${m.tel }" readonly="readonly">
  						</td>
  					</tr>
  					<tr>
  						<th>이메일</th>
  						<td>
  							<input type="text" id="email1" name="email1" class="input"> @ 
  							<select name="email2" id="email2">
								<option value="1">직접입력</option>
								<option value="naver.com" selected>naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="empas.com">empas.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="paran.com">paran.com</option>
							</select>
  						</td>
  						<input type="hidden" id="email" name="email" class="input">
  					</tr>
  				</table>
  			</div>
  		</div>
  		
  		<div class="choice">
  			<h3 class="ptitle">선택정보 입력</h3>
  			<div>
  				<table class="table">
  					<div class="test">
  					<tr>
  						<th>주소</th>
  						<td><input type="text" name="addr1" id="addr1" readonly="readonly"><button type="button" id="btnAddr">우편번호 검색</button><br>
  							<input type="text" name="addr2" id="addr2" readonly="readonly"><br>
  							<input type="text" name="addr3" id="addr3" placeholder="상세주소를 입력하세요.">
  							<input type="hidden" name="addr" id="addr">
  						</td>
  					</tr>
  					</div>
  					<tr>
  						<th>메일수신여부</th>
  						<td><input type="radio" name="emailReceive" value="o" checked="checked">동의 
  						<input type="radio" name="emailReceive" value="x">거부</td>
  					</tr>
  					<tr>
  						<th>문자수신여부</th>
  						<td><input type="radio" name="smsReceive" value="o" checked="checked">동의 
  						<input type="radio" name="smsReceive" value="x">거부</td>
  					</tr>
  				</table>
  			</div>
  		</div>
  		<input type="hidden" name="roles" value="USER">
  		<div id="bot">
  			<button id="btnJoin" class="btn">가입하기</button>
  			<button id="cancel" class="btn" type="reset">취소</button>
  		</div>
  		</form>
  		
  	</div>  
  </div>
  <div class="column side"></div>
</div>

<%-- <jsp:include page="/footer.jsp"></jsp:include> --%>

</body>
</html>
