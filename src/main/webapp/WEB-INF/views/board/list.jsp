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
<title>KCAD - 자유게시판</title>
<link rel="stylesheet" href="${path}/resources/css/index.css">
<link rel="stylesheet"
	href="${path}/resources/css/board_qna/board_list.css">
<style>
/* 부서/직무 정보를 위한 추가 스타일 */
.writer-info {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.dept-job-tag {
	display: inline-block;
	font-size: 11px;
	color: #777;
	background-color: #f1f3f5;
	padding: 2px 6px;
	border-radius: 4px;
	margin-top: 4px;
	border: 1px solid #e9ecef;
}

.notice-row {
	background-color: #fff9db !important; /* 공지사항 배경 강조 */
}

.badge-notice {
	background-color: #ff6b6b;
	color: white;
	padding: 2px 6px;
	border-radius: 3px;
	font-size: 11px;
	font-weight: bold;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div class="board-wrapper">
		<div class="board-card">
			<h2 class="board-title">공지사항 & 자유 게시판</h2>

			<div class="board-header">
				<div class="total-count">
					▷ 총 <strong>${totalCount}</strong>개의 게시물이 있습니다.
				</div>

				<form action="${path}/board/list" method="get" class="search-box">
					<select name="searchType" class="search-select">
						<option value="title"
							${param.searchType == 'title' ? 'selected' : ''}>제목</option>
						<option value="content"
							${param.searchType == 'content' ? 'selected' : ''}>내용</option>
						<option value="writer"
							${param.searchType == 'writer' ? 'selected' : ''}>작성자</option>
					</select> <input type="text" name="keyword" class="search-input"
						placeholder="검색어 입력" value="${param.keyword}">
					<button type="submit" class="search-btn">검색</button>
				</form>
			</div>

			<table class="board-table">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 45%;">
					<col style="width: 18%;">
					<col style="width: 17%;">
					<col style="width: 10%;">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자(소속)</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5"
									style="padding: 50px 0; text-align: center; color: #999;">
									등록된 게시글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="board">
								<tr class="${board.bNotice == 'Y' ? 'notice-row' : ''}">
									<td><c:choose>
											<c:when test="${board.bNotice == 'Y'}">
												<span class="badge-notice">공지</span>
											</c:when>
											<c:otherwise>
                                                ${board.bId}
                                            </c:otherwise>
										</c:choose></td>

									<td class="title-col"><a
										href="${path}/board/view?bId=${board.bId}"
										style="${board.bNotice == 'Y' ? 'font-weight:bold;' : ''}">
											${board.bTitle} </a> <c:if test="${board.replyCount > 0}">
											<span
												style="color: #e03131; font-weight: bold; font-size: 0.9em; margin-left: 5px;">
												[${board.replyCount}] </span>
										</c:if> <c:if test="${not empty board.fileName}">
											<span title="첨부파일 있음" style="cursor: help; margin-left: 5px;">💾</span>
										</c:if></td>

									<td>
										<div class="writer-info">
											<strong>${board.bName}</strong>
											<c:choose>
												<%-- 1. DB에 부서 정보가 있는 경우 (일반 사용자) --%>
												<c:when test="${not empty board.bDept}">
													<span class="dept-job-tag">${board.bDept} /
														${board.bJob}</span>
												</c:when>
												<%-- 2. DB에 정보가 없는데 작성자 이름이 admin인 경우 (관리자 예외 처리) --%>
												<c:when test="${board.bName == 'admin'}">
													<span class="dept-job-tag"
														style="background-color: #fff0f0; border-color: #ffd8d8; color: #e03131;">
														KCAD / 관리자 </span>
												</c:when>
											</c:choose>
										</div>
									</td>

									<td><fmt:formatDate value="${board.bDate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${board.bHit}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<div class="board-footer">
				<div class="pagination">
					<c:if test="${ph.showPrev}">
						<a
							href="${path}/board/list?page=${ph.beginPage-1}&searchType=${param.searchType}&keyword=${param.keyword}">◀
							이전</a>
					</c:if>

					<c:forEach begin="${ph.beginPage}" end="${ph.endPage}" var="i">
						<a
							href="${path}/board/list?page=${i}&searchType=${param.searchType}&keyword=${param.keyword}"
							class="${ph.nowPage == i ? 'active' : ''}"> ${i} </a>
					</c:forEach>

					<c:if test="${ph.showNext}">
						<a
							href="${path}/board/list?page=${ph.endPage+1}&searchType=${param.searchType}&keyword=${param.keyword}">다음
							▶</a>
					</c:if>
				</div>

				<a href="${path}/board/write_view" class="btn-write">글쓰기</a>
			</div>
		</div>
	</div>

</body>
</html>