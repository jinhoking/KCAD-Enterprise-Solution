<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>기업 전용 메인</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
</head>
<body style="padding-top: 100px;"> 
<jsp:include page="/WEB-INF/views/company/landing_nav.jsp" />
    <div id="wrapper">
    <header class="main-header">
			<div class="logo">
				<img
					src="${pageContext.request.contextPath}/resources/img/logos/a_logo.png"
					alt="A건설 로고">
			</div>
    <div style="text-align: center;">
        <h1>${currentComp.compName} 전용 클라우드입니다.</h1>
        <p>환영합니다! 이제 로그인하여 업무를 시작하세요.</p>
    </div>
    </header>
    
    <section class="features-section">
    <div class="feature-box">
        <a href="${pageContext.request.contextPath}/board/list" class="feature-link-box">
            <h2> | 공지사항 & 자유게시판</h2>
            <p>프로젝트의 주요 변경 사항과 팀내 공지사항을 신속하게 확인하세요. 자유게시판을 통해 설계 노하우와 기술 자료를 공유하며 팀 전체의 지식 자산을 함께 쌓아갈 수 있습니다.</p>
        </a>
    </div>

    <div class="feature-box">
        <a href="${pageContext.request.contextPath}/qna/list" class="feature-link-box">
            <h2>| 고객센터 (Q&A)</h2>
            <p>KCAD 사용 중 궁금한 점이나 기술적인 이슈가 발생하셨나요? 전문가의 신속한 답변과 상세 가이드를 통해 문제를 해결하고, 중단 없는 설계 환경을 유지할 수 있도록 지원합니다.</p>
        </a>
    </div>

    <div class="feature-box">
        <a href="${pageContext.request.contextPath}/markupUpload" class="feature-link-box">
            <h2> | 실시간 마크업 업로드</h2>
            <p>도면 위에 직접 수정 지시 사항을 작성하고 즉시 업로드하세요. 별도의 프로그램 설치 없이 웹에서 바로 마킹된 도면을 공유하여 불필요한 이메일 소통과 설계 검토 시간을 혁신적으로 단축합니다.</p>
        </a>
    </div>

    <div class="feature-box">
        <a href="${pageContext.request.contextPath}/markupList" class="feature-link-box">
            <h2> | 마크업 도면 공유 갤러리</h2>
            <p>팀원들이 업로드한 마크업 도면을 갤러리 형태로 한눈에 파악하세요. 프로젝트의 히스토리를 시각적으로 관리하고, 상태별 필터링 기능을 통해 현재 검토가 필요한 도면을 즉시 확인할 수 있습니다.</p>
        </a>
    </div>
</section>
</div>
</body>
</html>