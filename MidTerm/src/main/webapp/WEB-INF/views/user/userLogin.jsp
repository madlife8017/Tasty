<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tasty Friends</title>
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
	width: 400px;
	height: 650px;
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
	transform: translateY(-50%);
	font-size: 16px;
	color: lightgray;
	pointer-events: none;
	transition: .5s;
}

.input-group input {
	width: 320px;
	height: 40px;
	font-size: 16px;
	color: black;
	padding: 0 5px;
	background: transparent;
	border: none;
	outline: none;
	position: relative;
}

 .input-group input:focus ~label, .input-group input:valid ~label {
	top: -5px;
	transition: top 0.3s ease-in-out;
} 







.remember {
	margin: -5px 0 15px 5px;
}

.remember label {
	color: black;
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
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.05);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    background-color: FFE6EB;
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

.w-btn-outline.w-btn-indigo-outline{
	margin: 0 -40px;
	bottom: 70px;
	right: 10px;
	width: 120px;
	height: 30px;
	background: #22df64;
	color: white;	
	position: absolute;
	bottom: 30px;
	left: 245px;
	
	
}

</style>


</head>
<body>



	<!-- 로그인 -->
	<div class="wrapper">
		<div class="form-wrapper sign-in">
			<form name="LoginForm" method="post" action="${pageContext.request.contextPath}/user/userLogin">
				<h2>Sign In</h2>
				<div class="input-group">
					<input type="text" id="email" name="userId" required> <label
						for="">UserID</label>
				</div>
				
				<div class="input-group">
					<input type="password" name="userPw" required> 
					<label for="">Password</label>
				</div>
				
			<!-- 	<div class="remember">
					<label><input type="checkbox" id="remember">Remember me</label>
				</div> -->
				<button type="submit" id="loginBtn">Sign In</button>
				
				
				<div class="signUp-link">
					<div class="col-lg-12 text-center mt-3">
						<%-- <button type="button" id="kakaoBtn"
							onclick="location.href='${urlKakao}'">
							<img alt="카카오로그인"
								src="${pageContext.request.contextPath}/img/kakao_login_medium_wide.png">
						</button> --%>
						<br>
					</div>
					<p>
						Don't have an account? <a href="#" class="signUpBtn-link">Sign
							Up</a>
					</p>
				</div>
				<!-- <div class="social-platform">
                    <p>Or sign in with</p>
                    <div class="social-icons">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-google"></i></a>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                    </div>
                </div> -->
			</form>
		</div>


		<!-- 회원가입 -->
		<div class="form-wrapper sign-up">
			<form action="${pageContext.request.contextPath}/user/userJoin"
				method="post" name="joinForm">
				<h2>Sign Up</h2>
				<div class="input-group">
					<input type="text" name="userId" class="form-control" id="userId"
						required> 
					<label for="userId" id="idLabel">아이디</label>
					
				    <div class="input-group-addon">
						<button type="button" id="idCheckBtn" class="w-btn-outline w-btn-indigo-outline">아이디중복체크</button>
					</div> 
					<span id="msgId"></span>
				</div>


				<div class="input-group">
					<input type="text" name="userName" class="form-control"
						id="userName" required> <label for="name">이름</label>
				</div>



				<div class="input-group">
					<input type="text" name="userEmail1" class="form-control"
						id="userEmail1" required> <label for="email" id="emailLabel">이메일</label>
						
					<div class="input-group-addon">
						<button type="button" id="mail-check-btn" class="w-btn-outline w-btn-indigo-outline"
						class="btn btn-primary">이메일 인증</button>
					</div>
				</div>

	
	
				<div class="input-group">
					<div class="mail-check-box">
						<input type="text" class="form-control mail-check-input"
							maxlength="6" disabled="disabled" required> 
							<div><span id="mail-check-warn"></span></div>
							<label for="">이메일 인증번호</label>
					</div>
				</div>


				<div class="input-group">
					<input type="password" name="userPw" class="form-control"
						id="userPw" required>
						<label for="password">비밀번호</label>
						<div id="msgPw"></div> 
				</div>


				<div class="input-group">
					<input type="password" class="form-control" id="pwConfirm" required>
					<div id="msgPw-c"></div> <label for="password-confirm">비밀번호 인증</label>
				</div>


				<button type="button" id="JoinBtn">Sign Up</button>
				<div class="signUp-link">
					<p>
						Already have an account? <a href="#" class="signInBtn-link">Sign In</a>
					</p>
				</div>

			</form>
		</div>
	</div>




	<script>
	
	
		
	
		//login&Join 화면 전환
		const signUpBtnLink = document.querySelector('.signUpBtn-link');
		const signInBtnLink = document.querySelector('.signInBtn-link');
		const wrapper = document.querySelector('.wrapper');
	
		signUpBtnLink.addEventListener('click', () => {
		    wrapper.classList.toggle('active');
		});
	
		signInBtnLink.addEventListener('click', () => {
		    wrapper.classList.toggle('active');
		});	
	
    	
		
		
		
		let code = '';
		let idFlag, pwFlag;
		
		document.getElementById('idCheckBtn').onclick = function(){
			
			const userId = document.getElementById('userId').value;
			
			if(userId === ''){
				alert('아이디를 작성 해주세요.')
				return; 
			} if(!idFlag){
				alert('8자 이상 16자 이하의 영문 대문자, 소문자, 숫자만 가능합니다.');
				return;
			}
			
			
			
			
			const reqObj = {
					method: 'post',
					headers: {
						'Content-Type' : 'text/plain'
					},
					body: userId
			};
				
			
			fetch('${pageContext.request.contextPath}/user/idCheck', reqObj)
			
			.then(res => res.text()) 
			.then(data => { 
				
				if(data === 'ok'){
					document.getElementById('userId').setAttribute('readonly', true);
					document.getElementById('idCheckBtn').setAttribute('disabled', true);
					document.getElementById('msgId').textContent = '사용 가능한 아이디 입니다.';

					document.getElementById('msgId').style.color = 'green';

					const label = document.getElementById('idLabel');
					label.parentNode.removeChild(label);
				} else { 
					document.getElementById('msgId').textContent = '중복 된 아이디 입니다.';
					/* document.getElementById('msgId').style.color = 'red'; */
				}
			}); 
		
	} //아이디 중복 검사 끝
	
	
	
	//인증 번호를 이메일로 전송시켜보자
	document.getElementById('mail-check-btn').onclick = function(){
		const email = document.getElementById('userEmail1').value;  
	
		fetch('${pageContext.request.contextPath}/user/mailCheck?email=' + email) //겟방식
		.then(res => res.text()) 
			.then(data => { 
				console.log('인증번호: ' + data);
				
			
			//비활성된 인증번호의 입력창을 활성화
			document.querySelector('.mail-check-input').disabled = false;
			code = data; 
			alert('인증번호가 전송 되었습니다. 확인 후 입력란에 정확히 입력하세요');
			
			}); //비동기 끝.
			
	}; //인증번호 이벤트 끝.			
		
		
		
	//인증번호 검증
	document.querySelector('.mail-check-input').onblur = function(e){
		console.log('blur 이벤트 발생 확인!');
		
		//사용자가 입력한 인증 번호 가져오기.
		const inputCode = e.target.value;
		
		//위로가보면 span태그가 있다. 결과 메시지 남겨 줄 것이다.
		const $resultMsg = document.getElementById('mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.textContent = '인증번호가 일치합니다.';
			$resultMsg.style.color = 'green';
			//이메일 인증을 더 이상 못하게 버튼 비활성
			document.getElementById('mail-check-btn').disabled = true;
			document.getElementById('userEmail1').setAttribute('readonly', true);
			const label = document.getElementById('emailLabel');
			label.parentNode.removeChild(label);
			e.target.style.display = 'none'; //인증번호 입력창 숨기기
			
			/* const email2 = document.getElementById('userEmail2'); //요소취득
			email2.setAttribute('onFocus', 'this.initialSelect = this.selectedIndex'); //속성걸기
			
			//즉, 이벤트를 인라인방식으로 먹였는데. 사용자가 선택한 그 인덱스 값을 초기화 값으로 세팅 해주겟다 라는 뜻이다.
			email2.setAttribute('onChange', 'this.selectedIndex = this.initialSelect'); */
		} else {   //사용자가 인증번호가 틀렸다면
			$resultMsg.textContent = '인증번호를 입력을 제대로 해주세요';
			$resultMsg.style.color = 'brown';
			e.target.focus(); 
		}
		
	} //인증 번호 끝
		
		
	//폼 데이터 검증 (회원 가입 버튼을 눌렀을 때)
	document.getElementById('JoinBtn').onclick = function(){
    	
    	if(idFlag && pwFlag){ 
        	if(!document.getElementById('userId').getAttribute('readonly')){ 
        		alert('아이디 중복 체크를 해주세요!');
        		return; 
        	}
    	
        	if(document.getElementById('userPw').value !== document.getElementById('pwConfirm').value){ 
        		alert('비밀번호 확인란을 확인하세요!')
        		return
        	}
        	
        	if(document.getElementById('userName').value === ''){
        		alert('이름은 필수값입니다.');
        		return;
        	}

        	if(!document.getElementById('mail-check-btn').disabled){ 
        		alert('이메일 인증을 완료해 주세요.');
        		return;
        	}
        	
			if(confirm('회원 가입을 진행합니다.')){
				document.joinForm.submit();
			} else {
				return;
			}
        	
    	} else { 
    		alert('입력값을 다시 한 번 확인하세요!');
    	}
    	
    	
    	
    }
		
	/*8자 이상 16자 이하의 영문 대문자, 소문자, 숫자 및 '+' 기호로 이루어진 문자열에 일치합니다. 다른 문자가 포함되어 있거나 길이가 8자 미만 또는 16자 초과인 경우에는 일치하지 않습니다.*/
	/*아이디 형식 검사때는 4자이상 12자이하.*/
	
	/*아이디 형식 검사 스크립트*/
	var id = document.getElementById("userId");
	id.onkeyup = function() { 
		var regex = /^[A-Za-z0-9+]{4,12}$/; 
		if (regex.test(document.getElementById("userId").value)) { 
			document.getElementById("userId").style.borderColor = "green";

			document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";
			document.getElementById('msgId').style.color = 'brown';



			idFlag = true;
			
			
		} else {
			document.getElementById("userId").style.borderColor = "red";
			document.getElementById("msgId").innerHTML = "부적합한 아이디 입니다.";
			document.getElementById('msgId').style.color = 'brown';

			idFlag = false;
		}
	}
	
	
	/*비밀번호 형식 검사 스크립트*/
	var pw = document.getElementById("userPw");
	pw.onkeyup = function() {
		var regex = /^[A-Za-z0-9+]{8,16}$/;
		if (regex.test(document.getElementById("userPw").value)) {
			document.getElementById("userPw").style.borderColor = "green";
			document.getElementById("msgPw").innerHTML = "사용가능합니다";
			document.getElementById('msgPw').style.color = 'green';
	
			pwFlag = true;
		
		} else {
			document.getElementById("userPw").style.borderColor = "red";
			document.getElementById("msgPw").innerHTML = "불가능합니다.";
			document.getElementById('msgPw').style.color = 'brown';
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
			document.getElementById('msgPw-c').style.color = 'green';

		} else {
			document.getElementById("pwConfirm").style.borderColor = "red";
			document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
			document.getElementById('msgPw-c').style.color = 'brown';

		}
	}			
		
    	//회원 가입 완료 후 addFlashAttribute로 msg 데이터가 전달 되는 지 확인
    	const msg = '${msg}';
    	if(msg === 'joinSuccess') {
    		alert('회원 가입 정상 처리되었습니다.');
    	} 
    	
    	if(msg === 'loginFail') {
    		alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.');

    	}   

        
    </script>
</body>
</html>