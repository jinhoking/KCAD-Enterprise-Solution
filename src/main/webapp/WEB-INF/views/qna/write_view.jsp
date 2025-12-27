<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>KCAD - 고객 지원 문의</title>
    <link rel="stylesheet" href="${path}/resources/css/board_qna/qna_support.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/nav.jsp" />

    <div class="write-form-container">
        <div class="board-card">
            <div class="form-header">
                <h2>고객 지원</h2>
                <h1>자유롭게 문의해주세요!</h1>
            </div>

            <form action="${path}/qna/write" method="post" enctype="multipart/form-data">
                <input type="hidden" name="qDept" value="${sessionScope.loginUser.userDept}">
                <input type="hidden" name="qJob" value="${sessionScope.loginUser.userJob}">

                <c:if test="${sessionScope.userName == 'admin'}">
                    <div class="form-group" style="background-color: #fff5f5; padding: 12px; border-radius: 8px; margin-bottom: 15px;">
                        <label style="display: flex; align-items: center; cursor: pointer; margin: 0;">
                            <input type="checkbox" id="noticeCheck" style="width: 18px; height: 18px; margin-right: 10px;">
                            <span style="color: #d9534f;">📢 공지사항으로 등록 (맨 위에 고정)</span>
                            <input type="hidden" name="qNotice" id="qNotice" value="N">
                        </label>
                    </div>
                </c:if>

                <div class="form-group">
                    <label style="display: flex; align-items: center; cursor: pointer;">
                        <input type="checkbox" id="secretCheck" style="width: 18px; height: 18px; margin-right: 10px;">
                        <span>비밀글로 설정하기 🔒</span>
                        <input type="hidden" name="qSecret" id="qSecret" value="N">
                    </label>
                </div>

                <div class="form-group">
                    <label for="qName">작성자</label>
                    <input type="text" id="qName" class="input-field" value="${sessionScope.userName}" readonly>
                    <p style="font-size: 12px; color: #007bff; margin-top: 8px;">
                        * 소속: ${sessionScope.loginUser.userDept} / ${sessionScope.loginUser.userJob} 정보로 기록됩니다.
                    </p>
                </div>

                <div class="form-group">
                    <label for="qTitle">제목</label>
                    <input type="text" id="qTitle" name="qTitle" class="input-field" placeholder="문의 제목을 입력하세요" required>
                </div>

                <div class="form-group">
                    <label for="qContent">문의 내용</label>
                    <textarea id="qContent" name="qContent" class="input-field" placeholder="내용을 입력하세요" required></textarea>
                </div>

                <div class="form-group">
                    <label for="file">첨부파일</label>
                    <input type="file" name="file" class="input-field" style="padding-top: 12px;">
                </div>

                <div class="form-actions">
                    <a href="${path}/qna/list" class="btn btn-cancel">취소</a>
                    <button type="submit" class="btn btn-submit">등록하기</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 체크박스 상태 연동
        const secretCheck = document.getElementById('secretCheck');
        if (secretCheck) {
            secretCheck.addEventListener('change', function() {
                document.getElementById('qSecret').value = this.checked ? 'Y' : 'N';
            });
        }

        const noticeCheck = document.getElementById('noticeCheck');
        if (noticeCheck) {
            noticeCheck.addEventListener('change', function() {
                document.getElementById('qNotice').value = this.checked ? 'Y' : 'N';
            });
        }
    </script>
</body>
</html>