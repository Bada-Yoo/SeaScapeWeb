<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 날짜 선택</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectDate.css">
</head>
<body>
  <nav class="user-nav">
    <div class="logo"><a href="${pageContext.request.contextPath}/index.jsp">SeaScape</a></div>
    
    <ul>
	    <li><a href="${pageContext.request.contextPath}/reservation">예약하기</a></li>
	    <li><a href="${pageContext.request.contextPath}/reservation/check">예약확인</a></li>
	    <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
	    <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
    </ul>
  </nav>

  <div class="container">
    <div class="image-section">
      <img src="${pageContext.request.contextPath}/images/${store}.jpg" alt="매장 이미지">
      <h2>${store}점</h2>
    </div>

    <div class="date-section">
      <h3>예약 가능한 날짜</h3>
      <ul>
        <c:forEach var="date" items="${availableDates}">
          <li>
            <form action="${pageContext.request.contextPath}/reservation/selectRoom" method="get">
              <input type="hidden" name="store" value="${store}">
              <input type="hidden" name="date" value="${date}">
              <button type="submit">${date}</button>
            </form>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>
</body>
</html>
