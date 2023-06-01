<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
	<style type="text/css">
	
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

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
    color: lightgray;
    padding: 0 5px;
    background: transparent;
    border: none;
    outline: none;
}

.input-group input:focus~label,
.input-group input:valid~label {
    top: -5px;
}

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

button {
    position: relative;
    width: 100%;
    height: 40px;
    background: white;
    font-size: 16px;
    color: #000;
    cursor: pointer;
    border-radius: 30px;
    border-color: rgb(208, 208, 208)
    /* outline: none; */
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
	
	</style>


</head>
<body>

<<<<<<< HEAD
<section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7 col-xs-10 login-form">
                    <div class="titlebox">
                        로그인
                    </div>
                   <form method="post" name="loginForm">
                        <div class="form-group"><!--사용자클래스선언-->
                            <label for="id">아이디</label>
                            <input type="text" name="userId" class="form-control" id="id" placeholder="아이디">
                         </div>
                         <div class="form-group"><!--사용자클래스선언-->
                            <label for="id">비밀번호</label>
                            <input type="password" name="userPw" class="form-control" id="pw" placeholder="비밀번호">
                         </div>
                         <div class="form-group">
                            <button type="button" id="loginBtn" class="btn btn-info btn-block">로그인</button>
                            <button type="button" id="joinBtn" class="btn btn-primary btn-block">회원가입</button>
                         </div>                                  
                    </form>                
=======
    <div class="wrapper">
        <div class="form-wrapper sign-in">
            <form action="${pageContext.request.contextPath}/user/login">
                <h2>Sign In</h2>
                <div class="input-group">
                    <input type="text" required>
                    <label for="">UserName</label>
>>>>>>> ee21e0a0e1331383d73a1f7667cf40f259e5f41c
                </div>
                <div class="input-group">
                    <input type="text" required>
                    <label for="">Password</label>
                </div>
                <div class="remember">
                    <label><input type="checkbox"> Remember me</label>
                </div>
                <button type="submit">Sign In</button>
                <div class="signUp-link">
                    <p>Don't have an account? <a href="#" class="signUpBtn-link">Sign Up</a></p>
                </div>
                <div class="social-platform">
                    <p>Or sign in with</p>
                    <div class="social-icons">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-google"></i></a>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                    </div>
                </div>
            </form>
        </div>

        <div class="form-wrapper sign-up">
            <form action="">
                <h2>Sign Up</h2>
                <div class="input-group">
                    <input type="text" required>
                    <label for="">UserName</label>
                </div>
                <div class="input-group">
                    <input type="email" required>
                    <label for="">Email</label>
                </div>
                <div class="input-group">
                    <input type="text" required>
                    <label for="">Password</label>
                </div>
                <div class="remember">
                    <label><input type="checkbox"> I agree to the terms & conditions</label>
                </div>
                <button type="submit">Sign Up</button>
                <div class="signUp-link">
                    <p>Already have an account? <a href="#" class="signInBtn-link">Sign In</a></p>
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
	
	
    	
    	//회원 가입 완료 후 addFlashAttribute로 msg 데이터가 전달 되는 지 확인
    	const msg = '${msg}';
    	if(msg === 'joinSuccess') {
    		alert('회원 가입 정상 처리되었습니다.');
    	} else if(msg === 'loginFail') {
    		alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인하세요.');
    	}
    	
    	//id, pw 입력란이 공백인 지 아닌지 확인한 후, 공백이 아니라면 submit을 진행하세요.
    	//요청 url은 /user/userLogin -> post로 갑니다. (비동기 아니에요!)
    	document.getElementById('loginBtn').onclick = () => {
            if(document.getElementById('id').value === '') {
                alert('아이디를 적어야 로그인을 하죠!');
                return;
            }
            if(document.getElementById('pw').value === '') {
                alert('비밀번호를 작성하세요!');
                return;
            }

            document.loginForm.submit();
        }

        document.getElementById('joinBtn').onclick = () => {
            location.href='${pageContext.request.contextPath}/user/userJoin';
        }
    	
    
    </script>
</body>
</html>