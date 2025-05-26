<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>SeaScape 유저 대시보드</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <style>
    .carousel-container {
      position: relative;
      max-width: 900px;
      margin: auto;
      overflow: hidden;
    }
    .carousel-track {
      display: flex;
      transition: transform 0.5s ease-in-out;
    }
    .store-card {
      flex: 0 0 100%;
      display: flex;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      align-items: center;
      justify-content: space-between;
      padding: 2rem;
    }
    .store-img {
      width: 40%;
      height: 250px;
      object-fit: cover;
      border-radius: 8px;
    }
    .store-info {
      flex: 1;
      padding-left: 2rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    .store-info h3 {
      font-size: 1.8rem;
      margin-bottom: 1rem;
    }
    .store-info p {
      font-size: 1.1rem;
      margin-bottom: 1rem;
    }
    .store-info form {
      align-self: flex-end;
    }
    .store-info button {
      background-color: #00bcd4;
      color: white;
      border: none;
      padding: 0.6rem 1.4rem;
      font-size: 1rem;
      border-radius: 6px;
      cursor: pointer;
    }
    .carousel-btn {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background-color: rgba(0, 0, 0, 0.4);
      color: white;
      border: none;
      padding: 0.5rem 1rem;
      cursor: pointer;
      z-index: 2;
    }
    .prev-btn {
      left: 10px;
    }
    .next-btn {
      right: 10px;
    }
  </style>
</head>
<body>
  <nav class="user-nav">
    <div class="logo">SeaScape</div>
    <ul>
      <li><a href="#reserve">예약하기</a></li>
      <li><a href="#history">예약확인</a></li>
      <li><a href="logout.jsp">로그아웃</a></li>
      <li><a href="deleteAccount.jsp">계정삭제</a></li>
    </ul>
  </nav>

  <section id="reserve">
    <h2>📍 예약 가능한 매장</h2>

    <c:choose>
      <c:when test="${not empty storeList}">
        <div class="carousel-container">
          <button class="carousel-btn prev-btn" onclick="moveSlide(-1)">&#10094;</button>
          <div class="carousel-track" id="carouselTrack">
            <c:forEach var="store" items="${storeList}">
              <div class="store-card">
                <img src="${pageContext.request.contextPath}/images/${store.LOCATION}.jpg" alt="매장 이미지" class="store-img" />
                <div class="store-info">
                  <h3>${store.LOCATION}</h3>
                  <p>최대 인원: ${store.SIZE_LIMIT}명</p>
                  <form action="${pageContext.request.contextPath}/reservation/date" method="get">
                    <input type="hidden" name="store" value="${store.LOCATION}">
                    <button type="submit">예약</button>
                  </form>
                </div>
              </div>
            </c:forEach>
          </div>
          <button class="carousel-btn next-btn" onclick="moveSlide(1)">&#10095;</button>
        </div>
      </c:when>
      <c:otherwise>
        <p>⚠️ 예약 가능한 매장이 없습니다.</p>
      </c:otherwise>
    </c:choose>
  </section>

  <section id="history">
    <h2>📄 예약 내역 확인 및 취소</h2>
    <p>이 영역은 추후 예약기록 출력 후 각 항목마다 취소 버튼을 구현합니다.</p>
  </section>

  <script>
    let currentSlide = 0;
    function moveSlide(step) {
      const track = document.getElementById('carouselTrack');
      const totalSlides = track.children.length;
      currentSlide = (currentSlide + step + totalSlides) % totalSlides;
      track.style.transform = `translateX(-${currentSlide * 100}%)`;
    }
  </script>
</body>
</html>
