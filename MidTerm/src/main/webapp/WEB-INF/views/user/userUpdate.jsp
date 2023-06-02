<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 -->
<!-- <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<title>회원수정</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	/* background: linear-gradient(to right, #f64f59, #c471ed, #12c2e9); */
	background: white;
}

.wrapper {
	position: relative;
	width: 750px;
	height: 550px;
	background: rgba(255, 255, 255, .2);
	border-radius: 20px;
	box-shadow: 0 0 50px rgba(0, 0, 0, .1);
	padding: 40px;
}

.form-wrapper {
	display: flex;
	align-items: center;
	width: 100%;
	height: 100%;
	transition: 1s ease-in-out;
}

.wrapper.active .form-wrapper.sign-in {
	transform: scale(0) translate(-300px, 500px);
}

.wrapper .form-wrapper.sign-up {
	position: absolute;
	top: 0;
	transform: scale(0) translate(200px, -500px);
}

.wrapper.active .form-wrapper.sign-up {
	transform: scale(1) translate(0, 0);
}

h2 {
	font-size: 30px;
	color: #000;
	text-align: center;
}

.input-group {
	position: relative;
	margin: 30px 0;
	border-bottom: 2px solid lightgray;
}

.input-group label {
	position: absolute;
	top: 50%;
	left: 5px;
	transform: translateY(-150%);
	font-size: 16px;
	color: lightgray;
	pointer-events: none;
	transition: .5s;
}

.input-group input {
	width: 320px;
	height: 40px;
	font-size: 16px;
	color: silver;
	padding: 0 5px;
	background: transparent;
	border: none;
	outline: none;
}

/* .input-group input:focus ~label, .input-group input:valid ~label {
	top: -5px;
} */
.remember {
	margin: -5px 0 15px 5px;
}

.remember label {
	color: lightgray;
	font-size: 14px;
}

.remember label input {
	accent-color: #22df64;
}

#loginBtn {
	position: relative;
	width: 100%;
	height: 40px;
	background: white;
	font-size: 16px;
	color: #000;
	cursor: pointer;
	/* border-radius: 30px; */
	border-color: rgb(208, 208, 208) /* outline: none; */
}

#loginBtn:hover {
	background: #40fa81;
	transition: 0.5s;
	color: #fff;
}

#JoinBtn {
	position: relative;
	width: 100%;
	height: 40px;
	background: white;
	font-size: 16px;
	color: #000;
	cursor: pointer;
	/* border-radius: 30px; */
	border-color: rgb(208, 208, 208) /* outline: none; */
}

#JoinBtn:hover {
	background: #40fa81;
	transition: 0.5s;
	color: #fff;
}

#kakaoBtn {
	border: none;
	/* outline: none; */
	/* box-shadow: none; */
}

.signUp-link {
	font-size: 14px;
	text-align: center;
	margin: 15px 0;
}

.signUp-link p {
	color: lightgray;
}

.signUp-link p a {
	color: #22df64;
	text-decoration: none;
	font-weight: 500;
}

.signUp-link p a:hover {
	text-decoration: underline;
}

.social-platform {
	font-size: 14px;
	color: lightgray;
	text-align: center;
}

.social-icons a {
	display: inline-block;
	width: 35px;
	height: 35px;
	background: transparent;
	border: 1px solid lightgray;
	border-radius: 50%;
	text-align: center;
	line-height: 35px;
	margin: 15px 6px 0;
	transition: 1s;
}

.social-icons a:hover {
	background: #22df64;
}

.social-icons a i {
	color: #22df64;
	font-size: 14px;
	transition: .1s;
}

.social-icons a:hover i {
	color: rgb(255, 255, 255);
}

