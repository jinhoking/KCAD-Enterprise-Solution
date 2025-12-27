<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- [해결] JSTL 라이브러리 선언 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${not empty currentComp ? currentComp.compName : 'KCAD'} - 로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/login.css">
</head>
<body>
<jsp:include page="../nav.jsp" />
     
    <div class="login-container">
        <div class="login-header">
            <c:choose>
                <c:when test="${not empty currentComp}">
                    <img src="${pageContext.request.contextPath}/resources/img/logos/${currentComp.logoImg}" alt="로고" class="login-logo">
                    <h2>${currentComp.compName} 로그인</h2>
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/resources/img/klogo.png" alt="KCAD 로고" class="login-logo">
                    <h2>KCAD 로그인</h2>
                </c:otherwise>
            </c:choose>
        </div>
        
        <form class="login-form" action="loginOk" method="post">
            <%-- 현재 세션의 회사 ID를 서버로 전송 (컨트롤러 보안 로직용) --%>
            <input type="hidden" name="loginCompId" value="${currentComp.compId}">

            <div class="input-group">
                <label for="username">사용자 아이디</label>
                <input type="text" id="username" name="id" placeholder="아이디 입력" required>
            </div>
            <div class="input-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="pw" placeholder="비밀번호 입력" required>
            </div>
            
            <c:if test="${not empty msg}">
                <p style="color: red; font-size: 13px; text-align: center;">${msg}</p>
            </c:if>

            <div class="remember-me">
                <input type="checkbox" id="remember" name="remember">
                <label for="remember">로그인 정보 기억하기</label>
            </div>
            
            <button type="submit" class="login-button">로그인</button>
            
            <div class="login-links">
                <a href="findPw" class="forgot-password">비밀번호를 잊으셨나요?</a>
                <a href="join" class="register-link">계정 생성하기</a>
            </div>
        </form>
    </div>
</body>
</html>