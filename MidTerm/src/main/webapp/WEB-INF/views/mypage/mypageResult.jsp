<%@page import="com.midterm.foodSNS.command.MfreeboardVO"%>
<%@page import="com.midterm.foodSNS.command.MusersVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardImgVO"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<title>Tasty Friends</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

	<link href="${pageContext.request.contextPath}/css/mypageResult.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">


	<style>
		@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Playfair:ital,wght@1,600&display=swap');

		/* .ml-auto {
	position: absolute;
	left: 960px;
	width: 250px;
	bottom: 1px;
}
 */
		.container-fluid {
			position: relative;
		}
	</style>





</head>

<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">

	</script>
	<div id="main-con">
		<%
		ArrayList<MfreeboardArticleVO> articles = new ArrayList<>();
		articles = (ArrayList<MfreeboardArticleVO>) request.getAttribute("article");

		ArrayList<MfreeboardImgVO> imgs = new ArrayList<>();
		imgs = (ArrayList<MfreeboardImgVO>) request.getAttribute("img");

		ArrayList<MfreeboardVO> recipes = new ArrayList<>();
		recipes = (ArrayList<MfreeboardVO>) request.getAttribute("recipe");
		%>
		<div id="main-left">
			<div class="left" id="mystory" data-alength="<%=articles.size()%>" data-rlength="${fn:length(recipe)}">My
				Story</div>
			<div class="left" id="myrecipe" data-alength="<%=articles.size()%>" data-rlength="${fn:length(recipe)}">My
				Recipe</div>


			<div id="random" class="shadow p-3 mb-5 bg-body rounded">

				<div id="ranCom">
					이런 <span class="strong">레시피</span> 는 어떠신가요?
				</div>

				<form action="${pageContext.request.contextPath}/userrecipe/search" id="ranform" method="POST">
					<img id="randomImg" class="scale" src="${random.titleimg}" alt="default" id="article-img"> <input
						type="hidden" name="query" value="${random.foodname}">
				</form>
				<div id="ranCondition">
					${random.weather} /${random.condition2}/${random.feeling} <br>
					상태일때 <span class="strong">추천</span>드려요!
				</div>
			</div>





		</div>



		<div id="main">
			<%
			for (int i = 0; i < articles.size(); i++) {
				ArrayList<MfreeboardImgVO> imgcon = new ArrayList<>();
				for (int j = 0; j < imgs.size(); j++) {

					if (articles.get(i).getFreeboardArticleNumber() == imgs.get(j).getFreeboardArticleNumber()) {
				imgcon.add(imgs.get(j));
			%>

			<div class="boxbox scale mystorybox" data-bs-toggle="modal" data-bs-target="#myModal">
				<img src="${pageContext.request.contextPath}/user/display/<%=imgcon.get(0).getFileLoca()%>
				/<%=imgcon.get(0).getFileName()%>" alt="default" id="article-img" data-userid="${login.userId}"
					data-fanum="<%=articles.get(i).getFreeboardArticleNumber()%>"
					data-content="<%=articles.get(i).getContent()%>">
			</div>

			<%
			break;
			}
			}
			%>

			<%
			}
			%>
			<c:forEach var="recipe" items="${recipe}">
				<div class="boxbox2 scale myrecipebox" data-bs-toggle="modal" data-bs-target="#recipe">
					<img src="${pageContext.request.contextPath}/css/TastyFriend.png" alt="default" id="article-img"
						data-reuserid="${recipe.writer}" data-rebno="${recipe.bno}" />
					<div id="rtitle" name="title">${recipe.title}</div>
					<div id="rcon" name="title">${recipe.content}</div>
					<div id="rweather" name="title" style="display: none">${recipe.weather}</div>
					<div id="rcondition" name="title" style="display: none">${recipe.condition2}</div>
					<div id="rfeeling" name="title" style="display: none">${recipe.feeling}</div>
					<div id="rWriter" name="title" style="display: none">${recipe.writer}</div>

				</div>
			</c:forEach>




		</div>
		<div id="main-right">
			<div id="profile-img-con" data-bs-toggle="modal" data-bs-target="#short">
				<img src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
					alt="default" id="profile-img" class="scale">
			</div>
			<div class="profileWrapper">
				<div id="simpleProfile">
					<h1>${login.userId}</h1>
					<a href="${pageContext.request.contextPath}/user/userProfileModify" id="promodify">수정</a>
					<h3>${login.userNick}</h3>
					<h5>${login.message}</h5>
				
					<hr>
				</div>
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item"><a class="nav-link active" aria-current="page"
							href="${pageContext.request.contextPath}/">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link active" aria-current="page"
							href="${pageContext.request.contextPath}/freeboard/shortRegist/${user.userId}">Shorts</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal"
							data-bs-target="#FollowerModal">Follower
							Chief</a></li>
					<li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal"
							data-bs-target="#FollowingModal">Following
							Chief</a></li>
					<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/userrecipe/uploadRecipe">Add
							My Recipe</a></li>
					<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/freeboard/regist">Add
							My Story</a></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Option </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/user/userUpdate">회원정보수정</a></li>
							<hr class="dropdown-divider">
					</li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/userLogout"
							style="color: red">Logout</a></li>
				</ul>


			</div>


		</div>



	</div>


	<nav class="navbar bg-success fixed-top ">
		<div class="container-fluid">
			<a class="navbar-brand text-light" href="${pageContext.request.contextPath}/">Tasty Friend</a>

			<div class="ml-auto">
				<form class="form-inline ml-auto" action="${pageContext.request.contextPath}/userrecipe/search"
					method="POST">
					<div class="input-group">
						<input type="text" class="form-control" name="query" placeholder="검색어를 입력하세요">
						<button type="submit" class="btn btn-outline-light">검색</button>
					</div>
				</form>
			</div>



			<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
				aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header"></div>

			</div>
		</div>
	</nav>


	<!-- Follower Modal -->
	<div class="modal fade" id="FollowerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Follower</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="fmodal-body" id="followerM">

					<c:forEach var="follower" items="${countFollower}">

						<div id="followerdiv">
							<img src="${pageContext.request.contextPath}/user/display/${follower.fileLoca}/${follower.fileName}"
								alt="default" id="fprofile-img"> <a
								href="${pageContext.request.contextPath}/mypage/userResult/${follower.userId}">${follower.userId}</a>&nbsp&nbsp<span>${follower.message}</span>
						</div>

					</c:forEach>



				</div>
			</div>
		</div>
	</div>





	<!-- Following Modal -->
	<div class="modal fade" id="FollowingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Following</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="fmodal-body" id="followingM">

					<c:forEach var="following" items="${countFollowing}">

						<div id="followerdiv">
							<img src="${pageContext.request.contextPath}/user/display/${following.fileLoca}/${following.fileName}"
								alt="default" id="fprofile-img"> <a
								href="${pageContext.request.contextPath}/mypage/userResult/${following.userId}">${following.userId}</a>&nbsp&nbsp<span>${following.message}</span>
						</div>

					</c:forEach>


				</div>
			</div>
		</div>
	</div>

	<!-- Modal uesrRecipe-->
	<div class="modal fade" id="recipe" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-body" id="userRecipe">
					<div id="urTitle">

						<!--유저레시피 제목오는곳-->
					</div>

					<div id="urWeather">
						<a class="urId"></a>
						<!--검색 조건오는곳-->
					</div>

					<div id="urContent">
						<!--유저레시피 내용오는곳-->

					</div>

					<div class="dropdown" id="dbtnR">
						<i class="bi bi-three-dots-vertical" style="font-size: 1.5rem" type="button"
							data-bs-toggle="dropdown" aria-expanded="false"></i>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" id="modifyR">Modify</a></li>
							<hr>
							<li><a class=" dropdown-item" id="deleteR" href="#" style="color: red">Delete</a></li>
						</ul>
					</div>




				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-body">
					<div class="modal-img">

						<div id="carouselExampleIndicators" class="carousel slide carousel-dark" data-bs-ride="true">
							<div class="carousel-indicators" id="carouselbtn">

								<!--여기 게시물별 버튼 들어감-->
							</div>

							<div class="carousel-inner" id="carouselinput">
								<!--여기 게시물별 이미지 들어감-->
							</div>

							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>


						</div>

					</div>
					<div class="modal-text">
						<div id="freeuserimg">
							<img src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}"
								alt="default" id="profile-img2">

							<div id="freeuserid"></div>
							<div class="dropdown" id="dbtn">

								<i class="bi bi-three-dots-vertical" style="font-size: 1.5rem" type="button"
									data-bs-toggle="dropdown" aria-expanded="false"></i>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" id="modify" href="#"">Modify</a></li>
								<hr>
								<li><a class=" dropdown-item" id="delete" href="#" style="color: red">Delete</a></li>
								</ul>
							</div>


						</div>
						<div id="freecontent"></div>
						<div class="modibox">
							<textarea id="modifyTextBox" class="shadow p-3 bg-body rounded">
							</textarea>
							<button id="modifyTextbtn" type="button" class="btn btn-success">Modify</button>
						</div>
						<div class="likeBox">
							<div class="placement">
								<div class="heart" id="likeBtn"></div>
							</div>
							<div id="likenum"></div>
						</div>

						<div class="replyBox">


							<!-- 댓글 영역 시작부분 -->
							<section>
								<div class="container" id="aaa">
									<div class="row" id="rebox">
										<div class="col-xs-12 col-md-9 write-wrap" id="rrr">
											<!-- 댓글 영역 -->
											<form class="reply-wrap" action="${pageContext.request.contextPath}">
												<div class="reply-image">
													<img id="replyImg"
														src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}">
													${login.userNick}
												</div>

												<div class="reply-content">
													<textarea class="form-control" rows="3" id="reply"
														name="reply"></textarea>
													<div class="reply-group">
														<div class="reply-input">
															<div class="reply-nick">${login.userNick}</div>
															<input type="hidden" class="form-control" id="replyId"
																placeholder="${login.userId}">
														</div>

														<button type="button" id="replyRegist"
															class="right btn btn-info">등록하기</button>
													</div>
												</div>
											</form>
											<div id="replyList"></div>
											<button type="button" class="form-control" id="moreList"
												style="display: none;">더보기</button>
										</div>
									</div>
								</div>
							</section>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Short Modal -->
	<div class="modal fade" id="short" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog  ">
			<div class="modal-content">
				<div id="shortIntro">
					${user.userNick} 님의 하루 요리기록!
				</div>
				<div class="modal-body" id="shortBody">

				</div>
			</div>
		</div>

	</div>


	<footer> copyright © TastyFriends. all rights reserved </footer>

