<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

	fetch('${pageContext.request.contextPath}/user/test/' + page)
	.then(res => res.json())
	.then(list => {
		console.log(list);
		console.log(list.length);
		if(list.length === 0) isFinish = true;

		if(reset) {
			while($contentDiv.firstChild) {
				$contentDiv.firstChild.remove();
			}
			page = 1;
		}

		for(vo of list) {
			str += 
			`
				<div class="title">
//					<p>`+ vo.writer + `</p>
//					<small>`+ vo.regDate + `</small> &nbsp;&nbsp;
				</div>
			</div>
			<div class="content-inner">
				<!--내용영역-->
				<p>`+ vo.content +`</p>
			</div>
			`;
		} 
		if(!reset) {
			document.getElementById('contentDiv').insertAdjacentHTML('beforeend', str);
		} else{
			document.getElementById('contentDiv').insertAdjacentHTML('afterbegin', str);
		}
	}) //end fetch
} //end getList()

</script>
</html>