/* #msgId {
	color: red;
}

#msgPw {
	color: red;
}

#msgPw-c {
	color: red;
} */
.w-btn {
	position: relative;
	/* border: none; */
	display: inline-block;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	position: absolute;
	top: 10px;
	right: 50px;
	/*  padding: 15px 30px; */
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-indigo {
	background-color: aliceblue;
	color: #1e6b7b;
}

.w-btn-indigo-outline {
	border: 3px solid aliceblue;
	color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
	color: #1e6b7b;
	background: aliceblue;
}

.w-btn-outline.w-btn-indigo-outline {
	margin: 0 -40px;
	float: right;
	bottom: 70px;
}

div.regionon {
	position: relative;
}

div.region {
	float: left;
	clean: both;
}

div.region2 {
	float: right;
	position: absolute;
	left: 350px;
	clean: both;
}

.commit {
	text-align: center;
	position: relative;
}

.btn-success {
	display: inline-block;
}

.btn-danger {
	display: inline-block;
}

h2 {
	color: black;
	margin-left: 220px;
}

.commit {
	margin-left: 280px;
	float: left;
}

/* 
.wrapper .commit{
	margin-left: 250px;
	flot: right;
} */

/* div.form-group.has-feedback{
	 margin-left: 150px;
	
}   */
#qweqwe { /*주소찾기버튼*/
	height: 30px;
	width: 150px;
	position: absolute;
	bottom: 20px;
	left: 20px;
}

#asdasd { /*취소버튼*/
	width: 100px;
	height: 30px;
	position: absolute;
	left: 180px;
}

#submit { /*수정버튼*/
	height: 30px;
	width: 100px;
	position: absolute;
	right: 70px;
}


#input-over{
	color: #606060;
}


</style>








</head>


<body>
	<div class="wrapper">
		<div class="form-wrapper sign-in">
			<section id="container">
				<form action="${pageContext.request.contextPath}/user/userUpdate"
					method="post">


					<h2>Edit information</h2>


					<div class="regionon">
						<div class="region">
						
							<div class="input-group">
								<div class="form-group has-feedback">
									<input class="form-control" type="text" id="userId"
										name="userId" value="${userInfo.userId}" readonly="readonly" />
									<label class="control-label" for="userId">아이디</label>
								</div>
							</div>



							<div class="input-group">
								<div class="form-group has-feedback">
									<label class="control-label" id="input-over" for="userName">이름</label> <input
										class="form-control" type="text" id="userName" name="userName"
										value="${userInfo.userName}" />
								</div>
							</div>



							<div class="input-group">
								<div class="form-group has-feedback">
									<label class="control-label" for="userPass" id="input-over">패스워드</label> <input
										class="form-control" type="password" id="userPass"
										name="userPw" /> <span id="msgPw"></span>
								</div>
							</div>



							<div class="input-group">
								<div class="form-group has-feedback">
									<label class="control-label" for="userPass" id="input-over">패스워드확인</label> <input
										class="form-control" type="password" id="pwConfirm" /> <span
										id="msgPw-c"></span>
								</div>
							</div>



						</div>







						<div class="region2">
							<div class="input-group">
								<div class="form-group has-feedback">
									<label class="control-label" for="userName" id="input-over">휴대폰</label> <input
										class="form-control input-sm sel" type="text"
										name="userPhone1"
										<%-- <option ${userInfo.userPhone1=='010' ? 'selected' : '' }>010</option>
								<option ${userInfo.userPhone1=='011' ? 'selected' : '' }>011</option>
								<option ${userInfo.userPhone1=='017' ? 'selected' : '' }>017</option>
								<option ${userInfo.userPhone1=='018' ? 'selected' : '' }>018</option> --%>
							value="${userInfo.userPhone1}" />
								</div>
							</div>


							<%-- <input class="form-control input-sm" name="userPhone2"
						value="${userInfo.userPhone2}"> --%>

							<div class="overrap">
								<div class="input-group">
									<label class="form-group has-feedback" id="input-over">우편번호</label> <input
										class="form-control input-sm" name="addrZipNum"
										id="addrZipNum" value="${userInfo.addrZipNum}" readonly>
								</div>


								<div class="input-group">
									<label class="form-group has-feedback" id="input-over">주소</label> <input
										class="form-control input-sm add" name="addrBasic"
										id="addrBasic" value="${userInfo.addrBasic}">
								</div>




								<div class="input-group">
									<label class="form-group has-feedback" id="input-over">상세주소</label> <input
										class="form-control input-sm add" name="addrDetail"
										id="addrDetail" value="${userInfo.addrDetail}">
								</div>


								<!-- <div class="overing">
									<button type="button" class="btn btn-primary"
										onclick="searchAddress()">주소찾기</button>
								</div> -->


							</div>
						</div>
					</div>




					<div class="input-group-addon">
						<div class="commit">
							<div class="form-group has-feedback">
								<!-- 	<button class="btn btn-success" type="submit" id="submit" class="w-btn-outline w-btn-indigo-outline">수정</button>
								<button type="button" class="btn btn-primary"
									onclick="searchAddress()">주소찾기</button> -->
								<button class="w-btn-outline w-btn-indigo-outline" type="submit"
									id="submit">수정</button>
								<button class="w-btn-outline w-btn-indigo-outline" id="qweqwe"
									type="button" onclick="searchAddress()">주소찾기</button>
								<button class="w-btn-outline w-btn-indigo-outline" id="asdasd"
									type="button">취소</button>
							</div>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>



	<div>
		<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
					</c:if>
	</div>
