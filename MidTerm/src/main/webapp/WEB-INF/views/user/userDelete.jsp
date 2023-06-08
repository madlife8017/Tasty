<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
부가적인 테마
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->


<!-- <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<title>회원탈퇴</title>


<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">


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
	width: 450px;
	height: 500px;
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
	text-align: center;
	margin-left: 30px;
	padding-top: 80px;
	color: #22df64;
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





/* .signUp-link {
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
} */






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
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.05);
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
	height: 35px;
	background: #22df64;
	color: white;
	
	
}

.btn-success {
	display: inline-block;
}

.btn-danger {
	display: inline-block;
}

#delform {
	margin-left: 20px;
}

#over {
	color: #606060;
}

.commit {
	position: relative;
	width: 150px;
	height: 150px;
}

.commit2{
	position: absolute;
	left: 155px;
}

.commit3{
	position: absolute;
	right: -115px;
}


.class-over{
	height: 40px;
	width: 80px;
}



</style>






</head>


<body>
	<div class="wrapper">
		<div class="form-wrapper sign-in">
			<section id="container">
				<form action="${pageContext.request.contextPath}/user/userDelete"
					method="POST" id="delForm">
					<h2>회원 탈퇴</h2>



					<div class="input-group">
						<div class="form-group has-feedback">
							<label class="control-label" for="userId">아이디</label> <input
								class="form-control" type="text" id="userId" name="userId"
								value="${userInfo.userId}" readonly="readonly" />
						</div>
					</div>



					<div class="input-group">
						<div class="form-group has-feedback">
							<label class="control-label" for="userName">성명</label> <input
								class="form-control" type="text" id="userName" name="userName"
								value="${userInfo.userName}" readonly="readonly" />
						</div>
					</div>





					<div class="input-group">
						<div class="form-group has-feedback">
							<label class="control-label" for="userPass" id="over">패스워드</label>
							<input class="form-control" type="password" id="userPass"
								name="userPw" />
						</div>
					</div>




					<div class="form-group has-feedback">

						<div class="commit">
							<div class="commit2">
								<button class="w-btn-outline w-btn-indigo-outline class-over"
									type="button" id="deleteBtn">회원탈퇴</button>
							</div>

							<div class="commit3">
								<button class="w-btn-outline w-btn-indigo-outline class-over"
									type="button" id="cancleBtn">취소</button>
							</div>
						</div>
					</div>

				</form>


				<div>
					<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
				</div>
			</section>
		</div>
	</div>
</body>


<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	

document.getElementById('cancleBtn').addEventListener('click', e => {
	location.href = "${pageContext.request.contextPath}/user/userMypage";
});




	document.getElementById('deleteBtn').addEventListener('click', e=>{
		const pwinput = document.getElementById("userPass").value;
		console.log("eeee"+pwinput);
		//const formData = new FormData();

		//formData.append('pwinput',pwinput);

		fetch('${pageContext.request.contextPath}/user/passChk', {
			method : 'post',
			body : 	pwinput			
			})
			.then(res => res.text())
			.then(data => {	

				console.log(data);	
				
				if(data==='0'){
					alert('패스워드가 틀렸습니다.');
					return;
				}else if(data==='1'){
					if(confirm("회원탈퇴하시겠습니까?")){
						alert('탈퇴 되었습니다! 이용해주셔서 감사합니다!');
						document.getElementById('delForm').submit();				
						
					}
				}
			})
	});
	
	
	
	
			/*$.ajax({
				url : "/user/passChk",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data) {

					if (data == 1) {
						if (confirm("회원탈퇴하시겠습니까?")) {
							$("#delForm").submit();
							return;
						}
					} else {
						alert("패스워드가 틀렸습니다.");
						return;

					}
				}
			})

		}); */



	/* $(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){
			
			location.href = "/";
					    
		})
		
		
		
		 $("#deleteBtn").on("click", function(){
			if($("#userPass").val() == ""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
				return false;
			}	
		}); 
	}) */

	/* //폼 데이터 검증 (수정 버튼을 눌렀을 때)
	document.getElementById('deleteBtn').onclick = function(){
		
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
		
		
	} */
</script>




</html>

