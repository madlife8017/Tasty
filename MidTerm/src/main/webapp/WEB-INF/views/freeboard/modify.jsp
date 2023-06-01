<%@page import="com.midterm.foodSNS.command.MfreeboardImgVO"%>
<%@page import="com.midterm.foodSNS.command.MfreeboardArticleVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/modify.css" rel="stylesheet">
</head>
<body>
	<%
			
			MfreeboardArticleVO article = (MfreeboardArticleVO)request.getAttribute("avo");
			ArrayList<MfreeboardImgVO> imgs = new ArrayList<>();
			imgs = (ArrayList<MfreeboardImgVO>) request.getAttribute("ivo");
		%>
	<div class="container">
		<div class="imgCont">
		<% if(imgs.size()==0){%>
		<div data-count="0">1개 이상의 이미지가 등록되어야합니다.</div>
		
		<%		
		}
		else{
		
		for(int i =0; i< imgs.size();i++){

			%><div class ="imgCon"><img src="${pageContext.request.contextPath}
			/user/display/<%=imgs.get(i).getFileLoca()%>/<%=imgs.get(i).getFileName() %>" 
			data-inum = "<%=imgs.get(i).getFreeboardImgNumber()%>" alt="미리보기"></div><%
			}
		}
		
		%></div>
		<form action="${pageContext.request.contextPath}/freeboard/regist" method="post" enctype="multipart/form-data">
			<label for="file">이미지업로드</label> 
			<input multiple="multiple" type="file" name="file" >
			<input type="hidden" name="userId" value="${login.userId}">
			<table class="table">
				<tbody class="t-control">
					<tr>						
						<td><textarea class="form-control" rows="7" name="content"
						placeholder="<%=article.getContent()%>"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="titlefoot">
				<button class="btn" type="submit">등록</button>
			</div>
		</form>
	</div>
</body>
</html>

<script>

	document.querySelector('.imgCont').addEventListener('click',e=>{

		if(e.target.matches('.imgCon img')){
			if(confirm("이미지를 삭제할까요?"))
			{	
				console.log(document.querySelector(e.target));

			}
			const iNum=e.target.dataset.inum;
			console.log(iNum);

			// fetch('${pageContext.request.contextPath}/freeboard/modifyImgDelete/'+ iNum,{
			// 			method : 'delete'
			// 			}).then(res => {
			// 				location.reload();
			// 			});
						

		}else{
			console.log("올바른 타겟아님");
		}


	})





</script>