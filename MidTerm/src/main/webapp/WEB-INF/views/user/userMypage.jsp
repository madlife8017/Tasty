<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<title>회원정보</title>

<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap')
	;

* {
	margin: 0 auto;
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
	width: 500px;
	height: 750px;
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
	/* color: #000; */
	color: #22df64;
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
	color: /* #a2a2a2 */ lightgray;
	pointer-events: none;
	transition: .5s;
}

.input-group input {
	width: 320px;
	height: 40px;
	font-size: 16px;
	color: lightgray;
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
}

.input-over {
	color: lightgray;
}

.commit {
	position: relative;
}

.commit2 {
	block: inline-block;
	position: absolute;
	left: 10px;
	width: 10px;
	height: 50px;
}

.commit3 {
	position: absoulte;
}

.commit4 {
	position: absoulte;
}


.commit2 .class-over{
	position: absolute;
	left: 50px;
	top: -5px;
	width: 80px;
	height: 35px;
	background: #22df64;
	color: white;
}

.commit3 .class-over{ /*삭제버튼*/
	position: absolute;
	left: 155px;
	top: -5px;
	width: 80px;
	height: 35px;
	background: #22df64;
	color: white;
}

.commit4 .class-over{
	position: absolute;
	left: 250px;
	top: -5px;
	width: 80px;
	height: 35px;
	background: #22df64;
	color: white;
}





</style>
</head>







<body>
	<div class="wrapper">
		<div class="form-wrapper sign-in">
			<section id="container">
				<form action="/user/userDelete" method="post">
					<h2>회원 정보</h2>
					<div class="input-group">
						<div class="form-group has-feedback">
							<input class="form-control" type="text" id="userId" name="userId"
								value="${userInfo.userId}" readonly="readonly" /> <label
								class="control-label" for="userId">아이디</label>
						</div>
					</div>

					<div class="input-group">
						<!-- <label class="control-label" for="userName">* 이름</label>  -->
						<div class="input-over">
							<div class="form-group has-feedback">이름</div>
							<input class="form-control" type="text" id="userName"
								name="userName" value="${userInfo.userName}" />
						</div>

					</div>

					<div class="input-group">
						<div class="input-over">
							<div class="form-group has-feedback">번호</div>
						</div>
						<input class="form-control" type="text" id="userPhone1"
							name="userPone1"
							<%-- value="${userInfo.userPhone1}${userInfo.userPhone2}" --%>
								value="${userInfo.userPhone1}">
					</div>

					<div class="input-group">
						<div class="input-over">
							<div class="form-group has-feedback">우편번호</div>
						</div>
						<input class="form-control input-sm" name="addrZipNum"
							id="addrZipNum" value="${userInfo.addrZipNum}">
					</div>


					<div class="input-group">
						<div class="input-over">
							<div class="form-group has-feedback">주소</div>
						</div>
						<input class="form-control input-sm add" name="addrBasic"
							id="addrBasic" value="${userInfo.addrBasic}">
					</div>


					<div class="input-group">
						<div class="input-over">
							<div class="form-group has-feedback">상세주소</div>
						</div>
						<input class="form-control input-sm add" name="addrDetail"
							id="addrDetail" value="${userInfo.addrDetail}">
					</div>



					<div class="input-group-addon">
						<div class="form-group has-feedback">
							<div class="commit">

								<div class="commit2">
									<button class="w-btn-outline w-btn-indigo-outline class-over"
										type="button" id="updateBtn">수정</button>
								</div>

								<div class="commit3">
									<button class="w-btn-outline w-btn-indigo-outline class-over"
										type="button" id="deleteBtn">탈퇴</button>
								</div>

								<div class="commit4">
									<button class="w-btn-outline w-btn-indigo-outline class-over"
										type="button" id="cancelBtn">취소</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>




</body>

<script type="text/javascript">
	
		document.getElementById('updateBtn').onclick = () => {
			location.href = "${pageContext.request.contextPath}/user/userUpdate";
		};
			
		document.getElementById('deleteBtn').addEventListener('click', e => {
			location.href = "${pageContext.request.contextPath}/user/userDelete";
		});
		
		
		document.getElementById('cancelBtn').addEventListener('click', e => {
			location.href = "${pageContext.request.contextPath}/";
		});
		
		
		
		
		
		
		
		
		
		
		
	</script>

</html>