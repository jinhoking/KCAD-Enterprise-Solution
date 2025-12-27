<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KCAD Enterprise - My Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/mypage.css">
<style>
    /* select 박스 디자인을 기존 input과 통일 */
    .grid-container select.form-control {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: white;
        font-size: 14px;
        outline: none;
    }
    .grid-container select.form-control:focus {
        border-color: #0696d7;
    }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/nav.jsp" />

<div class="mypage-wrapper">
    <div class="mypage-header">
        <h2><i class="fas fa-id-card"></i> 마이페이지</h2>
    </div>

    <div id="successAlert" class="alert alert-success" style="display:none;">
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
                
                <%-- [수정] 담당 파트: 직접 입력 대신 선택 방식으로 변경 --%>
                <div class="input-group">
                    <label>담당 파트</label>
                    <select name="userDept" class="form-control">
                        <option value="건축" ${member.userDept == '건축' ? 'selected' : ''}>건축</option>
                        <option value="전기" ${member.userDept == '전기' ? 'selected' : ''}>전기</option>
                        <option value="기계" ${member.userDept == '기계' ? 'selected' : ''}>기계</option>
                        <option value="토목" ${member.userDept == '토목' ? 'selected' : ''}>토목</option>
                        <option value="소방" ${member.userDept == '소방' ? 'selected' : ''}>소방</option>
                        <option value="기타" ${member.userDept == '기타' ? 'selected' : ''}>일반/기타</option>
                    </select>
                </div>

                <%-- [수정] 직업 구분: 직접 입력 대신 선택 방식으로 변경 --%>
                <div class="input-group">
                    <label>직업 구분</label>
                    <select name="userJob" class="form-control">
                        <option value="설계자" ${member.userJob == '설계자' ? 'selected' : ''}>설계자</option>
                        <option value="현장담당자" ${member.userJob == '현장담당자' ? 'selected' : ''}>현장담당자</option>
                        <option value="관리자" ${member.userJob == '관리자' ? 'selected' : ''}>관리자/기타</option>
                    </select>
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