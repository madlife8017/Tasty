<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section>
    <!--Toggleable / Dynamic Tabs긁어옴-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-10 col-lg-9 myInfo">
                <div class="titlebox">
                    개인정보 수정
                </div>

                <ul class="nav nav-tabs tabs-style">
                    <li><a data-toggle="tab" href="${pageContext.request.contextPath}/mypage/mypageResult">내글</a></li>
                    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
                </ul>
                <div class="tab-content">
                    <div id="info" class="tab-pane fade in active">

                        <p>*표시는 필수 입력 표시입니다</p>
                        <form action="${pageContext.request.contextPath}/user/userUpdate" method="post"
                            name="updateForm">
                            <table class="table">
                                <tbody class="m-control">
                                    <tr>
                                        <td class="m-title">ID</td>
                                        <td><input class="form-control input-sm" name="userId"
                                                value="${login}" readonly></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*이름</td>
                                        <td><input class="form-control input-sm" name="userName"
                                                value="${userInfo.userName}"></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*비밀번호</td>
                                        <td><input class="form-control input-sm" name="userPw"></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*비밀번호확인</td>
                                        <td><input class="form-control input-sm" name="userPwChk"></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*E-mail</td>
                                        <td>
                                            <input class="form-control input-sm" id="userEmail1" name="userEmail1"
                                                value="${userInfo.userEmail1}">
                                            <select class="form-control input-sm sel" id="userEmail2" name="userEmail2">
                                                <option ${userInfo.userEmail2=='@naver.com' ? 'selected' : '' }>
                                                    @naver.com</option>
                                                <option ${userInfo.userEmail2=='@gmail.com' ? 'selected' : '' }>
                                                    @gmail.com</option>
                                                <option ${userInfo.userEmail2=='@daum.net' ? 'selected' : '' }>@daum.net
                                                </option>
                                            </select>
                                            <button type="button" id="mail-check-btn" class="btn btn-primary">이메일
                                                인증</button>
                                        </td>
                                    </tr>
                                    <tr id="mailAuth">
                                        <td>인증번호 입력란</td>
                                        <td>
                                            <input type="text" class="form-control mail-check-input"
                                                placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
                                            <button type="button" id="mail-auth-btn" class="btn btn-primary">인증
                                                확인</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*휴대폰</td>
                                        <td>
                                            <select class="form-control input-sm sel" name="userPhone1">
                                                <option ${userInfo.userPhone1=='010' ? 'selected' : '' }>010</option>
                                                <option ${userInfo.userPhone1=='011' ? 'selected' : '' }>011</option>
                                                <option ${userInfo.userPhone1=='017' ? 'selected' : '' }>017</option>
                                                <option ${userInfo.userPhone1=='018' ? 'selected' : '' }>018</option>
                                            </select>
                                            <input class="form-control input-sm" name="userPhone2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*우편번호</td>
                                        <td><input class="form-control input-sm" name="addrZipNum"
                                                value="${userInfo.addrZipNum}" readonly>
                                            <button type="button" class="btn btn-primary"
										onclick="searchAddress()">주소찾기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*주소</td>
                                        <td><input class="form-control input-sm add" name="addrBasic"
                                                value="${userInfo.addrBasic}"></td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">*상세주소</td>
                                        <td><input class="form-control input-sm add" name="addrDetail"
                                                value="${userInfo.addrDetail}"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>

                        <div class="titlefoot">
                            <button class="btn">수정</button>
                            <button class="btn">목록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>

<script>
//주소 API
function searchAddress() { 
    new daum.Postcode({
        oncomplete: function(data) {

            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값 가져옴
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }		
			
			
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addrZipNum').value = data.zonecode; //우편번호
            document.getElementById("addrBasic").value = addr; 	//기본주소
            document.getElementById("addrDetail").focus();
        }
    }).open();
} //주소찾기 api 끝.
</script>

</body>
</html>