<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<!-- reset.css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

</head>
<style>
body {
	display: flex;
}

.wrapper {
	box-sizing: border-box;
	width: 80%;
	height: 100vh;
	border: 1px solid red;
}

.wrapper .header {
	box-sizing: border-box;
	width: 100%;
	height: 10vh;
	border: 1px solid black;
	position: relative;
	padding-left: 70px;
	padding-right: 70px;
}

.wrapper .resultWrapper {
	box-sizing: border-box;
	width: 100%;
	height: 90vh;
	border: 1px solid green;
	overflow: auto;
	display: flex;
	justify-content: space-evenly;
	flex-wrap: wrap;
	padding-top: 10px;
}

.result {
	box-sizing: border-box;
	display: block;
	width: 30%;
	height: 500px;
	border: 1px solid blue;
	margin-bottom: 20px;
}

aside {
	box-sizing: border-box;
	width: 20%;
	height: 100vh;
	border: 1px solid black;
}

#logo {
	box-sizing: border-box;
	width: 100%;
	height: 10vh;
	border: 1px solid green;
}

a {
	text-decoration: none;
	cursor: pointer;
}

.articleWrapper {
	box-sizing: border-box;
	width: 100%;
	height: 60vh;
	border: 1px solid red;
	overflow: auto;
}

.article {
	box-sizing: border-box;
	width: 100%;
	height: 20vh;
	border: 1px solid blue;
	margin-bottom: 10px;
}

.title {
	box-sizing: border-box;
	width: 70%;
	height: 10vh;
	border: 1px solid blue;
	line-height: 10vh;
}

#count {
	width: 100%;
	height: 20vh;
	border: 1px solid red;
	line-height: 20vh;
}
</style>


<body>
	<div class="wrapper">
		<div class="header">
			<div class="title">요리제목</div>
			<a href="${pageContext.request.contextPath}/user/userMypage">개인정보 수정</a>
		</div>
		<div id="modalWrapper" class="resultWrapper">
			<div class="result">
				<a>ddddd</a>
			</div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
			<div class="result"></div>
		</div>
	</div>

	<aside>
		<div id="logo">
			<img src="" alt="">
		</div>
		<div id="count"></div>
		<div class="articleWrapper"></div>
		<div id="menu"></div>
	</aside>


</body>


<!-- Modal -->
<div class="modal fade" id="replyModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
			</div>
			<div class="modal-body">
				...fhsdhdshdshdsh<br> ...fhsdhdshdshdsh<br>
				...fhsdhdshdshdsh<br> ...fhsdhdshdshdsh<br>
				...fhsdhdshdshdsh<br> ...fhsdhdshdshdsh<br>
				...fhsdhdshdshdsh<br> ...fhsdhdshdshdsh<br>
				...fhsdhdshdshdsh<br> ...fhsdhdshdshdsh<br>
				...fhsdhdshdshdsh<br> ...fhsdhdshdshdsh<br>
				...fhsdhdshdshdsh<br>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

</html>

<script>
	document.getElementById('modalWrapper').addEventListener('click', e => {
		e.preventDefault();
		if (!e.target.matches('a')){
			console.log("nono");return;
		}
		else{
			console.log("yes");
			$('#replyModal').modal('show');
		}
	});
</script>