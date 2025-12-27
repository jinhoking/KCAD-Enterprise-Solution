/**
 * Drawing Markup System Script
 */
let currentTool = 'pencil';
const canvas = document.getElementById('markupCanvas');
const ctx = canvas.getContext('2d');
const blueprint = document.getElementById('blueprint');
let painting = false;
let startX, startY;

// 되돌리기를 위한 스택(배열)
let undoStack = [];

window.onload = function() {
    if (blueprint.complete) { drawBackground(); } 
    else { blueprint.onload = drawBackground; }
    saveState(); // 초기 상태 저장
};

function drawBackground() {
    ctx.drawImage(blueprint, 0, 0, canvas.width, canvas.height);
}

// 현재 캔버스 상태 저장 (Undo용)
function saveState() {
    undoStack.push(canvas.toDataURL());
    if (undoStack.length > 20) undoStack.shift(); // 최대 20개까지 저장
}

function undo() {
    if (undoStack.length > 1) {
        undoStack.pop(); // 현재 상태 제거
        let previousState = undoStack[undoStack.length - 1];
        let img = new Image();
        img.src = previousState;
        img.onload = function() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.drawImage(img, 0, 0);
        };
    } else {
        alert("더 이상 되돌릴 수 없습니다.");
    }
}

function setTool(tool) {
    currentTool = tool;
    document.querySelectorAll('.btn-tool').forEach(btn => btn.classList.remove('active'));
    document.getElementById(tool + 'Btn').classList.add('active');
}

function startPosition(e) {
    const rect = canvas.getBoundingClientRect();
    startX = e.clientX - rect.left;
    startY = e.clientY - rect.top;

    if (currentTool === 'memo') {
        addMemo(e);
        return;
    }
    painting = true;
    if (currentTool === 'pencil') draw(e);
}

function finishedPosition(e) {
    if (!painting) return;
    const rect = canvas.getBoundingClientRect();
    const endX = e.clientX - rect.left;
    const endY = e.clientY - rect.top;

    ctx.lineWidth = document.getElementById('lineWidth').value;
    ctx.strokeStyle = document.getElementById('colorPicker').value;

    if (currentTool === 'rect') {
        ctx.strokeRect(startX, startY, endX - startX, endY - startY);
    } else if (currentTool === 'circle') {
        const radius = Math.sqrt(Math.pow(endX - startX, 2) + Math.pow(endY - startY, 2));
        ctx.beginPath();
        ctx.arc(startX, startY, radius, 0, Math.PI * 2);
        ctx.stroke();
    }
    
    if (painting) saveState(); // 작업 완료 후 상태 저장
    painting = false;
    ctx.beginPath();
}

function draw(e) {
    if (!painting || currentTool !== 'pencil') return;
    ctx.lineWidth = document.getElementById('lineWidth').value;
    ctx.lineCap = 'round';
    ctx.strokeStyle = document.getElementById('colorPicker').value;

    const rect = canvas.getBoundingClientRect();
    ctx.lineTo(e.clientX - rect.left, e.clientY - rect.top);
    ctx.stroke();
    ctx.beginPath();
    ctx.moveTo(e.clientX - rect.left, e.clientY - rect.top);
}

function addMemo(e) {
    const text = prompt("메모를 입력하세요:");
    if (text) {
        const color = document.getElementById('colorPicker').value;
        ctx.font = "bold 18px Arial";
        ctx.globalAlpha = 0.8;
        ctx.fillStyle = "#fff9c4";
        const textWidth = ctx.measureText(text).width;
        ctx.fillRect(startX - 5, startY - 22, textWidth + 10, 28);
        ctx.globalAlpha = 1.0;
        ctx.fillStyle = color;
        ctx.fillText(text, startX, startY);
        saveState(); // 메모 추가 후 저장
    }
}

canvas.addEventListener('mousedown', startPosition);
canvas.addEventListener('mouseup', finishedPosition);
canvas.addEventListener('mousemove', draw);

function clearCanvas() {
    if(confirm("모두 지우시겠습니까?")) {
        drawBackground();
        saveState();
    }
}

/**
 * [수정됨] 서버에 마크업 데이터 저장
 */
function saveMarkup() {
    const tempCanvas = document.createElement('canvas');
    tempCanvas.width = 800;
    tempCanvas.height = 600;
    const tempCtx = tempCanvas.getContext('2d');

    try {
        tempCtx.drawImage(blueprint, 0, 0, tempCanvas.width, tempCanvas.height);
        tempCtx.drawImage(canvas, 0, 0, tempCanvas.width, tempCanvas.height);
        
        const imageData = tempCanvas.toDataURL('image/png');

        const title = prompt("저장할 마크업의 제목을 입력하세요", "도면 검토 의견");
        if (!title) return;

        // 핵심: JSP에서 넘겨준 contextPath 변수를 사용하여 URL 구성
        fetch(contextPath + '/markup/save', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json; charset=UTF-8' },
            body: JSON.stringify({ imgData: imageData, title: title })
        })
        .then(res => {
            if (!res.ok) throw new Error('Network response was not ok');
            return res.json();
        })
        .then(data => {
            if (data.result === 'success') {
                alert('마크업이 성공적으로 저장되었습니다!');
                // 핵심: 이동 경로도 변수 처리
                location.href = contextPath + '/markupList';
            } else {
                alert('저장에 실패했습니다.');
            }
        })
        .catch(err => {
            console.error('Fetch Error:', err);
            alert("서버 통신 중 오류가 발생했습니다.");
        });
    } catch (e) {
        console.error('Canvas Error:', e);
        alert("이미지 처리 중 오류가 발생했습니다. (이미지 로딩 문제일 수 있습니다)");
    }
}