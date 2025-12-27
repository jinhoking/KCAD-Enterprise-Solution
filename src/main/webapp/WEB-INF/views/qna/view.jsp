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
<title>${board.qTitle}- KCAD</title>

<link rel="stylesheet" href="${path}/resources/css/board_qna/board_view.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div class="view-wrapper">
		<div class="board-card">

			<div class="view-header">
				<h2 class="view-title">${board.qTitle}</h2>
				<div class="view-info">
					<div class="info-left">
						<span>작성자: <strong>${board.qName}</strong></span> <span>날짜:
							<fmt:formatDate value="${board.qDate}" pattern="yyyy.MM.dd HH:mm" />
						</span>
					</div>
					<div class="info-right">
						<span>조회수: <strong>${board.qHit}</strong></span>
					</div>
				</div>
			</div>

			<div class="view-content">
				<div class="content-text">${board.qContent}</div>
			</div>

			<div class="view-btn-group">
				<a href="${path}/qna/list" class="btn btn-list">목록</a>

				<c:if test="${sessionScope.userName == 'admin'}">
					<a href="${path}/qna/reply_view?qId=${board.qId}"
						class="btn btn-submit" style="background: #0696d7; color: white;">답변작성</a>
				</c:if>

				<c:if test="${sessionScope.userName == board.qName}">
					<a href="${path}/qna/modify_view?qId=${board.qId}"
						class="btn btn-modify">수정</a>
					<a href="${path}/qna/delete?qId=${board.qId}"
						onclick="return confirm('정말 삭제하시겠습니까?');" class="btn btn-delete">삭제</a>
				</c:if>
			</div>

		</div>
	</div>

</body>
</html>