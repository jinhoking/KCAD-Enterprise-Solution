<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${board.bTitle}-KCAD</title>

<link rel="stylesheet" href="${path}/resources/css/board_qna/board_view.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div class="view-wrapper">
		<div class="board-card">

			<div class="view-header">
				<h2 class="view-title">${board.bTitle}</h2>
				<div class="view-info">
					<div class="info-left">
						<span>작성자: <strong>${board.bName}</strong> <small
							style="color: #888;">(${board.bDept} / ${board.bJob})</small>
						</span> <span>날짜: <fmt:formatDate value="${board.bDate}"
								pattern="yyyy.MM.dd HH:mm" /></span>
					</div>
					<div class="info-right">
						<span>조회수: <strong>${board.bHit}</strong></span>
					</div>
				</div>
			</div>

			<div class="view-content">
				<div class="content-text">${board.bContent}</div>

				<c:if test="${not empty board.fileName}">
					<div class="file-box">
						📂 첨부파일: <a href="${path}/resources/upload/${board.fileName}"
							download>${board.fileName}</a>
					</div>
				</c:if>
			</div>

			<div class="view-btn-group">
				<a href="${path}/board/list" class="btn btn-list">목록</a>

				<c:if test="${sessionScope.userName == board.bName}">
					<a href="${path}/board/modify_view?bId=${board.bId}"
						class="btn btn-modify">수정</a>
					<a href="${path}/board/delete?bId=${board.bId}"
						onclick="return confirm('정말 삭제하시겠습니까?');" class="btn btn-delete">삭제</a>
				</c:if>
			</div>

			<div class="reply-wrapper">
				<h3 class="reply-title">댓글</h3>

				<ul class="reply-list">
					<c:forEach var="reply" items="${replyList}">
						<li>
							<div class="reply-info">
								<strong>${reply.rName}</strong> <small
									style="color: #999; font-size: 0.85em;">(${reply.r_Dept}
									/ ${reply.r_Job})</small> <span class="reply-date"> <fmt:formatDate
										value="${reply.rDate}" pattern="yyyy-MM-dd HH:mm" />
								</span>
							</div>
							<div class="reply-text">${reply.rContent}</div>
						</li>
					</c:forEach>
				</ul>

				<c:if test="${not empty sessionScope.loginUser}">
					<form action="${path}/board/replyOk" method="post"
						class="reply-form">
						<input type="hidden" name="bId" value="${board.bId}">
						<textarea name="rContent" class="reply-input"
							placeholder="댓글을 남겨주세요." required></textarea>
						<button type="submit" class="reply-btn">등록</button>
					</form>
				</c:if>
			</div>

		</div>
	</div>

</body>
</html>