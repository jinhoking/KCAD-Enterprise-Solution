<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>KCAD - 게시글 작성</title>
    <link rel="stylesheet" href="${path}/resources/css/board_qna/board_write.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/nav.jsp" />

    <div class="write-wrapper">
        <div class="board-card">
            <h2 class="board-title">게시글 작성</h2>

            <form action="${path}/board/write" method="post" enctype="multipart/form-data">

                <c:if test="${sessionScope.userName == 'admin'}">
                    <div class="notice-area">
                        <label style="display: flex; align-items: center; cursor: pointer;">
                            <input type="checkbox" id="noticeCheck" style="width: 18px; height: 18px; margin-right: 10px;"> 
                            <span style="font-size: 15px; color: #d9534f; font-weight: bold;">📢 공지사항으로 등록 (맨 위에 고정)</span>
                        </label> 
                        <input type="hidden" name="bNotice" id="bNotice" value="N">
                    </div>
                </c:if>

                <div class="input-group">
                    <label>작성자</label> 
                    <input type="text" class="input-field" value="${sessionScope.userName}" readonly>
                    <p style="font-size: 13px; color: #007bff; margin-top: 8px;">
                        * 소속: ${sessionScope.loginUser.userDept} / ${sessionScope.loginUser.userJob} 정보로 기록됩니다.
                    </p>
                </div>

                <div class="input-group">
                    <label for="bTitle">제목</label> 
                    <input type="text" id="bTitle" name="bTitle" class="input-field" placeholder="제목을 입력하세요" required>
                </div>

                <div class="input-group">
                    <label for="bContent">내용</label>
                    <textarea id="bContent" name="bContent" class="input-field" placeholder="내용을 입력하세요" required></textarea>
                </div>

                <div class="input-group">
                    <label for="post-file">첨부파일</label> 
                    <input type="file" id="post-file" name="file" class="input-field" style="background: #fff; padding: 10px;">
                </div>

                <div class="btn-group" style="display: flex; gap: 15px; margin-top: 40px;">
        <a href="${path}/board/list" class="btn btn-cancel" 
           style="flex: 1; height: 52px; background-color: #999; color: white; border-radius: 8px; font-weight: bold; display: flex; align-items: center; justify-content: center; text-decoration: none; font-size: 16px;">
           취소
        </a>
        <button type="submit" class="btn btn-submit" 
                style="flex: 2; height: 52px; background-color: #0696d7; color: white; border: none; border-radius: 8px; font-weight: bold; cursor: pointer; font-size: 16px; transition: background-color 0.2s;">
           등록하기
        </button>
    </div>
            </form>
        </div>
    </div>

    <script>
        const noticeCheck = document.getElementById('noticeCheck');
        if (noticeCheck) {
            noticeCheck.addEventListener('change', function() {
                document.getElementById('bNotice').value = this.checked ? 'Y' : 'N';
            });
        }
    </script>
</body>
</html>