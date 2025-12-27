<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KCAD - 비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css">
</head>
<body>
    <jsp:include page="../nav.jsp" />

    <div class="login-container" style="margin: 80px auto 50px auto;">
        <h2>비밀번호 찾기</h2>
        <p style="text-align:center; font-size:14px; color:#666; margin-bottom: 20px;">가입하신 아이디와 이름을 입력해주세요.</p>
        
        <form action="findCheck" method="post" class="login-form">
            <div class="input-group">
                <label>아이디</label>
                <input type="text" name="userId" required placeholder="아이디 입력">
            </div>
            <div class="input-group">
                <label>이름</label>
                <input type="text" name="userName" required placeholder="이름 입력">
            </div>
            
            <button type="submit" class="login-button">확인</button>
            <button type="button" class="login-button cancel" onclick="history.back()" style="margin-top: 10px; background-color: #6c757d;">취소/뒤로가기</button>
        </form>
    </div>
</body>
</html>