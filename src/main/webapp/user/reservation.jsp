<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>SeaScape 유저 대시보드</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reserve.css">
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

  <section id="reserve">
    <h2>📍 예약 가능한 매장</h2>
    <div class="store-list">
      <c:forEach var="store" items="${storeList}">
        <div class="store-card">
		  <img src="${pageContext.request.contextPath}/images/${store.LOCATION}.jpg" alt="매장 이미지" class="store-img" />
		
		  <div class="store-info">
		    <h3>${store.LOCATION}</h3>
		    <p>매장 규모: ${store.SIZE_LIMIT}</p>
		
		    <c:set var="themes" value="${roomThemes[store.LOCATION]}" />
		    <c:if test="${not empty themes}">
		      <p>테마: 
				  <c:forEach var="theme" items="${roomThemes[store.LOCATION]}" varStatus="loop">
				    ${theme}<c:if test="${!loop.last}">, </c:if>
				  </c:forEach>
				  ..등
				</p>
		    </c:if>
		
		    <form action="${pageContext.request.contextPath}/reservation/date" method="get">
		      <input type="hidden" name="store" value="${store.LOCATION}">
		      <button type="submit">예약</button>
		    </form>
		  </div>
		</div>
      </c:forEach>
    </div>
  </section>
</body>
</html>