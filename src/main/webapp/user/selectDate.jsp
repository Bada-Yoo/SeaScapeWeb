<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 날짜 선택</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>
  <section>
    <h2>🗓️ ${store} 예약 가능한 날짜</h2>
    <c:choose>
      <c:when test="${not empty availableDates}">
        <ul>
          <c:forEach var="date" items="${availableDates}">
            <li>
              <form action="/reservation/room" method="get">
                <input type="hidden" name="store" value="${store}" />
                <input type="hidden" name="date" value="${date}" />
                <button type="submit">${date}</button>
              </form>
            </li>
          </c:forEach>
        </ul>
      </c:when>
      <c:otherwise>
        <p>📭 예약 가능한 날짜가 없습니다.</p>
      </c:otherwise>
    </c:choose>
  </section>
</body>
</html>
