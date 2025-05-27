<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원 탈퇴 안내</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9f9f9;
      padding: 100px 20px;
      text-align: center;
      color: #333;
    }

    .delete-box {
      max-width: 600px;
      margin: 0 auto;
      background: white;
      padding: 2rem 2.5rem;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }

    h2 {
      color: #d32f2f;
      margin-bottom: 1rem;
    }

    p {
      font-size: 1rem;
      line-height: 1.6;
      margin-bottom: 2rem;
    }

    .confirm-input {
      margin: 1rem 0 2rem;
    }

    input[type="text"] {
      width: 100%;
      padding: 0.6rem;
      font-size: 1rem;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    .btn-group {
      display: flex;
      justify-content: center;
      gap: 1.5rem;
    }

    .btn {
      padding: 0.7rem 1.5rem;
      border: none;
      border-radius: 6px;
      font-size: 1rem;
      font-weight: bold;
      cursor: pointer;
      color: white;
      text-decoration: none;
    }

    .cancel-btn {
      background-color: #00bcd4;
    }

    .cancel-btn:hover {
      background-color: #0097a7;
    }

    .confirm-btn {
      background-color: #f44336;
    }

    .confirm-btn:hover {
      background-color: #d32f2f;
    }
  </style>

  <script>
    function handleDelete() {
      const input = document.getElementById("confirmInput").value.trim();
      if (input !== "계정을 삭제합니다") {
        alert("입력 문구가 정확하지 않습니다. 탈퇴를 취소하고 대시보드로 이동합니다.");
        location.href = '<%= request.getContextPath() %>/user/dashboard.jsp';
        return false;
      }
      location.href = '<%= request.getContextPath() %>/user/delete/confirm';
    }
  </script>
</head>
<body>
  <div class="delete-box">
    <h2>회원 탈퇴</h2>
    <p>
      가입된 회원정보가 모두 삭제됩니다.<br>
      작성하신 게시물은 삭제되지 않습니다.<br><br>
      탈퇴 후 같은 계정으로 재가입 시 기존에 가지고 있던 탈출이력은 복원되지 않으며,<br>
      사용 및 다운로드했던 쿠폰도 사용 불가능합니다.<br><br>
      <strong>정말 탈퇴하시려면 아래 문구를 정확히 입력해주세요.</strong>
    </p>

    <div class="confirm-input">
      <input type="text" id="confirmInput" placeholder='예: 계정을 삭제합니다'>
    </div>

    <div class="btn-group">
      <a href="${pageContext.request.contextPath}/index.jsp" class="btn cancel-btn">취소</a>
      <button class="btn confirm-btn" onclick="handleDelete()">탈퇴하기</button>
    </div>
  </div>
</body>
</html>
