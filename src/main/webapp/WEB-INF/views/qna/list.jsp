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
<title>KCAD - 고객센터</title>
<%-- 자유게시판과 동일한 CSS 로드 --%>
<link rel="stylesheet" href="${path}/resources/css/index.css">
<link rel="stylesheet"
	href="${path}/resources/css/board_qna/board_list.css">
<style>
/* 자유게시판 스타일 시트와 동일한 추가 스타일 정의 */
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
			<h2 class="board-title">고객 지원 (Q&A)</h2>

			<div class="board-header">
				<div class="total-count">
					▷ 총 <strong>${totalCount}</strong>개의 문의가 있습니다.
				</div>

				<form action="${path}/qna/list" method="get" class="search-box">
					<select name="searchType" class="search-select">
						<option value="title"
							${param.searchType == 'title' ? 'selected' : ''}>제목</option>
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
									등록된 문의글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="board">
								<%-- Q&A 공지사항 유무에 따른 클래스 적용 --%>
								<tr class="${board.qNotice == 'Y' ? 'notice-row' : ''}">
									<td><c:choose>
											<c:when test="${board.qNotice == 'Y'}">
												<span class="badge-notice">공지</span>
											</c:when>
											<c:otherwise>
                                                ${board.qId}
                                            </c:otherwise>
										</c:choose></td>

									<td class="title-col"><c:choose>
											<%-- 1. 비밀글(qSecret == 'Y')인 경우 --%>
											<c:when test="${board.qSecret == 'Y'}">
												<%-- 권한 체크: 관리자(admin)이거나, 글 작성자(qName)거나, 원글 작성자(qParentName)인 경우 --%>
												<c:choose>
													<c:when
														test="${sessionScope.userName == 'admin' || sessionScope.userName == board.qName || sessionScope.userName == board.qParentName}">
														<a href="${path}/qna/view?qId=${board.qId}"
															style="${board.qNotice == 'Y' ? 'font-weight:bold;' : ''}">
															${board.qTitle} 🔓 </a>
													</c:when>
													<%-- 권한이 없는 경우: 경고창을 띄우고 이동을 막음 --%>
													<c:otherwise>
														<a href="javascript:void(0);"
															onclick="alert('비밀글은 작성자와 관리자만 볼 수 있습니다.');"
															style="color: #999;"> 비밀글입니다. 🔒 </a>
													</c:otherwise>
												</c:choose>
											</c:when>

											<%-- 2. 비밀글이 아닌 일반글(공지 포함) --%>
											<c:otherwise>
												<a href="${path}/qna/view?qId=${board.qId}"
													style="${board.qNotice == 'Y' ? 'font-weight:bold;' : ''}">
													${board.qTitle} </a>
											</c:otherwise>
										</c:choose></td>

									<td>
										<div class="writer-info">
											<strong>${board.qName}</strong>
											<c:if test="${not empty board.qDept}">
												<span class="dept-job-tag">${board.qDept} /
													${board.qJob}</span>
											</c:if>
										</div>
									</td>

									<td><fmt:formatDate value="${board.qDate}"
											pattern="yyyy-MM-dd" /></td>
									<td>${board.qHit}</td>
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
							href="${path}/qna/list?page=${ph.beginPage-1}&searchType=${param.searchType}&keyword=${param.keyword}">◀
							이전</a>
					</c:if>

					<c:forEach begin="${ph.beginPage}" end="${ph.endPage}" var="i">
						<a
							href="${path}/qna/list?page=${i}&searchType=${param.searchType}&keyword=${param.keyword}"
							class="${ph.nowPage == i ? 'active' : ''}"> ${i} </a>
					</c:forEach>

					<c:if test="${ph.showNext}">
						<a
							href="${path}/qna/list?page=${ph.endPage+1}&searchType=${param.searchType}&keyword=${param.keyword}">다음
							▶</a>
					</c:if>
				</div>

				<a href="${path}/qna/write_view" class="btn-write">문의하기</a>
			</div>
		</div>
	</div>

</body>
</html>