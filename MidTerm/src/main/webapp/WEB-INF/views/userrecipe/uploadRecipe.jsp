<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">


<head>
	<meta charset="UTF-8">
	<title>레시피 등록</title>

<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
	</script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
	</script>

	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/uploadRecipe.css" rel="stylesheet">
</head>
<style>
	footer {
box-sizing: border-box;
width: 100vw;
height: 5vh;
/* footer의 높이 */
position: absolute;
bottom: 0;
left: 0;
text-align: center;
line-height: 5vh;
background: black;
color: white;
}

</style>

<body>

		<nav class="navbar bg-success fixed-top ">
			<div class="container-fluid">
				<a class="navbar-brand text-light" href="${pageContext.request.contextPath}/">Tasty Friends</a>


				<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
					aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header">
						<aside></aside>
					</div>

				</div>
			</div>
		</nav>

	<div class="container margin-top">
		<form action="${pageContext.request.contextPath}/userrecipe/uploadRecipe" method="post" name="uploadForm">
			<input type="hidden" name="writer" value="${login.userId}">

			<div class="form-group">
				<label for="title" class="title-style">제목</label> <input type="text" class="form-control" id="title"
					placeholder="제목을 입력하세요" name="title">
			</div>

			<select name="weather" class="form-select optionbox" aria-label="Default select example">
				<option value="날씨" disabled selected>날씨</option>
				<option value="맑음">맑음</option>
				<option value="흐림">흐림</option>
				<option value="비">비</option>
			</select> <select name="condition2" class="form-select optionbox" aria-label="Default select example">
				<option value="상태" disabled selected>상태</option>
				<option value="보통">보통</option>
				<option value="다이어트중">다이어트중</option>
				<option value="술마시고싶어요">술마시고싶어요</option>
			</select> <select name="feeling" class="form-select optionbox" aria-label="Default select example">
				<option value="기분" disabled selected>기분</option>
				<option value="신나요">신나요</option>
				<option value="우울해요">우울해요</option>
				<option value="피곤해요">피곤해요</option>
				<option value="특별한날">특별한날</option>
			</select>


			<div class="form-group">
				<label for="content" class="content-style">내용</label>
				<textarea class="form-control" rows="5" id="summernote" id="imageBoard" name="content"></textarea>
			</div>

			<button id="submitBtn" type="button">레시피 작성</button>
		</form>
	</div>
	<footer> copyright © TastyFriends. all rights reserved </footer>

	<script>
		$('#summernote').summernote({
			placeholder: '레시피 내용을 작성하세요',
			tabsize: 2,
			height: 400
		});
	</script>

</body>

</html>

<script type="text/javascript">
	document.getElementById('submitBtn').addEventListener('click', () => {
		if (document.getElementById('title').value === '') {
			alert('제목을 입력해 주세요!');
			return;
		}
		alert('레시피가 등록되었습니다.');
		document.uploadForm.submit();
	});
</script>