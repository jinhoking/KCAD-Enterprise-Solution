<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KCAD - 비밀번호 변경</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css">
    <style>
        /* 불일치 메시지 스타일 */
        .pw-msg {
            font-size: 13px;
            margin-top: 5px;
            display: block;
            text-align: left;
        }
    </style>
</head>
<body>
    <jsp:include page="../nav.jsp" />

    <div class="auth-wrapper" style="padding-top: 80px;">
        <div class="login-container" style="margin: 0 auto;">
            <h2>새 비밀번호 설정</h2>
            <p style="text-align: center; font-size: 14px; color: #666; margin-bottom: 20px;">
                ${userId}님의 새로운 비밀번호를 입력해주세요.
            </p>

            <form action="updatePw" id="updatePwForm" method="post" class="login-form">
                <input type="hidden" name="userId" value="${userId}">

                <div class="input-group">
                    <label>새 비밀번호</label> 
                    <input type="password" id="userPw" name="userPw" required placeholder="새 비밀번호 입력">
                </div>

                <div class="input-group">
                    <label>비밀번호 확인</label> 
                    <input type="password" id="userPwConfirm" required placeholder="비밀번호 재입력">
                    <span id="pwConfirmMsg" class="pw-msg"></span>
                </div>

                <button type="submit" class="login-button" style="margin-top: 20px;">변경하기</button>
            </form>
        </div>
    </div>

    <script src="${path}/resources/js/member/update_pw.js"></script>
</body>
</html>