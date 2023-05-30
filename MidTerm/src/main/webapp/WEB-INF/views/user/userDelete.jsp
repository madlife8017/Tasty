
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title>
	</head>
	
	<body>
		<section id="container">
			<form action="/user/userDelete" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="userId" value="${userInfo.userId}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="userPw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="userName" value="${userInfo.userName}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</section>
		<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "${pageContext.request.contextPath}/user/userMypage";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
		
	</body>
	
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>
</head>


<body>
	<section id="container">
		<form action="${pageContext.request.contextPath}/user/userDelete"
			method="POST" id="delForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label> <input
					class="form-control" type="text" id="userId" name="userId"
					value="${userInfo.userId}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label> <input
					class="form-control" type="password" id="userPass" name="userPw" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성명</label> <input
					class="form-control" type="text" id="userName" name="userName"
					value="${userInfo.userName}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="button" id="deleteBtn">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>


		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
	</section>

</body>


<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	

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
						$("#delForm").submit();
						
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


