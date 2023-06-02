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
								<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath}/freeboard/uploadRecipe">Add
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
<!-- 댓글 영역 -->
			<form class="reply-wrap" action="${pageContext.request.contextPath}">
				<div class="reply-image">
					<img src="${pageContext.request.contextPath}/user/display/${login.fileLoca}/${login.fileName}">
				</div>

				<div class="reply-content">
					<textarea class="form-control" rows="3" id="reply" name="reply"></textarea>
					<div class="reply-group">
						<div class="reply-input">
							<div class="reply-nick">${login.userNick}</div>
							<input type="hidden" class="form-control" id="replyId" placeholder="${login.userId}">
						</div>

						<button type="button" id="replyRegist" class="right btn btn-info">등록하기</button>
					</div>
				</div>
			</form>
			<div id="replyList">
				<!-- 자바스크립트 단에서 반복문을 이용해서 댓글의 개수만큼 반복 표현.
				<div class='reply-wrap'>
					<div class='reply-image'>
						<img src='../resources/img/profile.png'>
					</div>
					<div class='reply-content'>
						<div class='reply-group'>
							<strong class='left'>honggildong</strong>
							<small class='left'>2019/12/10</small>
							<a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
							<a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
						</div>
						<p class='clearfix'>여기는 댓글영역</p>
					</div>
				</div>
				 -->
			</div>
			<button type="button" class="form-control" id="moreList" style="display: none;">더보기</button>
		</div>
	
	<div id="contentDiv">

		<!-- 비동기 방식으로 서버와 통신을 진행한 후
							목록을 만들어서 붙일 예정.-->

	</div>

</body>

<script type="text/javascript">
	//리스트 작업
	let str = '';
	let page = 1;
	let isFinish = false;

	const $contentDiv = document.getElementById('contentDiv');
	getList(1, true);

	function getList(page, reset) {
		str = '';
		console.log('page: ' + page);
		console.log('reset: ' + reset);

		fetch('${pageContext.request.contextPath}/freeboard/recipeList/' + page)
			.then(res => res.json())
			.then(list => {
				console.log(list);
				console.log(list.length);
				if (list.length === 0) isFinish = true;

				if (reset) {
					while ($contentDiv.firstChild) {
						$contentDiv.firstChild.remove();
					}
					page = 1;
				}

				for (vo of list) {
					str +=
						`
				<div class="title">
//					<p>` + vo.writer + `</p>
//					<small>` + vo.regDate + `</small> &nbsp;&nbsp;
				</div>
			</div>
			<div class="content-inner">
				<!--내용영역-->
				<p>` + vo.content + `</p>
			</div>
			`;
				}
				if (!reset) {
					document.getElementById('contentDiv').insertAdjacentHTML('beforeend', str);
				} else {
					document.getElementById('contentDiv').insertAdjacentHTML('afterbegin', str);
				}
			}) //end fetch
	} //end getList()
			
		</div>
		</div>
		</div>

</html>

<Script>
	document.getElementById('main').addEventListener('click', e => {

		if (e.target.matches('.boxbox img')) {
			const userId = e.target.dataset.userid;
			const cooknum = e.target.dataset.cooknum;

			console.log(userId);
			console.log(cooknum);


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

					getlike(cooknum); //좋아요 불러오기
					document.getElementById('likenum').dataset.cooknum = recipe.cooknum; //like에 레시피 번호 저장
					document.getElementById('replyRegist').dataset.cooknum = recipe.cooknum; //댓글등록에 레시피 번호 저장
					getList(1, true); //댓글 불러오기
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
				document.getElementById('likenum').textContent = '이 레시피를 ' + like + '명이 좋아합니다';
			});
	}
	//좋아요 버튼 클릭
	document.getElementById('likeBtn').addEventListener('click', e => {
		e.preventDefault();
		const cooknum = document.getElementById('likenum').dataset.cooknum;
		console.log(cooknum);

		const reqObj = {
			method: 'put',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				'userId': '${login.userId}'
			})
		}
		fetch('${pageContext.request.contextPath}/result/recipe/like/' + cooknum, reqObj)
			.then(res => res.json())
			.then(data => {
				console.log(data);
				console.log(data.likenum);
				document.getElementById('likenum').textContent = data.likenum;
				console.log(data.userId);
				if (data.userId == 0) { //좋아요 클릭 하지 않은 상태일때
					document.getElementById('likeBtn').style.backgroundColor = 'blue';
				} else {
					document.getElementById('likeBtn').style.backgroundColor = '#fff';
				}
				getlike(cooknum);
			});
	});

	//댓글 등록 이벤트
	document.getElementById('replyRegist').onclick = function (e) {
		const reply = document.getElementById('reply').value;
		const cooknum = e.target.dataset.cooknum;
		if(reply === '') {
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
				'cooknum': cooknum,
				'reply': reply,
				'userId' : '${login.userId}',
				'userNick': '${login.userNick}' //작성자를 보여주기 위해 보내줌
			})
		};

		fetch('${pageContext.request.contextPath}/reply/regist/recipe', reqObj)
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
		const cooknum = document.getElementById('likenum').dataset.cooknum;

		//get방식으로 댓글 목록을 요청(비동기)
		fetch('${pageContext.request.contextPath}/reply/getList/recipe/' + cooknum + '/' + pageNum)
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
					strAdd +=
						`<div class='reply-wrap'>
                            <div class='reply-image'>
                                <img src=''>
                            </div>
                            <div class='reply-content'>
                                <div class='reply-group'>
                                    <strong class='left'>` + replyList[i].userNick + `</strong> 
                                    <small class='left'>` + (replyList[i].updateDate != null ? parseTime(replyList[i]
							.updateDate) + '(수정됨)' : parseTime(replyList[i].replyDate)) + `</small>
                                    <a href='` + replyList[i].rno + `' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a> &nbsp
                                    <a href='` + replyList[i].rno + `' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                    <div style = 'opacity:0'>`+replyList[i].userId+`</div>
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
				if ('${login.userId}' !== userId) {
					alert('권한이 없습니다.');
					return;
				}
				if(!confirm('정말 삭제하시겠습니까?')) {
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
	
		if(e.target.classList.contains('modModBtn')) {
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
</Script>