<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>프로필 수정</title>

<link rel="icon" href="${pageContext.request.contextPath}/img/favicon-32x32.png">

  <link href="${pageContext.request.contextPath}/css/userProfileModify.css" rel="stylesheet">
  <style>
    /* sns파일 업로드시 미리보기  */
/*     .fileDiv {
      height: 100px;
      width: 200px;
      display: none;
      margin-bottom: 10px;
    }

    .fileDiv img {
      width: 100%;
      height: 100%;
    } */
  </style>

<body>

  <nav class="navbar bg-success fixed-top ">
    <div class="container-fluid">
      <a class="navbar-brand text-light" href="${pageContext.request.contextPath}/">Tasty Friends</a>

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
          <form action="${pageContext.request.contextPath}/user/userProfileModify" method="post" name="profileMod"
            enctype="multipart/form-data" autocomplete="off" class="sign-in-form">
            <div class="logo">
              <h4>${login.userId}님의 프로필</h4>
              <input type="hidden" name="userId" value="${login.userId}">
            </div>
            <div class="actual-form">
              <span>프로필 사진 변경</span>
              <input type="file" name="file" id="file">
              <div class="input-wrap"></div>
              <span>닉네임</span>
              <div class="input-wrap">
                <input type="text" class="input-field" autocomplete="off" required name="userNick"
                   value="${login.userNick}" />
              </div>

              <span>상태메세지</span>
              <div class="input-wrap">
                <input type="text" class="input-field" autocomplete="off" required name="message"
                   value="${login.message}" />
              </div>

              <button type="button" id="uploadBtn" value="Sign In" class="sign-btn">수정하기</button>
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

</body>

</html>

<script>
  const oringinName = document.getElementById('fileName').value;
  console.log(oringinName);
  document.getElementById('uploadBtn').onclick = () => {
    let file = document.getElementById('file').value;
    //.을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경
    if (file == '') return;
    file = file.slice(file.indexOf('.') + 1).toLowerCase();
    if (file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
      alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
      document.getElementById('file').value = '';
      return;
    }
    
  }
  document.getElementById('cancleBtn').onclick = () => {
    history.back(); //이전페이지로
  }

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
      'width:600px;height:480px;margin:5px;border:1px solid #fff;z-index:1';
    // 미리보기 이미지 속성 (원하는 대로 고쳐 쓰세여)
    let imgStyle = 'margin-top:41px;width:86%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성 (원하는 대로 고쳐 쓰세여)
    let chkStyle = 'width:30px;height:30px;position:absolute;font-size:17px;' +
      'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);border:red;border-radius:10px';

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
    } //첨부된 이미지들을 배열에 넣고 미리보기 구현

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
    document.getElementById('uploadBtn').addEventListener('click', e => {
      console.log('잡혀?');
      console.log(document.getElementById('attr_area').childElementCount);
      if (document.getElementById('attr_area').childElementCount == 0) {
          alert("1개이상의 이미지를 등록해야합니다.");
          return;
        }
      if (confirm("프로필을 변경하시겠습니까??")) {
          alert("프로필이 변경되었습니다.");
          document.profileMod.submit();
        } else {
        return;
      }
    });
  };
</script>