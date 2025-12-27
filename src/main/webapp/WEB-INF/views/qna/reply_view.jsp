<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>KCAD - 답변 작성</title>
    <link rel="stylesheet" href="${path}/resources/css/board_qna/reply_card.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/nav.jsp" />

    <div class="reply-card-wrapper">
        <div class="reply-card-container">
            <div class="reply-card-header">
                <span class="category-badge">고객 지원</span>
                <h2 class="form-main-title">답변 작성하기 👨‍💻</h2>
            </div>

            <form action="${path}/qna/reply" method="post">
                
                <input type="hidden" name="qId" value="${reply_view.qId}">
                <input type="hidden" name="qGroup" value="${reply_view.qGroup}">
                <input type="hidden" name="qStep" value="${reply_view.qStep}">
                <input type="hidden" name="qIndent" value="${reply_view.qIndent}">
                <input type="hidden" name="qSecret" value="${reply_view.qSecret}">

                <%-- [핵심 추가] 원글 작성자의 이름을 qParentName으로 서버에 전달 --%>
                
                <input type="hidden" name="qParentName" value="${reply_view.qName}">

                <div class="reply-form-row">
                    <label class="reply-label">작성자</label>
                    
                    <input type="text" name="qName" class="reply-input-fixed" value="${sessionScope.userName}" readonly>
                </div>

                <div class="reply-form-row">
                    <label class="reply-label">제목</label>
                    <input type="text" name="qTitle" class="reply-input-field" value="Re: ${reply_view.qTitle}" required>
                </div>

                <div class="reply-form-row">
                    <label class="reply-label">답변 내용</label>
                    <textarea name="qContent" class="reply-textarea" placeholder="답변 내용을 상세하고 친절하게 작성해주세요." required></textarea>
                </div>

                <div class="reply-button-group">
                    <a href="${path}/qna/view?qId=${reply_view.qId}" class="reply-btn btn-cancel-style">취소</a>
                    <button type="submit" class="reply-btn btn-submit-style">답변 등록</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>