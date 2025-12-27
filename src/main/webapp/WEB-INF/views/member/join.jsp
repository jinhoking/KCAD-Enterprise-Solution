<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KCAD - 회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/join.css">
</head>
<body>
    <jsp:include page="../nav.jsp" />

    <div class="signup-container">
        <h2>계정 생성하기</h2>
        
        <form id="signup-form" action="joinOk" method="post">
            <div class="form-flex-wrapper">
                
                <div class="form-section">
                    <div class="section-title">[ 기본 정보 ]</div>
                    
                    <div class="input-group">
                        <label for="username">사용자 이름</label>
                        <input type="text" id="username" name="userName" required placeholder="이름을 입력하세요">
                    </div>
                    
                    <div class="input-group">
                        <label for="userid">아이디</label>
                        <input type="text" id="userid" name="userId" required placeholder="아이디 입력">
                    </div>
                    
                    <div class="input-group">
                        <label for="userpw">비밀번호</label>
                        <input type="password" id="userpw" name="userPw" required placeholder="비밀번호 입력">
                    </div>
                    
                    <div class="input-group">
                        <label for="password-confirm">비밀번호 확인</label>
                        <input type="password" id="password-confirm" required placeholder="비밀번호 재입력">
                    </div>
                </div>

                <div class="form-section">
                    <div class="section-title">[ 협업 설정 ]</div>

                    <div class="input-group">
                        <label for="useremail">이메일 주소</label>
                        <input type="text" id="useremail" name="userEmail" required placeholder="example@kcad.com">
                    </div>

                    <div class="input-group">
                        <label for="userphone">전화번호</label>
                        <input type="text" id="userphone" name="userPhone" required placeholder="010-0000-0000">
                    </div>

                    <div class="input-group">
                        <label for="userjob">직업 구분</label>
                        <select id="userjob" name="userJob" class="form-control">
                            <option value="설계자">설계자</option>
                            <option value="현장담당자">현장담당자</option>
                            <option value="관리자">관리자/기타</option>
                        </select>
                    </div>

                    <div class="input-group">
                        <label for="userdept">담당 파트</label>
                        <select id="userdept" name="userDept" class="form-control">
                            <option value="건축">건축</option>
                            <option value="전기">전기</option>
                            <option value="기계">기계</option>
                            <option value="기계">토목</option>
                            <option value="기계">소방</option>
                            <option value="기타">일반/기타</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="input-group full-width">
                <label for="useraddr">사는 곳 (또는 회사 주소)</label>
                <input type="text" id="useraddr" name="userAddr" placeholder="주소를 입력하세요">
            </div>
            
            <div class="button-group">
                <button type="submit" class="signup-button">생성하기</button>
                <button type="button" class="signup-button cancel" onclick="history.back()">취소/뒤로가기</button>
            </div>
        </form>
    </div>
</body>
</html>