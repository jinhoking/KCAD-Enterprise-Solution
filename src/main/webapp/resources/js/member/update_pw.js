/**
 * 
 */const form = document.getElementById('updatePwForm');
       const pw = document.getElementById('userPw');
       const pwConfirm = document.getElementById('userPwConfirm');
       const msg = document.getElementById('pwConfirmMsg');

       // 전송 시 최종 체크
       form.onsubmit = function(e) {
           if (pw.value !== pwConfirm.value) {
               alert("비밀번호가 일치하지 않습니다.");
               pwConfirm.focus();
               return false; // 폼 전송 막기
           }
           return true;
       };

       // 실시간 체크 (사용자 편의성)
       pwConfirm.onkeyup = function() {
           if (pw.value === "" || pwConfirm.value === "") {
               msg.innerHTML = "";
           } else if (pw.value === pwConfirm.value) {
               msg.style.color = "green";
               msg.innerHTML = "✔ 비밀번호가 일치합니다.";
           } else {
               msg.style.color = "red";
               msg.innerHTML = "✘ 비밀번호가 일치하지 않습니다.";
           }
       };