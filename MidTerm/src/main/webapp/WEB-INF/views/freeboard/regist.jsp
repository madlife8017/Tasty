<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    

    <link href="${pageContext.request.contextPath}/css/userProfileModify.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <title>Tasty Friends</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

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


    <link href="${pageContext.request.contextPath}/css/regist.css" rel="stylesheet">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>



<body>


	  <nav class="navbar bg-success fixed-top ">
    <div class="container-fluid">
      <a class="navbar-brand text-light" href="${pageContext.request.contextPath}/">Tasty Friend</a>

      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
        <div class="offcanvas-header">
          <aside></aside>
        </div>

      </div>
    </div>
  </nav>


 <main>
    <div class="box">
      <div class="inner-box">
        <div class="forms-wrap">
          <form action="${pageContext.request.contextPath}/freeboard/regist" method="post" id="form"
                enctype="multipart/form-data" class="sign-in-form">
            <div class="logo">
              <h4>${login.userId}님의 게시글</h4>
              <input type="hidden" name="userId" value="${login.userId}">
            </div>
            <div class="actual-form">
              <span>이미지 업로드 <small>(최대 4개까지)</small></span>
                    <input type="file" name="file" id="file" multiple="multiple">
              <div class="input-wrap"></div>
              
          
              <div class="input-wrap">
              <textarea class="textarea-style" cols="35" rows="7" name="content" placeholder=" 당신의 요리이야기를 들려주세요!" autocomplete="off" required></textarea>
              </div>
              
              <div class="input-wrap"></div>
              <button class="sign-btn" id="reginsBtn" type="button">등록</button>
              <button type="button" id="cancleBtn" class="sign-btn">취소하기</button>
            </div>
          </form>
        </div>

        <div class="carousel">
          <div class="images-wrapper">
            <input type="hidden" name="fileName" id="fileName">
            <div class="overing">
              <div id="attr_area" style="display: inline-block" class="image-upload" data-placeholder=""></div>
              <label for="file"></label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <footer> copyright © TastyFriends. all rights reserved </footer>
</body>


