<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마크업 상세조회 - KCAD</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/markup/markupDetail.css">
</head>
<body>
<jsp:include page="../nav.jsp" />

<div class="container">
    <div class="header">
        <h2><span class="no-badge">NO. ${markup.b_no}</span> ${markup.b_title}</h2>
        <div class="meta">
            <span>📅 등록일: ${markup.b_regdate}</span>
            <span>👤 작성자: <strong>${markup.b_writer}</strong></span>
            
            <c:choose>
                <c:when test="${markup.b_job == '설계자'}">
                    <span class="role-badge role-designer">📐 설계자</span>
                </c:when>
                <c:when test="${markup.b_job == '현장담당자'}">
                    <span class="role-badge role-field">👷 현장담당자</span>
                </c:when>
                <c:otherwise>
                    <span class="role-badge role-general">👤 일반</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="img-container">
        <img src="/img/${markup.b_filepath}" onerror="this.src='https://via.placeholder.com/1000x600?text=No+Image+Available'">
    </div>

    <div class="info-section">
        <div class="info-row">
            <div class="info-label">문서 제목</div>
            <div class="info-value"><strong>${markup.b_title}</strong></div>
        </div>

<div class="info-row">
        <div class="info-label">진행 상태</div>
        <div class="info-value">
            <c:choose>
                <c:when test="${markup.b_status == '검토중'}">
                    <span class="status-badge status-wait" style="white-space: nowrap;">🔍 검토중</span>
                </c:when>
                <c:when test="${markup.b_status == '수정요청'}">
                    <span class="status-badge status-ing" style="white-space: nowrap;">⚠️ 수정요청</span>
                </c:when>
                <c:when test="${markup.b_status == '승인완료'}">
                    <span class="status-badge status-ok" style="white-space: nowrap;">✅ 승인완료</span>
                </c:when>
                <c:when test="${markup.b_status == '반려'}">
                    <span class="status-badge status-no" style="white-space: nowrap;">❌ 반려</span>
                </c:when>
                <c:otherwise>
                    <span class="status-badge" style="background:#6c757d; white-space: nowrap;">미지정 (${markup.b_status})</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

        <div class="info-row">
            <div class="info-label">작성자 정보</div>
            <div class="info-value">${markup.b_writer} (${not empty markup.b_job ? markup.b_job : '일반사용자'})</div>
        </div>

        <div class="info-row">
            <div class="info-label">데이터 경로</div>
            <div class="info-value" style="font-family: monospace; color: #007bff;">/img/${markup.b_filepath}</div>
        </div>

        <div class="info-row" style="flex-direction: column; align-items: flex-start;">
            <div class="info-label" style="margin-bottom: 10px; width: 100%;">수정 코멘트 및 검토 의견</div>
            <div class="info-value" style="background: #f9f9f9; padding: 20px; border-radius: 8px; border-left: 4px solid #28a745; line-height: 1.6; width: 100%; box-sizing: border-box;">
                <c:choose>
                    <c:when test="${not empty markup.b_comment}">
                        <c:out value="${markup.b_comment}" />
                    </c:when>
                    <c:otherwise>
                        <span style="color: #999; font-style: italic;">작성된 수정 코멘트가 없습니다.</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="info-row" style="border-bottom: none;">
            <div class="info-label">등록 일시</div>
            <div class="info-value">${markup.b_regdate}</div>
        </div>
    </div>
    

   <div class="btn-group">
    <c:if test="${sessionScope.userId == markup.b_writer || sessionScope.loginUser.userId == markup.b_writer}">
        <a href="markupModify?b_no=${markup.b_no}" class="btn btn-modify">수정하기</a>
        <button type="button" class="btn btn-delete" onclick="if(confirm('정말 삭제하시겠습니까?')) { location.href='markupDelete?b_no=${markup.b_no}'; }">삭제하기</button>
    </c:if>
    
    <a href="markupList" class="btn btn-list">목록으로</a>
</div>
</div>

</body>
</html>