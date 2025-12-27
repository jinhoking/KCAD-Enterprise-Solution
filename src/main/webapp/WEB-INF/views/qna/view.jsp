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
<title>${board.qTitle}-KCAD</title>
<link rel="stylesheet"
	href="${path}/resources/css/board_qna/board_view.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div class="view-wrapper">
		<div class="board-card">

			<div class="view-header">
				<h2 class="view-title">
					<c:if test="${board.qIndent > 0}">[답변] </c:if>
					${board.qTitle}
				</h2>
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
				<c:choose>
					<%-- 1. 권한 확인: 관리자이거나, 작성자 본인이거나, 원글 작성자인 경우 --%>
					<%-- [수정] userId를 userName으로 변경 --%>
					<c:when
						test="${sessionScope.userName == 'admin' || sessionScope.userName == board.qName || sessionScope.userName == board.qParentName}">
						<div class="content-text">${board.qContent}</div>
					</c:when>

					<%-- 2. 권한이 없는 사람이 비밀글을 보려고 할 때 --%>
					<c:when test="${board.qSecret == 'Y'}">
						<div class="lock-message"
							style="padding: 40px; text-align: center; background: #f9f9f9; color: #666; border-radius: 10px;">
							<p style="font-size: 30px; margin-bottom: 15px;">🔒</p>
							<p style="font-weight: bold;">비밀글입니다.</p>
							<p>작성자와 관리자만 열람할 수 있습니다.</p>
							<a href="${path}/qna/list" class="btn btn-list"
								style="display: inline-block; margin-top: 20px; background: #666; color: #fff; padding: 10px 20px; text-decoration: none;">목록으로</a>
						</div>
					</c:when>

					<%-- 3. 일반 공개글 --%>
					<c:otherwise>
						<div class="content-text">${board.qContent}</div>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="view-btn-group">
				<a href="${path}/qna/list" class="btn btn-list">목록</a>

				<%-- 관리자만 답변 작성 가능 --%>
				<c:if test="${sessionScope.userName == 'admin'}">
					<a href="${path}/qna/reply_view?qId=${board.qId}"
						class="btn btn-submit" style="background: #0696d7; color: white;">답변작성</a>
				</c:if>

				<%-- 본인 글만 수정/삭제 가능 --%>
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