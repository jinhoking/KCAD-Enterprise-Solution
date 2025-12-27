<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KCAD - 정밀 설계의 표준</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/swipper.css">

</head>
<body>
    <jsp:include page="nav.jsp" />
	<div id="wrapper">
		<header class="main-header">
			<div class="logo">
				<img
					src="${pageContext.request.contextPath}/resources/img/klogo.png"
					alt="K캐드 로고">
			</div>
			<h1>팀을 하나로 잇는 설계 협업의 새로운 기준</h1>
			<p>실시간 마크업부터 클라우드 갤러리까지, KCAD의 협업 솔루션을 경험해보세요.</p>
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

<section class="why-kcad-section">
        <div class="text-content">
            <h2>| 기업 전용 설계 보안 인프라</h2><br>
            <p>
                KCAD는 각 기업의 아이덴티티를 반영한 독립적인 설계 협업 환경을 구축해 드립니다. 
                강력한 <strong>기업 대조 로그인 보안</strong>을 통해 외부인의 접근을 원천 차단하며, 
                사전에 승인된 팀원들만이 안전하게 도면을 공유하고 마크업할 수 있는 최적화된 폐쇄형 솔루션을 제공합니다.
            </p>
            <div class="cta-group">
                <a href="${pageContext.request.contextPath}/intro" class="cta-button">솔루션 상세 소개 보기</a>
            </div>
        </div>
        <div class="image-content">
            <img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?q=80&w=2940"
                 alt="보안 클라우드 시스템을 사용하는 전문가 모습">
        </div>
    </section>

    

		<section class="partner-banner">
			<h2 style="display: block; width: 100%; text-align: center; font-style: oblique; position: relative; top: -30px; margin: 0 auto 0 auto; font-family: serif; font-weight: bold; font-size: 3em; color: #333;">
    Partners
</h2>
			<div class="swiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img
							src="${pageContext.request.contextPath}/resources/img/autocad_logo.PNG"
							alt="Partner 1">
					</div>
					<div class="swiper-slide">
						<img
							src="${pageContext.request.contextPath}/resources/img/logo_sw.png"
							alt="Partner 2">
					</div>
					<div class="swiper-slide">
						<img
							src="${pageContext.request.contextPath}/resources/img/Dassault_systemes_logo.png"
							alt="Partner 3">
					</div>
					<div class="swiper-slide">
						<img
							src="${pageContext.request.contextPath}/resources/img/sketchup.PNG"
							alt="Partner 4">
					</div>
					<div class="swiper-slide">
						<img
							src="${pageContext.request.contextPath}/resources/img/adobe.PNG"
							alt="Partner 5">
					</div>
					<div class="swiper-slide">
						<img
							src="${pageContext.request.contextPath}/resources/img/logo_revit.png"
							alt="Partner 6">
					</div>
				</div>
			</div>
		</section>

		<footer>
			<p>© 2025 Kdesk, Inc. All rights reserved.</p>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script>
		const swiper = new Swiper('.swiper', {
			loop : true, // 무한 반복
			slidesPerView : 5, // 한 번에 5개 보여주기 (PC 기준)
			spaceBetween : 30, // 간격
			centeredSlides : false, // ◀ [중요] 이걸 false로 해야 왼쪽부터 차례대로 나옵니다.

			autoplay : {
				delay : 2000, // 2초마다 넘기기 (속도 조절)
				disableOnInteraction : false,
			},

			// 반응형 (모바일 사이즈 조절)
			breakpoints : {
				320 : {
					slidesPerView : 2,
					spaceBetween : 10
				}, // 모바일
				768 : {
					slidesPerView : 3,
					spaceBetween : 20
				}, // 태블릿
				1024 : {
					slidesPerView : 5,
					spaceBetween : 30
				}
			// PC
			}
		});
	</script>
</body>
</html>