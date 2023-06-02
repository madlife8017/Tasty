<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">


  <head>
    <meta charset="UTF-8">
    <title>레시피 등록</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  </head>
  <body>
  <div id="container">
    <form action="${pageContext.request.contextPath}/freeboard/uploadRecipe" method="post">
      <input type="hidden" name="writer" value="${login.userId}">

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
      $('#summernote').summernote({
        placeholder: '레시피 내용을 작성하세요',
        tabsize: 2,
        height: 400
      });

    </script>
  </body>
</html>
