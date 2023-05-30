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
		<title>회원정보</title>
	</head>
	

	
	<body>
		<section id="container">
			<form action="/user/userDelete" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="userId" value="${userInfo.userId}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">이름</label>
					<input class="form-control" type="text" id="userName" name="userName" value="${userInfo.userName}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">휴대폰</label>
					<input class="form-control" type="text" id="userPhone1" name="userPone1" value="${userInfo.userPhone1}${userInfo.userPhone2}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">*우편번호</div>
				<input class="form-control input-sm" name="addrZipNum" id="addrZipNum" value="${userInfo.addrZipNum}" readonly="readonly">
				<div class="form-group has-feedback">*주소</div>
				<input class="form-control input-sm add" name="addrBasic" id="addrBasic" value="${userInfo.addrBasic}" readonly="readonly">
				<div class="form-group has-feedback">*상세주소</div>
				<input class="form-control input-sm add" name="addrDetail" id="addrDetail" value="${userInfo.addrDetail}" readonly="readonly">
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="updateBtn">수정</button>
					<button class="btn btn-success" type="button" id="deleteBtn">삭제</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
	<script type="text/javascript">
	
		document.getElementById('updateBtn').onclick = () => {
			location.href = "${pageContext.request.contextPath}/user/userUpdate";
		};
			
		document.getElementById('deleteBtn').addEventListener('click', e => {
			location.href = "${pageContext.request.contextPath}/user/userDelete";
		});
		
	</script>
	
</html>