<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>

<nav>
  <div class="logo">
    <a href="${pageContext.request.contextPath}/index.jsp">SeaScape</a>
  </div>
  <ul>
    <li><a href="${pageContext.request.contextPath}/reservation">예약하기</a></li>
    <li><a href="${pageContext.request.contextPath}/reservation/check">예약확인</a></li>
    <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
  </ul>
</nav>

<section class="register-section user-section">
  <div class="register-card">
    <h2>👤 유저 회원가입</h2>
    <form action="${pageContext.request.contextPath}/register" method="post">
      <input type="hidden" name="type" value="user">
      <label>아이디 <input type="text" name="user_id" required></label>
      <label>비밀번호 <input type="password" name="user_pw" required></label>
      <label>이름 <input type="text" name="user_name" required></label>
      <label>닉네임 <input type="text" name="user_nickname" required></label>
      <label>나이 <input type="number" name="user_age" required></label>
      <button type="submit" class="btn user-btn">회원가입하기</button>
    </form>
  </div>
</section>

<section class="register-section creator-section">
  <div class="register-card">
    <h2>🧑‍💻 제작자 회원가입</h2>
    <form action="${pageContext.request.contextPath}/register" method="post">
      <input type="hidden" name="type" value="creator">
      <label>아이디 <input type="text" name="creator_id" required></label>
      <label>비밀번호 <input type="password" name="creator_pw" required></label>
      <label>닉네임 <input type="text" name="creator_nickname" required></label>
      <button type="submit" class="btn creator-btn">회원가입하기</button>
    </form>
  </div>
</section>

</body>
</html>
