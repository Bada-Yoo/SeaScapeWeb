package scape.controller;

import scape.users.UsersDTO;
import scape.ReservationSchedule.ReservationScheduleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/reservation/submit")
public class SubmitServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        UsersDTO user = (UsersDTO) session.getAttribute("loginUser");
        String userId = user.getUSER_ID();

        // 파라미터 받기
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        int headcount = Integer.parseInt(request.getParameter("headcount"));

        // 예약 처리
        ReservationScheduleService service = new ReservationScheduleService();
        boolean success = service.reserve(scheduleId, userId, headcount);

        response.setContentType("text/html;charset=UTF-8");
        if (success) {
            response.getWriter().println("<script>alert('예약이 완료되었습니다!'); location.href='" + request.getContextPath() + "/user/dashboard.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('예약 실패! 다시 시도해주세요.'); history.back();</script>");
        }
    }
}
