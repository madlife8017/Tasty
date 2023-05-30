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
			<form action="${pageContext.request.contextPath}/user/userUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="userId" value="${userInfo.userId}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="userPw" />
					<span id="msgPw"></span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">패스워드확인</label>
					<input class="form-control" type="password" id="pwConfirm" />
					<span id="msgPw-c"></span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">이름</label>
					<input class="form-control" type="text" id="userName" name="userName" value="${userInfo.userName}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">휴대폰</label>
					<select class="form-control input-sm sel" name="userPhone1">
					<option ${userInfo.userPhone1=='010' ? 'selected' : '' }>010</option>
					<option ${userInfo.userPhone1=='011' ? 'selected' : '' }>011</option>
					<option ${userInfo.userPhone1=='017' ? 'selected' : '' }>017</option>
					<option ${userInfo.userPhone1=='018' ? 'selected' : '' }>018</option>
				</select> 
				</div>
				
				<input class="form-control input-sm" name="userPhone2" value="${userInfo.userPhone2}">
				<div class="form-group has-feedback">*우편번호</div>
				<input class="form-control input-sm" name="addrZipNum" id="addrZipNum" value="${userInfo.addrZipNum}" readonly>
				<button type="button" class="btn btn-primary" onclick="searchAddress()">주소찾기</button>
				<div class="form-group has-feedback">*주소</div>
				<input class="form-control input-sm add" name="addrBasic" id="addrBasic" value="${userInfo.addrBasic}">
				<div class="form-group has-feedback">*상세주소</div>
				<input class="form-control input-sm add" name="addrDetail" id="addrDetail" value="${userInfo.addrDetail}">
				<div class="form-group has-feedback">

					<button class="btn btn-success" type="submit" id="submit">수정</button>
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
	
	<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

		//취소 버튼
		document.querySelector('.cencle').addEventListener('click' ,() => {
			location.href = "${pageContext.request.contextPath}/user/userMypage"
		});

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