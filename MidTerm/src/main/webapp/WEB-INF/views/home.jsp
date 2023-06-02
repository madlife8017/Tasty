<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>시작화면</title>

<!-- reset.css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

<link href="${pageContext.request.contextPath}/css/home.css"
	rel="stylesheet">
</head>





<body>
	<header>
		<c:if test="${login == null}">
			<div>
				<a href="${pageContext.request.contextPath}/user/userLogin">login</a>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/user/userJoin">Join</a>
			</div>

			<div><a href="${pageContext.request.contextPath}/result/getDB">DB가져오기</a></div>
			<div><a href="${pageContext.request.contextPath}/result/getWeather">날씨가져오기</a></div>

		</c:if>
		<c:if test="${login != null}">
			${login.userId}님 환영합니다!
			<div>
				<a href="${pageContext.request.contextPath}/user/userMypage">MyPage</a>
			</div>

		   <%--  <div>
			<a href="${pageContext.request.contextPath}/user/userLogout">Logout</a>
			</div>   --%>

		    <form action="${pageContext.request.contextPath}/user/userLogout" method="post">
				<button type="submit" id="logoutBtn">로그아웃</button>
			</form> 


		</c:if>






	</header>


	<div class="wrapper">
		<div class="title">Tasty Friends</div>
		<form action="${pageContext.request.contextPath}/result/mainResult"
			method="POST">
			<div class="selectWrapper">
				<select name="weather">
					<option value="날씨" selected>날씨</option>
					<option value="맑음">맑음</option>
					<option value="흐림">흐림</option>
					<option value="비">비</option>
					<option value="오늘의날씨">오늘의날씨</option>
				</select> <select name="condition">
					<option value="상태" selected>상태</option>
					<option value="보통">보통</option>
					<option value="다이어트중">다이어트중</option>
					<option value="술마시고싶어요">술마시고싶어요</option>

				</select> <select name="feeling">
					<option value="기분" selected>기분</option>
					<option value="신나요">신나요</option>
					<option value="우울해요">우울해요</option>
					<option value="피곤해요">피곤해요</option>
					<option value="특별한날">특별한날</option>
				</select>
			</div>
			<button type="submit">레시피 추천!</button>
		</form>
	</div>
	<footer> copyright © TastyFriends. all rights reserved </footer>
</body>

<script type="text/javascript">
	document.getElementById('logoutBtn').onclick = () => {
		alert('LOGOUT');
	}
</script>

</html>