</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}	
			});
			
				
			
		})
		
		//폼 데이터 검증 (수정 버튼을 눌렀을 때)
		document.getElementById('updateBtn').onclick = function(){
			
			if(idFlag && pwFlag){ //둘중 하나라도 false니? 정규표현식을 통과했으면 각각 true가 오겠지. 이걸 통과 해야 중복체크 등등을 검사한다. 하나라도 통과하지 못한다면 else로빠짐.
				//입력값 검증
			
		    	if(document.getElementById('userPw').value !== document.getElementById('pwConfirm').value){ //혹시 입력한 비밀번호 값과 비밀번호 확인란과 값이 다르니? 
		    		alert('비밀번호 확인란을 확인하세요!')
		    		return
		    	}
		    	
		    	if(document.getElementById('userName').value === ''){
		    		alert('이름은 필수값입니다.');
		    		return;
		    	}
		    	
				if(confirm('회원정보 수정을 진행합니다.')){
					document.joinForm.submit();
				} else { //취소버튼누르면
					return;
				}
		    	
			} else { //정규표현식 통과 못함
				alert('입력값을 다시 한 번 확인하세요!');
			}
			
			
		}
		//주소 API
		function searchAddress() { 
		    new daum.Postcode({
		        oncomplete: function(data) {

		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수

		            //사용자가 선택한 주소 타입에 따라 해당 주소 값 가져옴
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }		
					
					
		         // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('addrZipNum').value = data.zonecode; //우편번호
		            document.getElementById("addrBasic").value = addr; 	//기본주소
		            document.getElementById("addrDetail").focus();
		        }
		    }).open();
		} //주소찾기 api 끝.
		
		/*비밀번호 형식 검사 스크립트*/
		var pw = document.getElementById("userPw");
		pw.onkeyup = function() {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (regex.test(document.getElementById("userPw").value)) {
				document.getElementById("userPw").style.borderColor = "green";
				document.getElementById("msgPw").innerHTML = "사용가능합니다";

				pwFlag = true;
			
			} else {
				document.getElementById("userPw").style.borderColor = "red";
				document.getElementById("msgPw").innerHTML = "불가능합니다.";
			
				pwFlag = false;
			}
		}

		/*비밀번호 확인검사*/
		var pwConfirm = document.getElementById("pwConfirm");
		pwConfirm.onkeyup = function() {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (document.getElementById("pwConfirm").value == document
					.getElementById("userPw").value) {
				document.getElementById("pwConfirm").style.borderColor = "green";
				document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
			} else {
				document.getElementById("pwConfirm").style.borderColor = "red";
				document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
			}
		}
	</script>


</html>