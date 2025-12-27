<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마크업 갤러리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/markup/markupList.css">
</head>
<body>
    <jsp:include page="../nav.jsp" />

    <div class="gallery-wrapper">
        <div class="gallery-header">
            <h2>🖼️ 업로드된 마크업 갤러리</h2>
            <div class="header-right">
                <form action="markupList" method="get" class="search-form">
                    <select name="status" style="border: 1px solid #ddd; border-radius: 4px; padding: 0 10px;">
                        <option value="">전체 상태</option>
                        <option value="검토중" ${param.status == '검토중' ? 'selected' : ''}>🔍 검토중</option>
                        <option value="수정요청" ${param.status == '수정요청' ? 'selected' : ''}>⚠️ 수정요청</option>
                        <option value="승인완료" ${param.status == '승인완료' ? 'selected' : ''}>✅ 승인완료</option>
                        <option value="반려" ${param.status == '반려' ? 'selected' : ''}>❌ 반려</option>
                    </select>
                    <input type="text" name="keyword" placeholder="제목 검색..." value="${param.keyword}">
                    <button type="submit" class="btn-search">검색</button>
                </form>
                <a href="${pageContext.request.contextPath}/markupUpload" class="btn-register">신규 도면 등록</a>
            </div>
        </div>

        <div class="gallery-main-container">
            <c:choose>
                <c:when test="${ph.nowPage > 1}">
                    <a href="?page=${ph.nowPage - 1}&keyword=${param.keyword}&status=${param.status}" class="nav-arrow">〈</a>
                </c:when>
                <c:otherwise>
                    <a class="nav-arrow disabled">〈</a>
                </c:otherwise>
            </c:choose>

            <div class="markup-gallery">
                <c:forEach var="item" items="${list}">
                    <div class="markup-card">
                        <a href="${pageContext.request.contextPath}/markupDetail?b_no=${item.b_no}" class="card-img-box">
                            <img src="${pageContext.request.contextPath}/img/${item.b_filepath}" 
                                 onerror="this.src='${pageContext.request.contextPath}/resources/img/no_image.png'">
                        </a>
                        <div class="card-info">
                            <c:choose>
                                <c:when test="${item.b_status == '검토중'}"><span class="status-badge status-wait">🔍 검토중</span></c:when>
                                <c:when test="${item.b_status == '수정요청'}"><span class="status-badge status-ing">⚠️ 수정요청</span></c:when>
                                <c:when test="${item.b_status == '승인완료'}"><span class="status-badge status-ok">✅ 승인완료</span></c:when>
                                <c:when test="${item.b_status == '반려'}"><span class="status-badge status-no">❌ 반려</span></c:when>
                                <c:otherwise><span class="status-badge" style="background:#6c757d;">미지정</span></c:otherwise>
                            </c:choose>
                            <a href="${pageContext.request.contextPath}/markupDetail?b_no=${item.b_no}" class="card-title">${item.b_title}</a>
                            <div class="card-meta">
                                <span>👤 ${item.b_writer}</span>
                                <span>📅 <fmt:formatDate value="${item.b_regdate}" pattern="yyyy-MM-dd" /></span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:choose>
                <c:when test="${ph.nowPage < ph.totalPage}">
                    <a href="?page=${ph.nowPage + 1}&keyword=${param.keyword}&status=${param.status}" class="nav-arrow">〉</a>
                </c:when>
                <c:otherwise>
                    <a class="nav-arrow disabled">〉</a>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="pagination">
            <c:if test="${ph.showPrev}">
                <a href="?page=${ph.beginPage - 1}&keyword=${param.keyword}&status=${param.status}" class="page-item">이전</a>
            </c:if>
            
            <c:forEach var="num" begin="${ph.beginPage}" end="${ph.endPage}">
                <a href="?page=${num}&keyword=${param.keyword}&status=${param.status}" 
                   class="page-item ${num == ph.nowPage ? 'active' : ''}">${num}</a>
            </c:forEach>

            <c:if test="${ph.showNext}">
                <a href="?page=${ph.endPage + 1}&keyword=${param.keyword}&status=${param.status}" class="page-item">다음</a>
            </c:if>
        </div>
    </div>
</body>
</html>