</body>












<script>
document.getElementById('randomImg').onclick = () => {
    document.getElementById('ranform').submit();
}


	let shortVideo = '';
	let shortVbtn = '';
	document.getElementById('profile-img-con').addEventListener('click', e => {
		const userId = '${user.userId}';
		console.log(userId + "클릭했다!!!");
		

		fetch('${pageContext.request.contextPath}/freeboard/shortGet/' + userId).then(res => res.json())
			.then(data => {

				console.log("성공??");
				console.log(data.length);

				while (document.getElementById('shortBody').firstChild) {
					document.getElementById('shortBody').firstChild.remove();
				}
				// while (document.getElementById('shortCon').firstChild) {
				// 	document.getElementById('shortCon').firstChild.remove();

				// }

				if(data.length==0){
					 shortVideo += `오늘 등록된 쇼츠가 없습니다!`;
					 document.getElementById('shortBody').insertAdjacentHTML('afterbegin', shortVideo);

				}else{
				shortVideo += `<video id="shoVid" src="${pageContext.request.contextPath}/user/display/` +
					data[0].fileLoca + `/` + data[0].fileName + `" type="video/mp4" autoplay loop
							 		style="height: 80vh; width: 100%;"></video>`;

				// for (var i = 0; i < data.length; i++) {

				// if (i === 0) {
				// 	shortVideo += `<div class="carousel-item active"><video id="shoVid" src="${pageContext.request.contextPath}/user/display/` + data[i].fileLoca + `/` + data[i].fileName + `" type="video/mp4" autoplay loop
				// 		style="height: 80vh; width: 100%;"></video></div>`;

				// 		shortVbtn += `<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="` + i + `" class="active" aria-current="true"
				// 	aria-label="Slide ` + (i + 1) + `"></button>`;



				// } else {
				// 	shortVideo += `<div class="carousel-item"><video src="${pageContext.request.contextPath}/user/display/` + data[i].fileLoca + `/` + data[i].fileName + `" type="video/mp4"  autoplay style="height: 80vh; width: 100%;"></video></div>`;

				// 	shortVbtn += `<button type="button" data-bs-target="#carouselExampleIndicators" 
				// 	data-bs-slide-to="` + i + `" class="active" aria-current="true" 
				// 	aria-label="Slide ` + (i + 1) + `"></button>`;
				// }

				document.getElementById('shortBody').insertAdjacentHTML('afterbegin', shortVideo);
				// document.getElementById('shortBtn').insertAdjacentHTML('afterbegin', shortVbtn);


				// }
				}

			});
		const shortModal = document.getElementById('short')

		shortModal.addEventListener('hidden.bs.modal', () => {
			console.log("모달닫힘");

			location.reload();
		})

	});

	(function recipbox() {
		const recipebox = document.querySelectorAll('.myrecipebox');

		for (var i = 0; i < recipebox.length; i++) {
			const recipebox = document.querySelectorAll('.myrecipebox');
			recipebox[i].style.display = "none";
		}
	})();

	let strimg = '';
	let strbtn = '';
	let strmodi = '';
	let rtitle = '';
	let rcon = '';

	document.getElementById('main-left').addEventListener('click', e => {
		console.log("left click");

		if (e.target.matches('#mystory')) {
			const alength = e.target.dataset.alength;
			const rlength = e.target.dataset.rlength;


			console.log("story 클릭");


			for (var i = 0; i < alength; i++) {
				const storybox = document.querySelectorAll('.mystorybox');
				storybox[i].style.display = "block";
			}
			for (var i = 0; i < rlength; i++) {
				const recipebox = document.querySelectorAll('.myrecipebox');

				recipebox[i].style.display = "none";
			}

		}


		if (e.target.matches('#myrecipe')) {
			const alength = e.target.dataset.alength;
			const rlength = e.target.dataset.rlength;

			console.log("recipe 클릭");



			for (var i = 0; i < alength; i++) {
				const storybox = document.querySelectorAll('.mystorybox');
				storybox[i].style.display = "none";
			}



			for (var i = 0; i < rlength; i++) {
				const recipebox = document.querySelectorAll('.myrecipebox');

				recipebox[i].style.display = "block";
			}
		}



	});

	document.getElementById('main').addEventListener('click', e => {
		if (e.target.matches('.boxbox2 img')) {


			const bno = e.target.dataset.rebno;


			document.getElementById('modifyR').setAttribute("href",
				"${pageContext.request.contextPath}/userrecipe//modifyRecipe/" + bno);

			document.getElementById('urTitle').insertAdjacentHTML('afterbegin', e.target
				.nextElementSibling
				.textContent);
			document.getElementById('urContent').insertAdjacentHTML('afterbegin', e.target
				.nextElementSibling
				.nextElementSibling.innerHTML);
			document.getElementById('urWeather').insertAdjacentHTML('afterbegin', e.target
				.nextElementSibling
				.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling
				.textContent);
			document.getElementById('urWeather').insertAdjacentHTML('afterbegin', e.target
				.nextElementSibling
				.nextElementSibling.nextElementSibling.nextElementSibling.textContent + ' / ');
			document.getElementById('urWeather').insertAdjacentHTML('afterbegin', e.target
				.nextElementSibling
				.nextElementSibling.nextElementSibling.textContent + ' / ');
			document.querySelector(".urId").insertAdjacentHTML('afterbegin',
				'/작성자 : ' + e.target
				.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling
				.nextElementSibling.nextElementSibling.textContent);
			document.querySelector(".urId").setAttribute("href",
				"${pageContext.request.contextPath}/mypage/userResult/" + e.target
				.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling
				.nextElementSibling.nextElementSibling.textContent);

			document.getElementById("recipe").addEventListener('hidden.bs.modal', () => {
				document.getElementById('urTitle').textContent = "";
				document.getElementById('urContent').innerHTML = "";
				document.getElementById('urWeather').textContent = "";

				document.getElementById('urWeather').append(document.createElement('a'));
				document.querySelector('#urWeather a').classList.add('urId');

			});




			document.getElementById('deleteR').addEventListener('click', e => {
				if (confirm("정말 삭제하시겠습니까?")) {

					fetch('${pageContext.request.contextPath}/userrecipe/deleteR/' + bno, {
						method: 'delete'
					}).then(res => {
						if (res.status == 200) {
							document.getElementById('main').replaceChildren;
							location.reload();
						} else {
							alert(res.status);
						}
					});

				} else {
					return;
				}

			});




		}



		if (e.target.matches('.boxbox img')) {

			const userId = e.target.dataset.userid;
			const content = e.target.dataset.content;
			const faNum = e.target.dataset.fanum;

			console.log(faNum);
			console.log(userId);

			strbtn = '';
			strimg = '';
			strmodi = '';

			getlike(faNum); //좋아요 불러오기
			document.getElementById('likenum').dataset.faNum = faNum; //like에 게시글 번호 저장
			document.getElementById('replyRegist').dataset.faNum = faNum; //댓글등록에 게시글 번호 저장
			getList(1, true); //댓글 불러오기

			fetch('${pageContext.request.contextPath}/freeboard/getArticle/' + faNum)
				.then(res => res.json())
				.then(data => {
					console.log(data);
					document.getElementById('freeuserid').textContent = data.userId;
					document.getElementById('freecontent').textContent = data.content;
				});

			const $carousel = document.getElementById('carouselExampleIndicators');
			fetch('${pageContext.request.contextPath}/freeboard/getCarousel/' + faNum)
				.then(res => res.json())
				.then(data => {

					const imglength = data.length;

					while (document.getElementById('carouselbtn').firstChild) {
						document.getElementById('carouselbtn').firstChild.remove();
					}
					while (document.getElementById('carouselinput').firstChild) {
						document.getElementById('carouselinput').firstChild.remove();
					}

					// while (document.getElementById('modibtn').firstChild) {
					// 	document.getElementById('modibtn').firstChild.remove();
					// }

					for (var i = 0; i < imglength; i++) {

						if (i === 0) {
							strimg += `						
							<div class="carousel-item active">
								<img src="${pageContext.request.contextPath}/user/display/` + data[i].fileLoca + `/` + data[i].fileName + `"
									class="d-block w-100 simg" alt="smig"></div>`;

							strbtn += `
							<button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="` + i + `" class="active" aria-current="true"
                        aria-label="Slide ` + (i + 1) + `"></button>`;



						} else {
							strimg += `						
							<div class="carousel-item ">
								<img src="${pageContext.request.contextPath}/user/display/` + data[i].fileLoca + `/` + data[i].fileName + `"
									class="d-block w-100 simg" alt="smig">
							</div>`;

							strbtn += `
							<button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="` + i + `" class="active" aria-current="true"
                        aria-label="Slide ` + (i + 1) + `"></button>`;
						}


					}

					// strmodi +=
					// 	` <li><a class="dropdown-item" id ="modify" href="${pageContext.request.contextPath}/freeboard/modify/` +
					// 	faNum + `" >Modify</a></li>`;
					document.getElementById('carouselinput').insertAdjacentHTML('afterbegin', strimg);
					document.getElementById('carouselbtn').insertAdjacentHTML('afterbegin', strbtn);
					// document.getElementById('modibtn').insertAdjacentHTML('afterbegin', strmodi);



				});
			document.getElementById('modify').addEventListener('click', e => {

				document.getElementById('freecontent').style.display = "none";
				document.querySelector('.modibox').style.display = "block";
				document.getElementById('modifyTextBox').textContent = content;
			});

			document.getElementById('modifyTextbtn').addEventListener('click', e => {
				const moditext = document.querySelector('.modibox textarea').value;
				console.log("버튼누루고나서 번호:" + faNum);
				console.log("버튼누루고나서 글:" + moditext);


				const reqObj = {
					method: 'put',
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify({
						"moditext": moditext

					})

				};

				fetch('${pageContext.request.contextPath}/freeboard/modify/' + faNum, reqObj)
					.then(res => {
						console.log('왜 여러번 눌림?');
						document.querySelector('.modibox').style.display = "none";
						document.getElementById('freecontent').textContent = moditext;
						document.getElementById('freecontent').style.display = "block";

					})
			});

			const myModal = document.getElementById('myModal')

			myModal.addEventListener('hidden.bs.modal', () => {
				console.log("모달닫힘");

				location.reload();
			})


			document.getElementById('delete').addEventListener('click', e => {
				if (confirm("정말 삭제하시겠습니까?")) {
					console.log(faNum);
					fetch('${pageContext.request.contextPath}/freeboard/delete/' + faNum, {
						method: 'delete'
					}).then(res => {
						if (res.status == 200) {
							document.getElementById('main').replaceChildren;
							location.reload();
						} else {
							alert(res.status);
						}
					});

				} else {
					return;
				}

			});


		} else {


			return;
		}

	});

	//좋아요 개수 불러오기
	function getlike(faNum) {
		fetch('${pageContext.request.contextPath}/like/faNum/' + faNum)
			.then(res => res.json())
			.then(like => {
				console.log(like);
				document.getElementById('likenum').textContent = '이 게시글을 ' + like + '명이 좋아합니다.';
			});
	}
	//좋아요 버튼 클릭
	document.getElementById('likeBtn').addEventListener('click', e => {
		e.preventDefault();
		const faNum = document.getElementById('likenum').dataset.faNum;
		console.log(faNum);

		const reqObj = {
			method: 'put',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				'userId': '${login.userId}'
			})
		}
		fetch('${pageContext.request.contextPath}/like/faNum/' + faNum, reqObj)
			.then(res => res.json())
			.then(data => {
				console.log(data);
				console.log(data.likenum);
				document.getElementById('likenum').textContent = data.likenum;
				console.log(data.userId);
				if (data.userId == 0) { //좋아요 클릭 하지 않은 상태일때
					document.querySelector('.heart').classList.add("is-active");
				} else {
					document.querySelector('.heart').classList.remove("is-active");
				}
				getlike(faNum);
			});
	});

	//댓글 등록 이벤트
	document.getElementById('replyRegist').onclick = function (e) {
		const reply = document.getElementById('reply').value;
		const faNum = e.target.dataset.faNum;
		if (reply === '') {
			alert('내용을 입력하세요!');
			return;
		}

		//요청에 관련된 정보 객체
		const reqObj = {
			method: 'post',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ //제이슨 형태로 변환
				'faNum': faNum,
				'reply': reply,
				'userId': '${login.userId}',
				'userNick': '${login.userNick}',
				'fileLoca': '${login.fileLoca}',
				'fileName': '${login.fileName}',
				'uploadPath': '${login.uploadPath}',
				'fileRealName': '${login.fileRealName}' //작성자를 보여주기 위해 보내줌
			})
		};

		fetch('${pageContext.request.contextPath}/reply/regist', reqObj)
			.then(res => res.text())
			.then(data => {
				console.log('통신 성공!: ' + data);
				if (data === 'ok') {
					alert('댓글이 등록되었습니다.');
				} else {
					alert('댓글등록 실패');
				}
				document.getElementById('reply').value = ''; //내용 비우기
				//등록 완료 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.
				getList(1, true); //재 랜더링 false시 누적해서 가져오기
			});
	} // 댓글 등록 이벤트 끝.

	//더보기 버튼 처리(클릭 시 전역 변수 page에 +1 한 값을 요청)
	document.getElementById('moreList').onclick = () => {
		getList(++page, false);
	}


	let page = 1; //첫 페이지 번호
	let strAdd = ''; //댓글리스트에서 추가될 요소
	const $replyList = document.getElementById('replyList');

	//댓글 목록을 가져올 함수
	function getList(pageNum, reset) {
		strAdd = '';
		const faNum = document.getElementById('likenum').dataset.faNum;

		//get방식으로 댓글 목록을 요청(비동기)
		fetch('${pageContext.request.contextPath}/reply/getList/faNum/' + faNum + '/' + pageNum)
			.then(res => res.json())
			.then(data => {
				console.log(data);

				let total = data.total; //총 댓글 수
				let replyList = data.list; //댓글 리스트



				//insert, update, delete 작업 후에는
				//댓글 내용 태그를 누적하고 있는 strAdd 변수를 초기화해서
				//마치 화면이 리셋된 것처럼 보여줘야 합니다.
				if (reset) {

					while ($replyList.firstChild) {
						$replyList.removeChild($replyList.firstChild);
					}
					page = 1;
				}

				//응답 데이터의 길이가 0과 같거나 더 작으면 함수를 종료.
				console.log('리스트 길이: ' + replyList.length);
				if (replyList.length <= 0) return;

				//페이지번호 * 이번 요청으로 받은 댓글 수보다 전체 댓글 개수가 작다면 더보기 버튼은 없어도 된다.
				console.log('현재 페이지: ' + page);
				if (total <= page * 5) {
					document.getElementById('moreList').style.display = 'none';
				} else {
					document.getElementById('moreList').style.display = 'block';
				}

				//replyList의 개수만큼 태그를 문자열 형태로 직접 그림.
				//중간에 들어갈 글쓴이, 날짜 , 댓글 내용은 목록에서 꺼내서 표현.
				for (let i = 0; i < replyList.length; i++) {
					console.log("deeeeeeeee: " + replyList[0].fileLoca);

					strAdd +=
						`<div class='reply-wrap'>
	                            
	                            <div class='reply-content'>
	                                <div class='reply-group'>
										<img src='${pageContext.request.contextPath}/user/display/` + replyList[i].fileLoca + `/` + replyList[i]
						.fileName + `'>
	                                    <strong class='left'>` + replyList[i].userNick + `</strong> 
	                                    <small class='left'>` + (replyList[i].updateDate != null ? parseTime(replyList[i]
							.updateDate) + '(수정됨)' : parseTime(replyList[i].replyDate)) + `</small>
	                                    <a href='` + replyList[i].rno + `' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a> &nbsp
	                                    <a href='` + replyList[i].rno + `' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>   
										<div id="hiddenMan" style = 'opacity:0'>` + replyList[i].userId + `</div>
										                                	
	                                </div>
									<p class='clearfix'>` + replyList[i].reply + `</p> 
	                                <form class='reply-modify' style='display:none'>
										<input type="text" class='modtext' '>
										<a href="" class="right modModBtn">수정하기</a>
									</form>	
	                            </div>
	                        </div>`;
				}

				//id가 replyList라는 div 영역에 문자열 형식으로 모든 댓글을 추가.
				document.getElementById('replyList').insertAdjacentHTML('beforeend', strAdd);

			});

	} // end getList();

	//수정 삭제 이벤트
	document.getElementById('replyList').addEventListener('click', e => {
		e.preventDefault(); //테그의 고유 기능을 중지.

		//1. 이벤트가 발생한 target이 a태그가 아니라면 이벤트 종료.
		if (!e.target.matches('a')) {
			return;
		}



		//2. 모달 창 하나를 이용해서 상황에 따라 수정 / 삭제 모달을 구분하기 위해
		//조건문을 작성. (모달 하나로 수정, 삭제를 처리. 그러기 위해 디자인 조정.)
		//3. a태그가 두 개(수정, 삭제)이므로 어떤 링크인지를 확인.
		//댓글이 여러 개 -> 수정, 삭제가 발생하는 댓글이 몇 번인지도 확인 
		if (e.target.classList.contains('replyModify')) {
			const rno = e.target.getAttribute('href');
			console.log('댓글 번호: ' + rno);


			const content = e.target.parentNode.nextElementSibling.textContent;
			console.log('댓글 내용: ' + content);
			//수정 버튼을 눌렀을 때
			const userId = e.target.nextElementSibling.textContent;
			console.log('userId: ' + userId);
			if ('${login.userId}' !== userId) {
				alert('권한이 없습니다.');
				return;
			}
			e.target.parentNode.nextElementSibling.style.display = 'none'; //원래 댓글 내용 안보이게
			e.target.parentNode.nextElementSibling.nextElementSibling.style.display =
				'block'; //수정창 hidden을 text로 보이게
			e.target.parentNode.nextElementSibling.nextElementSibling.dataset.rno = e.target.getAttribute(
				'href'); //rno값을 form태그에 저장
		} else if (e.target.classList.contains('replyDelete')) {
			//삭제버튼 눌렀을 때
			const userId = e.target.nextElementSibling.nextElementSibling.textContent;
			console.log('userId: ' + userId);
			const rno = e.target.getAttribute('href');
			console.log('댓글 번호: ' + rno);

			if ('${login.userId}' !== userId) {
				alert('권한이 없습니다.');
				return;
			}
			if (!confirm('정말 삭제하시겠습니까?')) {
				return;
			}
			const reqObj = {
				method: 'delete',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({ //제이슨 형태로 변환
					'userId': userId
				})
			};

			fetch('${pageContext.request.contextPath}/reply/recipe/' + rno, reqObj)
				.then(res => res.text())
				.then(data => {
					console.log('data' + data);
					getList(1, true);
				})

		} //end delete event

		//수정 처리 함수. (수정 모달을 열어서 수정 내용을 작성 후 수정 버튼을 클릭했을 때)

		if (e.target.classList.contains('modModBtn')) {
			console.log(e.target.previousElementSibling);
			const reply = e.target.previousElementSibling.value;
			const rno = e.target.parentNode.dataset.rno;


			if (reply === '') {
				alert('내용을 확인하세요!');
				return;
			}

			//요청에 관련된 정보 객체
			const reqObj = {
				method: 'put',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({ //제이슨 형태로 변환
					'reply': reply
				})
			};

			fetch('${pageContext.request.contextPath}/reply/recipe/' + rno, reqObj)
				.then(res => res.text())
				.then(data => {
					alert('정상 수정 되었습니다');
					getList(1, true);
				});
		} //end update event


	}); //수정 or 삭제 버튼 클릭 이벤트 끝.



	//댓글 날짜 변환 함수
	function parseTime(regDateTime) {
		let year, month, day, hour, minute, second;
		if (regDateTime.length === 5) {
			[year, month, day, hour, minute] = regDateTime;
			second = 0;
		} else {
			[year, month, day, hour, minute, second] = regDateTime;
		}
		//원하는 날짜로 객체를 생성
		const regTime = new Date(year, month - 1, day, hour, minute, second);
		//console.log(regTime);
		const date = new Date();
		//console.log(date);
		const gap = date.getTime() - regTime.getTime();

		let time;
		if (gap < 60 * 60 * 24 * 1000) {
			if (gap < 60 * 60 * 1000) {
				time = '방금 전';
			} else {
				time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
			}
		} else if (gap < 60 * 60 * 24 * 30 * 1000) {
			time = parseInt(gap / (1000 * 60 * 60 * 24)) + '일 전';
		} else {
			time = `${regTime.getFullYear()}년 ${regTime.getMonth()}월 ${regTime.getDate()}일`;
		}

		return time;
	}
	
	
	// let simpleProfile = document.querySelector('simpleProfile');

	// simpleProfile.addEventListener('click', e => {
	// 	for(i=0; i<simpleProfile.length; i++) {
	// 		e.style.color = 'green';

	// 	}
	// })
	
	
	
</script>