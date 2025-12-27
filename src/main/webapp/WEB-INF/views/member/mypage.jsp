<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KCAD Enterprise - My Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/mypage.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/nav.jsp" />

<div class="mypage-wrapper">
    <div class="mypage-header">
        <h2><i class="fas fa-id-card"></i> 마이페이지</h2>
    </div>

    <div id="successAlert" class="alert alert-success">
        <i class="fas fa-check-circle"></i> 회원 정보가 성공적으로 수정되었습니다.
    </div>

    <form action="${pageContext.request.contextPath}/member/update" method="post">
        <div class="info-section">
            <h3>계정 정보</h3>
            <div class="grid-container">
                <div class="input-group">
                    <label>아이디</label>
                    <input type="text" name="userId" value="${member.userId}" readonly>
                </div>
                <div class="input-group">
                    <label>소속 기업</label>
                    <input type="text" value="${member.compId}" readonly>
                </div>
                <div class="input-group">
                    <label>가입일</label>
                    <input type="text" value="${member.regDate}" readonly>
                </div>
            </div>
        </div>

        <div class="info-section">
            <h3>상세 정보 수정</h3>
            <div class="grid-container">
                <div class="input-group">
                    <label>이름</label>
                    <input type="text" name="userName" value="${member.userName}" required>
                </div>
                <div class="input-group">
                    <label>이메일</label>
                    <input type="email" name="userEmail" value="${member.userEmail}">
                </div>
                <div class="input-group">
                    <label>부서</label>
                    <input type="text" name="userDept" value="${member.userDept}">
                </div>
                <div class="input-group">
                    <label>직함</label>
                    <input type="text" name="userJob" value="${member.userJob}">
                </div>
                <div class="input-group">
                    <label>연락처</label>
                    <input type="text" name="userPhone" value="${member.userPhone}">
                </div>
                <div class="input-group full">
                    <label>주소</label>
                    <input type="text" name="userAddr" value="${member.userAddr}">
                </div>
            </div>
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-save">수정사항 저장</button>
            <button type="button" class="btn btn-cancel" onclick="location.href='${pageContext.request.contextPath}/'">메인으로</button>
        </div>
    </form>
</div>

<script>
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        // 'status' 대신 컨트롤러와 동일하게 'msg'로 변경
        if (urlParams.get('msg') === 'success') {
            document.getElementById('successAlert').style.display = 'block';
            setTimeout(() => {
                document.getElementById('successAlert').style.display = 'none';
            }, 3000);
        }
    };
</script>
</body>
</html>