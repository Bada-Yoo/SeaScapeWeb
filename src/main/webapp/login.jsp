<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
  <div class="login-container">
    <h2>SeaScape 통합 로그인</h2>
    <form method="post" action="login">
      <label for="role">역할 선택:</label>
      <select name="role" id="role">
        <option value="user">유저</option>
        <option value="creator">제작자</option>
        <option value="store">가맹점</option>
        <option value="admin">본사</option>
      </select>

      <label for="id">ID:</label>
      <input type="text" name="id" id="id" required>

      <label for="pw">PW:</label>
      <input type="password" name="pw" id="pw" required>

      <button type="submit">로그인</button>
    </form>

    <%
      String error = request.getParameter("error");
      if (error != null) {
    %>
      <div class="error">❌ 로그인 실패: <%= error %> 계정 확인</div>
    <%
      }
    %>
  </div>
</body>
</html>
