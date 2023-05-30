<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>게시판</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	<div id="container">
		<form action="${pageContext.request.contextPath}/user/test" method="post">
		<input type="hidden" name="writer" value="${userInfo.userId}">
		
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" placeholder="제목을 입력하세요" name="title">
		</div>
		
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="5" id="summernote" id="imageBoard" name="content"></textarea>
		</div>
		
	 	 <button>글 작성</button>
	  </form>
	</div>
	
	  
	<script>

        $(document).ready(function() {
            $('#summernote').summernote({
              height: 400,
              placeholder: '게시글 내용을 입력하세요!',
              minHeight: null,
              maxHeight: null,
              focus: true,
              callbacks: {
                onImageUpload: function(files, editor, welEditable) {
                  for (var i = files.length - 1; i >= 0; i--) {
                    sendFile(files[i], this);
                  }
                }
              }
            });
          });
          
          function sendFile(file, el) {
            var form_data = new FormData();
            form_data.append('file', file);
            $.ajax({
              data: form_data,
              type: "POST",
              url: '/img',
              cache: false,
              contentType: false,
              enctype: 'multipart/form-data',
              processData: false,
              success: function(url) {
                $(el).summernote('editor.insertImage', url);
                $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
              }
            });
            ResponseEntity.ok().headers(headers).body(resource);
          }
    </script>
	  
	  
</body>
</html>