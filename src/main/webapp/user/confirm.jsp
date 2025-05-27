<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예약 확인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/confirm.css">
</head>
<body>
  <div class="confirm-container">
    <h2>📝 예약 정보 확인</h2>
    <form action="${pageContext.request.contextPath}/reservation/submit" method="post">
      <div class="info-box">
        <p><strong>방 이름:</strong> ${roomName}</p>
        <p><strong>예약일:</strong> ${date}</p>
        <p><strong>예약 시간:</strong> ${time}</p>
        <p><strong>게임 시간:</strong> ${limitTime}분</p>
        <p><strong>예약자 이름:</strong> ${userName}</p>
      </div>

      <!-- 예약 정보 hidden -->
      <input type="hidden" name="roomName" value="${roomName}">
      <input type="hidden" name="date" value="${date}">
      <input type="hidden" name="time" value="${time}">
      <input type="hidden" name="limitTime" value="${limitTime}">
      <input type="hidden" name="userName" value="${userName}">
      <input type="hidden" name="scheduleId" value="${scheduleId}">

      <!-- 인원 수 입력 -->
      <label for="headcount">👥 예약 인원 수:</label>
      <input type="number" id="headcount" name="headcount" required min="1" max="10">

      <button type="submit">예약하기</button>
    </form>

    <div class="notice-box">
      <h4>💬 예약 안내</h4>
      <ul>
        <li>※ 1000-3626-9033 [토스뱅크] / 예금주: 바다 - 예약금 : 2만원</li>
        <li>※ 예약금은 모든 요일(평일, 주말, 공휴일) 입금해주셔야 합니다.</li>
        <li>※ 당일 취소시에는 선결제액 환불이 되지 않으니 주의바랍니다.</li>
        <li>※ 예약 취소 시 게임 시작시간 기준 24시간 이전 예약금 건만 환불됩니다.</li>
        <li>※ 예약금만 선결제 하신 경우에는, 현장에서 선결제하신 예약금을 제외한 차액만 추가 결제하시면 됩니다.</li>
        <li>※ 음주시 이용제한이 될 수 있으니 양해부탁드립니다.</li>
        <li>※ 입장 시간보다 초과시 시간 차감됩니다.(10분 이후부터는 노쇼로 간주됩니다)</li>
      </ul>
    </div>
  </div>
</body>
</html>
