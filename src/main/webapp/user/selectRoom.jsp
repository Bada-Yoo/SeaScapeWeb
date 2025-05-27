<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 가능한 테마</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectRoom.css">
</head>
<body>

  <!-- 상단 네비게이션 -->
  <nav class="user-nav">
    <div class="logo"><a href="${pageContext.request.contextPath}/index.jsp">SeaScape</a></div>
    <ul>
	    <li><a href="${pageContext.request.contextPath}/reservation">예약하기</a></li>
	    <li><a href="${pageContext.request.contextPath}/reservation/check">예약확인</a></li>
	    <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
	    <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
    </ul>
  </nav>

  <div class="main-wrapper">
    <!-- 왼쪽 매장 정보 -->
    <div class="store-summary">
      <h2 class="store-name">${store}점</h2>
      <hr class="store-divider">
      <img src="${pageContext.request.contextPath}/images/${store}.jpg" alt="${store} 매장 이미지">
      <p class="store-date">예약일: ${date}</p>
    </div>

    <!-- 오른쪽 테마 리스트 -->
    <div class="theme-list">
      <c:forEach var="entry" items="${roomMap}">
        <c:set var="room" value="${entry.key}" />
        <c:set var="scheduleList" value="${entry.value}" />

        <div class="theme-card">
          <!-- 테마 정보 -->
          <div class="theme-info">
            <h3>${room.ROOM_NAME}</h3>
            <p><strong>장르:</strong> ${room.GENRE}</p>
            <p><strong>제한시간:</strong> ${room.LIMIT_TIME}분</p>
            <p><strong>가격:</strong> ${room.PRICE}원</p>
            <p><strong>19금 여부:</strong>
              <c:choose>
                <c:when test="${room.IS_19 == 1}">🔞 19세 이상</c:when>
                <c:otherwise>✔ 일반</c:otherwise>
              </c:choose>
            </p>
            <p><strong>시놉시스:</strong> ${room.SYNOPSIS}</p>
          </div>

          <!-- 점선 구분선 -->
          <div class="divider"></div>

          <!-- 예약 시간 -->
          <div class="time-slots">
            <h4>🕒 예약 가능 시간</h4>
            <c:forEach var="s" items="${scheduleList}">
              <form action="${pageContext.request.contextPath}/reservation/confirm" method="get">
                <input type="hidden" name="roomId" value="${room.ROOM_ID}">
                <input type="hidden" name="roomName" value="${room.ROOM_NAME}">
                <input type="hidden" name="limitTime" value="${room.LIMIT_TIME}">
                <input type="hidden" name="date" value="${date}">
                <input type="hidden" name="time" value="${s.RESERVATION_TIME}">
                <input type="hidden" name="scheduleId" value="${s.SCHEDULE_ID}">
                <button type="submit">${s.RESERVATION_TIME}</button>
              </form>
            </c:forEach>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</body>
</html>
