<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KCAD - 솔루션 소개</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/intro.css">
</head>
<body>
    <jsp:include page="nav.jsp" />

    <div class="intro-container">
        <header class="intro-header">
            <h1>Enterprise Solution</h1>
            <p>팀의 규모가 커질수록, 보안과 협업은 더 강력해져야 합니다.<br>
               KCAD는 오직 귀사만을 위한 <strong>독립적인 설계 데이터 인프라</strong>를 구축합니다.</p>
        </header>
        

        <div class="solution-grid">
            <div class="solution-card">
                <span class="icon">🏢</span>
                <h3>전용 도메인 및 브랜딩</h3>
                <p>각 기업별 고유 URL(/solution/ID)을 제공하며, 접속 시 기업 로고와 UI 테마가 자동으로 적용됩니다. 단순한 협업 도구를 넘어 귀사의 디지털 자산을 담는 전용 공간이 됩니다.</p>
            </div>

            <div class="solution-card">
                <span class="icon">🔒</span>
                <h3>폐쇄형 소속 확인 보안</h3>
                <p>계정 유출이 발생하더라도 타사 인원의 접속을 원천 차단합니다. 로그인 시 사용자의 소속 코드와 접속 경로를 실시간 대조하여 비인가자의 접근을 엄격히 통제합니다.</p>
            </div>

            <div class="solution-card">
                <span class="icon">👥</span>
                <h3>멤버 프로필 통합 협업</h3>
                <p>게시판 이용 시 작성자의 부서와 직함 정보가 실시간으로 결합됩니다. 누가 어떤 책임 하에 의견을 남겼는지 명확히 파악할 수 있어 협업의 투명성과 효율성을 극대화합니다.</p>
            </div>
        </div>

        <div style="display: flex; gap: 20px; margin-bottom: 80px; align-items: stretch;">
    
    <section class="security-banner" style="flex: 1; margin-bottom: 0; padding: 40px; display: flex; flex-direction: column; justify-content: center;">
        <h2 style="font-size: 1.5rem; margin-bottom: 15px;">Perfect Data Isolation</h2>
        <p style="font-size: 0.95rem; line-height: 1.6; text-align: center;">
            KCAD Enterprise는 데이터 격리 기술을 기반으로 설계되었습니다. 
            우리 회사의 게시글, 도면 데이터는 오직 우리 회사 임직원에게만 노출됩니다.
        </p>
    </section>

    <section style="flex: 1; background: #f8f9fa; border: 1px solid #dee2e6; border-radius: 20px; padding: 40px; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center;">
        <span style="font-size: 2.5rem; margin-bottom: 15px;">🚀</span>
        <h2 style="font-size: 1.5rem; color: #333; margin-bottom: 10px;">Experience Demo</h2>
        <p style="color: #666; font-size: 0.95rem; margin-bottom: 20px;">
            A건설 전용관 예시를 통해<br>
            맞춤형 브랜딩과 보안 환경을 직접 확인하세요.
        </p>
        <a href="${pageContext.request.contextPath}/solution/A_CONSTRUCT" 
           target="_blank" 
           style="display: inline-block; padding: 12px 25px; background: #007bff; color: white; border-radius: 10px; text-decoration: none; font-weight: bold; font-size: 0.9rem; transition: 0.3s; box-shadow: 0 4px 6px rgba(0,123,255,0.2);">
            A건설 전용관 바로가기 →
        </a>
    </section>
    
</div>

       <div class="cta-bottom" style="text-align: center;">
    <p style="margin-bottom: 20px; color: #888; font-size: 0.95rem;">귀사의 비즈니스에 최적화된 설계 환경을 지금 바로 상담하세요.</p>
    <a href="${pageContext.request.contextPath}/join" class="cta-button" style="padding: 15px 50px; font-size: 1.1rem; border-radius: 10px;">지금 파트너십 문의하기</a>
</div>
    </div>

    <footer style="text-align: center; padding: 40px; color: #999; border-top: 1px solid #eee;">
        <p>© 2025 Kdesk, Inc. All rights reserved.</p>
    </footer>
</body>
</html>