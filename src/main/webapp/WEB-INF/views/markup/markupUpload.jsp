<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도면 업로드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/markup/markupUpload.css">

</head>
<body>

	<jsp:include page="/WEB-INF/views/nav.jsp" />

	<div class="upload-card">
		<h2>🎨 새 도면 마크업 시작</h2>
		<form action="${pageContext.request.contextPath}/uploadDrawing" method="post" enctype="multipart/form-data">
    <div class="input-group">
        <label>도면 명칭</label> 
        <input type="text" name="b_title" placeholder="예: 1층 전기 도면 수정" required>
    </div>

    <div class="input-group">
    <label>도면 분류 (Category)</label>
    <select name="b_category" required style="width: 100%; padding: 12px; border: 1px solid #e1e1e1; border-radius: 8px; background-color: #fdfdfd; box-sizing: border-box;">
        <option value="">-- 분류 선택 --</option>
        <option value="설계도">📐 설계도</option>
        <option value="현장사진">📸 현장사진</option>
        <option value="수정요청">✍️ 수정요청</option>
        <option value="기타">ETC</option>
    </select>
</div>

    <div class="input-group">
        <label>검토자(작성자)</label>
        <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
                <input type="text" name="b_writer" value="${sessionScope.loginUser.userName}" readonly>
            </c:when>
            <c:otherwise>
                <input type="text" value="로그인이 필요합니다" readonly style="color:red;">
            </c:otherwise>
        </c:choose>
    </div>

    <div class="input-group">
        <label>도면 파일 (Image)</label> 
        <input type="file" name="file" accept="image/*" required>
    </div>

    <button type="submit" class="btn-submit"
    ${empty sessionScope.loginUser ? 'disabled' : ''}>
    ${empty sessionScope.loginUser ? '로그인 후 이용 가능' : '도면 편집기 열기'}
</button>
</form>
	</div>

</body>
</html>