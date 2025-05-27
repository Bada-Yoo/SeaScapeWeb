<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이페이지</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
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
    <li><a href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a></li>
  </ul>
</nav>

<section>
  <h2>🙋 마이페이지</h2>
  <c:if test="${not empty user}">
    <div class="highlight-box">
      <ul>
        <li><strong>아이디:</strong> ${user.USER_ID}</li>
        <li><strong>비밀번호:</strong> ${user.USER_PW}</li>
        <li><strong>이름:</strong> ${user.USER_NAME}</li>
        <li><strong>닉네임:</strong> ${user.USER_NICKNAME}</li>
        <li><strong>나이:</strong> ${user.USER_AGE}세</li>
      </ul>
    </div>
  </c:if>
  
</section>
<div class="button-group">
  <a href="${pageContext.request.contextPath}/logout" class="btn logout-btn">로그아웃</a>
  <a href="${pageContext.request.contextPath}/user/delete" class="btn delete-btn">회원 탈퇴</a>
</div>


</body>
</html>
