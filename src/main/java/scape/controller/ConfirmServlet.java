package scape.controller;

import scape.users.UsersDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/reservation/confirm")
public class ConfirmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 로그인 확인
        HttpSession session = request.getSession(false);
        UsersDTO user = (session != null) ? (UsersDTO) session.getAttribute("loginUser") : null;

        if (user == null) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('로그인이 필요합니다.'); location.href='" + request.getContextPath() + "/login.jsp';</script>");
            return;
        }

        // 파라미터 수신
        String roomName = request.getParameter("roomName");
        String limitTime = request.getParameter("limitTime");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String scheduleIdStr = request.getParameter("scheduleId");

        request.setAttribute("roomName", roomName);
        request.setAttribute("limitTime", limitTime);
        request.setAttribute("date", date);
        request.setAttribute("time", time);
        request.setAttribute("scheduleId", scheduleIdStr);
        request.setAttribute("userName", user.getUSER_NAME());

        request.getRequestDispatcher("/user/confirm.jsp").forward(request, response);
    }
}
