<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KCAD - 문의 수정</title>
    
    
    <link rel="stylesheet" href="${path}/resources/css/board_qna/board_write.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/nav.jsp" />

    <div class="write-wrapper">
        <div class="board-card">
            <h2 class="board-title">문의 내용 수정</h2>

            <form action="${path}/qna/modify" method="post">
                
                <input type="hidden" name="qId" value="${board.qId}">

                <div class="input-group">
                    <label>작성자</label>
                    <input type="text" class="input-field" value="${board.qName}" readonly 
                           style="background-color: #f9f9f9; color: #888; cursor: default;">
                </div>

                <div class="input-group">
                    <label for="qTitle">제목</label>
                    <input type="text" id="qTitle" name="qTitle" class="input-field" 
                           value="${board.qTitle}" required>
                </div>

                <div class="input-group">
                    <label for="qContent">내용</label>
                    <textarea id="qContent" name="qContent" class="input-field" required>${board.qContent}</textarea>
                </div>

                <div class="btn-group">
                    <a href="${path}/qna/view?qId=${board.qId}" class="btn btn-cancel">취소</a>
                    <button type="submit" class="btn btn-submit" style="background-color: #ffc107; color: #333; border:none;">수정 완료</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>