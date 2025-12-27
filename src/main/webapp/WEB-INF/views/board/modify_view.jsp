<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KCAD - 게시글 수정</title>


<link rel="stylesheet" href="${path}/resources/css/board_qna/board_write.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div class="write-wrapper">
		<div class="board-card">
			<h2 class="board-title">게시글 수정</h2>

			<form action="${path}/board/modify" method="post">

				<input type="hidden" name="bId" value="${board.bId}">

				<div class="input-group">
					<label>작성자 정보</label>
					<div
						style="padding: 10px; background: #f9f9f9; border: 1px solid #ddd; border-radius: 4px; color: #666;">
						<strong>${board.bName}</strong> (${board.bDept} / ${board.bJob})
					</div>
				</div>

				<div class="input-group">
					<label for="bTitle">제목</label> <input type="text" id="bTitle"
						name="bTitle" class="input-field" value="${board.bTitle}" required>
				</div>

				<div class="input-group">
					<label for="bContent">내용</label>
					<textarea id="bContent" name="bContent" class="input-field"
						required>${board.bContent}</textarea>
				</div>

				<div class="btn-group">
					<a href="${path}/board/view?bId=${board.bId}"
						class="btn btn-cancel">취소</a>

					<button type="submit" class="btn btn-submit"
						style="background-color: #ffc107; color: #333; border: none;">수정
						완료</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>