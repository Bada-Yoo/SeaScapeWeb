package scape.controller;

import scape.users.UsersDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/mypage")
public class MyPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 세션에서 로그인 정보 가져오기
        HttpSession session = request.getSession(false);
        UsersDTO user = (session != null) ? (UsersDTO) session.getAttribute("loginUser") : null;

        // 로그인 되어있지 않으면 로그인 페이지로 이동
        if (user == null) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('로그인이 필요합니다.'); location.href='" 
                    + request.getContextPath() + "/login.jsp';</script>");
            return;
        }

        // 로그인된 사용자 정보 request에 저장
        request.setAttribute("user", user);

        // 마이페이지 JSP로 이동
        request.getRequestDispatcher("/user/mypage.jsp").forward(request, response);
    }
}
