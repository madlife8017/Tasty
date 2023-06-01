<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        #attr_area {
            width: 660px;
            min-height: 150px;
            padding: 10px;
            border: 1px dotted #00f;
        }

        #attr_area:empty::before {
            content: attr(data-placeholder);
            color: #999;
            font-size: .9em;
        }
    </style>

</head>

<body>

    <div id="img_preview">
        <h3>이미지 미리보기</h3>
        <input type="file" id="btnAttr" multiple="multiple">
        <div id="attr_area" data-placeholder="파일 첨부하려면 파일 선택 버튼을 클릭하거나 파일을 드래그 앤 드롭하세요."></div>
    </div>


    <script>

        //즉시 실행 함수를 이용해서 페이지 들어오면 바로 로딩 될 수 있도록 구성
        (
            imageView = function imageView() {

                //미리보기 영역
                const $area = document.getElementById('attr_area');
                //파일 선택 버튼
                const $btnAttr = document.getElementById('btnAttr');

                //첨부한 파일들을 모아주는 배열
                const selectFiles = [];

                // 이미지와 체크 박스를 감싸고 있는 div 속성 (원하는 대로 고쳐 쓰세여)
                let divStyle = 'display:inline-block;position:relative;' +
                    'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
                // 미리보기 이미지 속성 (원하는 대로 고쳐 쓰세여)
                let imgStyle = 'width:100%;height:100%;z-index:none';
                // 이미지안에 표시되는 체크박스의 속성 (원하는 대로 고쳐 쓰세여)
                let chkStyle = 'width:30px;height:30px;position:absolute;font-size:24px;' +
                    'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

                //파일선택 버튼을 누르면
                $btnAttr.onchange = function(e) {
                    //첨부된 파일 전부 불러오기
                    const files = e.target.files;
                    //여러개의 파일을 나누어서 배열에 담기 
                    const fileArr = Array.prototype.slice.call(files);

                    console.log(fileArr);

                    //반복문 이용해서 파일 정보 불러와서 배열에 담는 함수 호출.
                    for(let f of fileArr) {
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
                    }
                });

                //첨부된 이미지들을 배열에 넣고 미리보기 구현
                function imageLoader(file) {
                    selectFiles.push(file);

                    //파일 정보를 읽는 파일리더 객체 생성.
                    const reader = new FileReader();

                    //파일 정보를 다 읽었다면
                    reader.onload = function(e) {
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

                    //X버튼 만들기
                    const $btn = document.createElement('input');
                    $btn.setAttribute('type', 'button');
                    $btn.setAttribute('value', 'X');
                    $btn.setAttribute('delFile', file.name);
                    $btn.setAttribute('style', chkStyle);

                    //X버튼 누르면 파일 리스트에서 파일 제거.
                    $btn.onclick = function(e) {
                        const $ele = e.target;
                        const delFile = $ele.getAttribute('delFile');
                        for(let i=0; i<selectFiles.length; i++) {
                            if(delFile === selectFiles[i].name) {
                                selectFiles.splice(i, 1);
                            }
                        }

                        //데이터 트랜스퍼 객체를 이용해서 삭제된 파일이 반영된 새 정보를 $btnAttr에게 전달.
                        //파일 개수가 바뀜.
                        let dt = new DataTransfer();
                        for(let f in selectFiles) {
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
            }

        )();
    </script>


</body>

</html>