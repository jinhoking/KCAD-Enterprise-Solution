<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>KCAD - 실시간 마크업</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/markup/markup.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/nav.jsp" />

    <div class="markup-container">
    <h2>📐 Drawing Markup System</h2>
    
    <div class="editor-area">
        <div id="canvas-wrapper">
            <img id="blueprint"
                src="${pageContext.request.contextPath}/img/${not empty param.filename ? param.filename : 'drawing.png'}"
                style="position: absolute; top: 0; left: 0; z-index: -1; width: 800px; height: 600px; object-fit: contain;">
            <canvas id="markupCanvas" width="800" height="600"></canvas>
        </div>

        <div class="toolbar">
            <label>DRAWING TOOLS</label>
            <button class="btn-tool active" id="pencilBtn" onclick="setTool('pencil')">✏️ 그리기</button>
            <button class="btn-tool" id="rectBtn" onclick="setTool('rect')">⬜ 사각형</button>
            <button class="btn-tool" id="circleBtn" onclick="setTool('circle')">⭕ 원형</button>
            <button class="btn-tool" id="memoBtn" onclick="setTool('memo')">📝 메모 추가</button>
            
            <hr style="width:100%; border:0; border-top:1px solid #555;">
            <button class="btn-back" onclick="undo()">↩️ 되돌리기</button>

            <label>SETTINGS</label>
            <input type="color" id="colorPicker" value="#ff0000"> 
            <input type="range" id="lineWidth" min="1" max="15" value="3">
            
            <hr style="width:100%; border:0; border-top:1px solid #555;">
            <button class="btn-clear" onclick="clearCanvas()">🗑️ 전체 삭제</button>
            <button class="btn-save" onclick="saveMarkup()">💾 마크업 저장</button>
        </div>
    </div>
</div>
<script>
    // JS 파일이 읽기 전에 전역 변수로 경로를 설정합니다.
    const contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${path}/resources/js/markup/markup.js"></script>
            </body>
            </html>