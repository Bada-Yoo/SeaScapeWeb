<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 내역 확인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/check.css">
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

<section class="section-gap">
  <div class="inner">
    <h2>📄 예약 내역</h2>
    <c:choose>
      <c:when test="${not empty reservationList}">
        <c:forEach var="res" items="${reservationList}">
		  <div class="store-card">
		    <div class="store-img" style="background-image: url('${pageContext.request.contextPath}/images/${res.store}.jpg');"></div>
		    <div class="store-info">
		      <h3>🧩 ${res.room}</h3>
		      <p><strong>지점:</strong> ${res.store}</p>
		      <p><strong>장르:</strong> ${res.genre}</p>
		      <p><strong>예약일:</strong> ${res.date} / ${res.time}</p>
		      <p><strong>인원:</strong> ${res.people}명</p>
		      <p><strong>1인 가격:</strong> ${res.price}원</p>
		      <p><strong>총 결제 금액:</strong> <strong>${res.total}원</strong></p>
		    </div>
		  </div>
		</c:forEach>
      </c:when>
      <c:otherwise>
        <p>예약 내역이 없습니다.</p>
      </c:otherwise>
    </c:choose>
  </div>
</section>
</body>
</html>
