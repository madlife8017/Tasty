<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	
	<c:forEach var="vo" items="${boardList}">
		
				<div>${vo.title}</div>
				<strong>[${vo.replyCnt}]</strong>
				<br>
				<div>${vo.writer}</div>
				<br>
				<fmt:parseDate value="${vo.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
				<fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 HH시 mm분" />
				<br>
				<fmt:parseDate value="${vo.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedUpdateTime"
					type="both" />
				<fmt:formatDate value="${parsedUpdateTime}" pattern="yyyy년 MM월 dd일 HH시 mm분" />
				<br>
				
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
	</c:forEach>
	
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
</script>

</html>