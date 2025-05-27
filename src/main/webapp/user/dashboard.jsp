<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>SeaScape 대시보드</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
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

<section class="main-intro-box" id="welcome">
  <div class="inner">
    <h1>방탈출, 그 이상의 경험</h1>
    <p>지금 바로 테마를 확인하고 예약하세요!</p>
    <a class="action-btn" href="${pageContext.request.contextPath}/reservation">예약하러 가기</a>
  </div>
</section>

<section class="comnotice section-gap">
  <div class="container active1">
    <h2 class="maintitle">NOTICE</h2>
    <p>노약자, 임산부, 폐쇄공포증, 보호자 미동반 어린이,<br>음주자는 입장이 제한됩니다.</p>
    <ul class="comnotice-wrap">
      <li>
        <div class="comnotice-item">
          <img src="https://xn--2e0b040a4xj.com/images/main/icon1.png" alt="도착시간">
          <h3>도착시간 엄수</h3>
          <p>게임 준비와 설명을 위하여<br>게임 시작 최소 10분 전에<br>도착해주셔야 합니다.</p>
        </div>
      </li>
      <li>
        <div class="comnotice-item">
          <img src="https://xn--2e0b040a4xj.com/images/main/icon2.png" alt="스포금지">
          <h3>스포금지</h3>
          <p>테마 내의 모든 내용 및 문제는<br>다른 손님들을 위해<br>유출을 절대 금지합니다.</p>
        </div>
      </li>
      <li>
        <div class="comnotice-item">
          <img src="https://xn--2e0b040a4xj.com/images/main/icon3.png" alt="촬영 금지">
          <h3>촬영 금지 및 소지품 보관</h3>
          <p>소품 및 인테리어는 콘텐츠<br>보호를 위해 촬영을 금지하며<br>입장 전 보관함에 맡겨주세요.</p>
        </div>
      </li>
      <li>
        <div class="comnotice-item">
          <img src="https://xn--2e0b040a4xj.com/images/main/icon4.png" alt="CCTV 녹화 중">
          <h3>CCTV 녹화 중</h3>
          <p>안전한 게임 진행을 위해<br>모든 구간은 CCTV로<br>녹화되고 있습니다.</p>
        </div>
      </li>
    </ul>
  </div>
</section>

<footer class="footer-box section-gap">
  <div class="inner">
    <div class="footer-logo">SeaScape 방탈출</div>
    <p>상호 : 주식회사 씨스케이프</p>
    <p>사업자등록번호 : 391-16-09470</p>
    <p>주소 : 서울특별시 마포구 와우길 12, 2층</p>
    <p class="slogan">Like all great travellers,<br>I have seen more than I remember,<br>and remember more than I have seen!</p>
    <ul class="footer-links">
      <li><a href="#">예약</a></li>
      <li><a href="#">오시는길</a></li>
      <li><a href="#">개인정보처리방침</a></li>
    </ul>
    <p class="copyright">&copy; 2025 SeaScape Room. All rights reserved.</p>
  </div>
</footer>
</body>
</html>