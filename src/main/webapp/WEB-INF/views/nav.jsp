<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/* 기존 스타일 유지 */
.main-nav {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #ffffff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 9999;
}

.nav-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 20px;
    height: 60px;
}

.nav-logo {
    display: flex;
    align-items: center;
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

.nav-logo img {
    height: 35px;
    margin-right: 10px;
}

.nav-links {
    display: flex;
    align-items: center;
    list-style: none;
    margin: 0;
    padding: 0;
}

.nav-links>li {
    margin-left: 25px;
    position: relative;
}

.nav-links a, .dropbtn {
    text-decoration: none !important;
    color: #555;
    font-weight: bold;
    font-size: 15px;
    transition: 0.3s;
}

/* 마이페이지 링크 특화 스타일 */
.mypage-link {
    color: #0696d7 !important;
    transition: all 0.2s ease-in-out;
}

.mypage-link:hover {
    text-decoration: underline !important;
    opacity: 0.8;
}

.nav-links a:hover, .dropbtn:hover {
    color: #0696d7;
}

/* ... (나머지 드롭다운 스타일 유지) ... */
.dropdown-content {
    display: none;
    position: absolute;
    top: 100%;
    left: 50%;
    transform: translateX(-50%);
    background-color: #fff;
    min-width: 120px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
    padding: 5px 0;
    list-style: none;
    border-radius: 4px;
    border: 1px solid #eee;
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown-content li a {
    font-weight: 500;
    padding: 8px 10px;
    display: block;
    text-align: center;
    font-size: 14px;
    color: #666;
    white-space: nowrap;
}
</style>

<nav class="main-nav">
    <div class="nav-content">
        <c:choose>
            <c:when test="${not empty sessionScope.currentComp}">
                <a href="${pageContext.request.contextPath}/solution/${sessionScope.currentComp.compId}" class="nav-logo"> 
                    <img src="${pageContext.request.contextPath}/resources/img/logos/${sessionScope.currentComp.logoImg}" alt="기업로고"> 
                    <span><b>${sessionScope.currentComp.compName}</b></span>
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/" class="nav-logo">
                    <img src="${pageContext.request.contextPath}/resources/img/klogo.png" alt="기본로고"> 
                    <span><b>KCAD Home</b></span>
                </a>
            </c:otherwise>
        </c:choose>

        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/markupUpload">실시간 마크업</a></li>
            <li><a href="${pageContext.request.contextPath}/markupList">도면 갤러리</a></li>
            <li><a href="${pageContext.request.contextPath}/intro">기업 솔루션</a></li>
            <li><a href="${pageContext.request.contextPath}/board/list">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/qna/list">고객지원</a></li>

            <c:choose>
                <c:when test="${empty sessionScope.loginUser}">
                    <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <%-- [수정 부분] 사용자 이름을 클릭하면 마이페이지 컨트롤러(@GetMapping("/mypage"))로 이동 --%>
                    <li>
                        <a href="${pageContext.request.contextPath}/member/mypage" class="mypage-link">
                            ${sessionScope.userName}님
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/logout" style="color: red;">로그아웃</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>