<script>
    /* $("#file").on('change', function() {
	    var fileName = $(this).val().split("\\").pop();
	    $(".upload-name").val(fileName);
	}); */







    document.addEventListener('DOMContentLoaded', function () {
        imageView();
    });


    //즉시 실행 함수를 이용해서 페이지 들어오면 바로 로딩 될 수 있도록 구성
    imageView = function imageView() {
        //미리보기 영역
        const $area = document.getElementById('attr_area');
        //파일 선택 버튼
        const $btnAttr = document.getElementById('file');

        //첨부한 파일들을 모아주는 배열
        const selectFiles = [];

        // 이미지와 체크 박스를 감싸고 있는 div 속성 (원하는 대로 고쳐 쓰세여)
        let divStyle = 'display:inline-block;position:relative;' +
            'width:250px;height:280px;margin:5px;border:1px solid #fff;z-index:1';
        // 미리보기 이미지 속성 (원하는 대로 고쳐 쓰세여)
        let imgStyle = 'width:100%;height:100%;z-index:none';
        // 이미지안에 표시되는 체크박스의 속성 (원하는 대로 고쳐 쓰세여)
        let chkStyle = 'width:30px;height:30px;position:absolute;font-size:17px;' +
            'right:0px;bottom:0px;z-index:999;background-color:white;border:red;border-radius:10px';

        //파일선택 버튼을 누르면
        $btnAttr.onchange = function (e) {

            selectFiles.length = 0;

            //첨부된 파일 전부 불러오기
            const files = e.target.files;
            //여러개의 파일을 나누어서 배열에 담기 
            const fileArr = Array.prototype.slice.call(files);

            console.log(fileArr);

            //반복문 이용해서 파일 정보 불러와서 배열에 담는 함수 호출.
            for (let f of fileArr) {
                if (f.type === 'text/plain' || f.type === 'application/zip') { //txt랑 zip파일은 불가.
                    alert('txt 또는 zip 파일은 업로드할 수 없습니다.');
                    continue;
                }
                imageLoader(f);
            }
        } 
         //탐색기에서 드래그앤 드롭 사용

                //드래그로 들어올 때는 이벤트 발생 못하게
                $area.addEventListener('dragenter', function(e) {
                    e.preventDefault(); //고유 기능 중지
                    e.stopPropagation(); //이벤트 전파 중지
                }, false);

                //드래그 하는 도중에도 이벤트 발생 못하게
                $area.addEventListener('dragover', function(e) {
                    e.preventDefault(); //고유 기능 중지
                    e.stopPropagation(); //이벤트 전파 중지
                }, false);

                //드롭 했을 때에만 이벤트가 발생될 수 있도록
                $area.addEventListener('drop', function(e) {
                    let files = {};
                    e.preventDefault();
                    e.stopPropagation();
                    const dt = e.dataTransfer;
                    files = dt.files;
                    for(let f of files) {
                        imageLoader(f);
                        console.log(f);
                    }
                });
        
        
        //첨부된 이미지들을 배열에 넣고 미리보기 구현

        const maxFiles = 4;

        function imageLoader(file) {

            if (selectFiles.length >= maxFiles) {
                alert(`이미지는 최대 4개까지 첨부할 수 있습니다.`);
                return;
            }

            selectFiles.push(file);

            //파일 정보를 읽는 파일리더 객체 생성.
            const reader = new FileReader();

            //파일 정보를 다 읽었다면
            reader.onload = function (e) {
                //이미지 태그 생성
                let $img = document.createElement('img');
                //스타일 주기
                $img.setAttribute('style', imgStyle);
                //파일 경로 src에 담기
                $img.setAttribute('src', e.target.result);

                //div와 X버튼 감싸서 한번에 표현하기 위해 makeDiv 함수 호출.
                $area.appendChild(makeDiv($img, file));
            }

            reader.readAsDataURL(file);
        }

        //첨부된 파일이 있는 경우 checkbox와 함께 $area에 추가할 div를 만들어서 변환.
        function makeDiv(img, file) {

            //div 잡기
            const $div = document.createElement('div');
            $div.setAttribute('style', divStyle);
            $div.setAttribute('id', 'divStyle');

            //X버튼 만들기
            const $btn = document.createElement('input');
            $btn.setAttribute('type', 'button');
            $btn.setAttribute('value', 'X');
            $btn.setAttribute('delFile', file.name);
            $btn.setAttribute('style', chkStyle);

            //X버튼 누르면 파일 리스트에서 파일 제거.
            $btn.onclick = function (e) {
                const $ele = e.target;
                const delFile = $ele.getAttribute('delFile');
                for (let i = 0; i < selectFiles.length; i++) {
                    if (delFile === selectFiles[i].name) {
                        selectFiles.splice(i, 1);
                    }
                }

                //데이터 트랜스퍼 객체를 이용해서 삭제된 파일이 반영된 새 정보를 $btnAttr에게 전달.
                //파일 개수가 바뀜.
                let dt = new DataTransfer();
                for (let f in selectFiles) {
                    const file = selectFiles[f];
                    dt.items.add(file);

                }
                $btnAttr.files = dt.files;

                //부모까지 지목해서 그림이랑 X버튼 한번에 삭제
                const $parent = $ele.parentNode;
                $area.removeChild($parent);
            }

            //추가하기
            $div.appendChild(img);
            $div.appendChild($btn);
            return $div;
        }




        document.getElementById('reginsBtn').addEventListener('click', e => {
            console.log('잡혀?');
            console.log(document.getElementById('attr_area').childElementCount);
            if (confirm("게시물을 게시하시겠습니까?")) {

                if (document.getElementById('attr_area').childElementCount == 0) {
                    alert("1개이상의 이미지를 등록해야합니다.");

                    return;
                } else {
                    alert("게시물이 등록되었습니다.");
                    document.getElementById('form').submit();
                }

            } else {
                return;
            }
        });
    };
    document.getElementById('cancleBtn').addEventListener('click', () => {
    	history.back();
    });
</script>

</html>

