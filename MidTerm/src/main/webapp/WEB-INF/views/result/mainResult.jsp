<%@page import="com.midterm.foodSNS.command.MRecipeVO"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<title>Bootstrap demo</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="${pageContext.request.contextPath}/css/mainResult.css" rel="stylesheet">
</head>

<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">

	</script>
	<div id="main-con">
		<div id="main-left">ddd</div>
		<div id="main">
			<%
			ArrayList<MRecipeVO> recipes = new ArrayList<>();
			recipes = (ArrayList<MRecipeVO>) request.getAttribute("recipe");
			for (int i = 0; i < recipes.size(); i++) {
				
			
			%>
			<div class="boxbox" data-bs-toggle="modal" data-bs-target="#myModal">
				<img class="titleimg" alt="결과이미지" data-userid="${login.userId}"
					data-cooknum=<%=recipes.get(i).getCooknum()%> src="<%=recipes.get(i).getTitleimg()%>">
			</div>
			<%
		}
		%>
		</div>

		<div id="main-right">ddd</div>




	</div>




	<nav class="navbar bg-success fixed-top ">
		<div class="container-fluid">
			<a class="navbar-brand text-light" href="#">Tasty Friend</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
				aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<aside>
						<div id="logo">
							<img src="" alt="">
						</div>
						<div id="profile-img-con">
							<img src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
								alt="default" id="profile-img">
						</div>
						<div class="profileWrapper">
							<div id="simpleProfile">
								<h1>${login.userId}</h1>
								<a href="${pageContext.request.contextPath}/user/userProfileModify"
									id="promodify">프로필수정</a>
								<h3>${login.userNick}</h3>
								<h5>${login.message}</h5>
							</div>
							<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
								<li class="nav-item"><a class="nav-link active" aria-current="page"
										href="${pageContext.request.contextPath}/">Home</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Follow
										Chief</a></li>
								<li class="nav-item"><a class="nav-link" href="#">Add
										My Recipe</a></li>
								<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/freeboard/regist">Add
										My Story</a></li>


								<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/mypage/mypageResult">마이페이지(임시)</a></li>

								<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"> Option </a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">회원정보수정</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><a class="dropdown-item" href="#">Logout</a></li>
									</ul>
							</ul>


						</div>


					</aside>
				</div>

			</div>
		</div>
	</nav>

</body>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-body">
				<div id="foodname"></div>
				<div class="modal-img">
					<img alt="" src="" id="titleimg">
				</div>
				<div id="ingredient"></div>
				<div id="tip"></div>
				<div class="modal-img">
					<img src="" id="img1">
				</div>
				<div id="text1"></div>
				<div class="modal-img">
					<img id="img2">
				</div>
				<div id="text2"></div>
				<div class="modal-img">
					<img id="img3">
				</div>
				<div id="text3"></div>
				<div class="modal-img">
					<img id="img4">
				</div>
				<div id="text1"></div>
			</div>
			<div class="modal-like">
				<div id="likenum"></div>
				<button type="button" id="likeBtn">좋아요</button>
			</div>
		</div>

</html>

<Script>
	document.getElementById('main').addEventListener('click', e => {

		if (e.target.matches('.boxbox img')) {
			const faNum = e.target.dataset.fanum;
			const userId = e.target.dataset.userid;
			const cooknum = e.target.dataset.cooknum;

			console.log(faNum);
			console.log(userId);
			console.log(cooknum);

			fetch('${pageContext.request.contextPath}/freeboard/getArticle/' + faNum)
				.then(res => res.json())
				.then(data => {
					console.log(data);
					document.getElementById('freeuserid').textContent = data.userId;
					document.getElementById('freecontent').textContent = data.content;
				});

			//레시피 상세정보 불러오기
			fetch('${pageContext.request.contextPath}/result/recipe/' + cooknum)
				.then(res => res.json())
				.then(recipe => {
					console.log(recipe);
					document.getElementById('foodname').textContent = recipe.foodname;
					document.getElementById('ingredient').textContent = recipe.ingredient;
					document.getElementById('tip').textContent = recipe.tip;
					document.getElementById('titleimg').setAttribute('src', recipe.titleimg);
					if (recipe.text1 !== '') {
						document.getElementById(`text1`).textContent = recipe.text1;
					}
					if (recipe.img1 !== '') {
						document.getElementById(`img1`).setAttribute('src', recipe.img1);
					}
					if (recipe.text2 !== '') {
						document.getElementById(`text2`).textContent = recipe.text2;
					}
					if (recipe.img2 !== '') {
						document.getElementById(`img2`).setAttribute('src', recipe.img2);
					}
					if (recipe.text3 !== '') {
						document.getElementById(`text3`).textContent = recipe.text3;
					}
					if (recipe.img3 !== '') {
						document.getElementById(`img3`).setAttribute('src', recipe.img3);
					}
					if (recipe.text4 !== '') {
						document.getElementById(`text4`).textContent = recipe.text4;
					}
					if (recipe.img4 !== '') {
						document.getElementById(`img4`).setAttribute('src', recipe.img4);
					}
					//좋아요
					getlike(cooknum);
					document.getElementById('likenum').dataset.cooknum = recipe.cooknum; //like에 레시피 번호 저장
				});
				

		} else {
			console.log('여기는 이벤트 대상이 아님');

			return;
		}

	});
	
	//좋아요 개수 불러오기
	function getlike(cooknum) {
		fetch('${pageContext.request.contextPath}/result/recipe/like/' + cooknum)
				.then(res => res.json())
				.then(like => {
					console.log(like);
					document.getElementById('likenum').textContent = '이 레시피를 ' +like + '명이 좋아합니다';
				});
	}
	//좋아요 버튼 클릭
	document.getElementById('likeBtn').addEventListener('click', e => {
		e.preventDefault();
		const cooknum = document.getElementById('likenum').dataset.cooknum;
		console.log(cooknum);
		const userId = '${login.userId}'
		console.log(userId);
		const reqObj = {
			method: 'put',
			headers: {
				'Content-Type' : 'application/json'
			},
			body: JSON.stringify({
				'userId' : userId
			})
		}
		fetch('${pageContext.request.contextPath}/result/recipe/like/' + cooknum, reqObj)
			.then(res => res.text())
			.then(data => {
				console.log(data);
				document.getElementById('likenum').textContent = data.likenum;
				getlike(cooknum);
			});
	});
	
</Script>