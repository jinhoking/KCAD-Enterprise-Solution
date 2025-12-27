<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마크업 수정하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/markup/markupModify.css">
</head>
<body>
	<jsp:include page="../nav.jsp" />
	<div class="modify-wrapper">
		<div class="modify-card">
			<div class="modify-header">
				<h2>📝 도면 정보 수정</h2>
			</div>

			<form action="${pageContext.request.contextPath}/modifyAction"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="b_no" value="${markup.b_no}">

				<div class="form-group">
					<label>제목</label> <input type="text" name="b_title"
						class="form-control" value="${markup.b_title}" required>
				</div>

				<div class="form-group">
					<label>작성자</label> <input type="text" name="b_writer"
						class="form-control" value="${markup.b_writer}" readonly>
					<small style="color: red;">* 작성자는 수정할 수 없습니다.</small>
				</div>
				<div class="form-group">
					<label>수정 코멘트</label>
					<textarea name="b_comment" class="form-textarea"
						placeholder="변경 사항을 입력해주세요. (예: 외벽 수치 오류 수정 등)">${markup.b_comment}</textarea>
				</div>
				<div class="form-group">
					<label>진행 상태 변경</label> <select name="b_status"
						class="form-control">
						<option value="검토중" ${markup.b_status == '검토중' ? 'selected' : ''}>🔍
							검토중</option>
						<option value="수정요청"
							${markup.b_status == '수정요청' ? 'selected' : ''}>⚠️ 수정요청</option>
						<option value="승인완료"
							${markup.b_status == '승인완료' ? 'selected' : ''}>✅ 승인완료</option>
						<option value="반려" ${markup.b_status == '반려' ? 'selected' : ''}>❌
							반려</option>
					</select>
					<small style="color: #666;">* 현재 공정 단계에 맞춰 상태를 업데이트해 주세요.</small>
				</div>
				<div class="form-group">
					<div class="current-img">
						<p style="font-size: 13px; color: #666;">기존 이미지</p>
						<img src="/img/${markup.b_filepath}"
							onerror="this.src='https://via.placeholder.com/150x100?text=No+Image'">
					</div>
				</div>

				<div class="btn-group">
					<button type="submit" class="btn btn-submit">수정 완료</button>
					<a href="markupDetail?b_no=${markup.b_no}" class="btn btn-cancel">취소</a>
				</div>
			</form>
		</div>
	</div>

</body>
</html>