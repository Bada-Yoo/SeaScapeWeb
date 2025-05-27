package scape.controller;

import scape.users.UsersService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/user/delete/confirm")
public class UserDeleteServlet2 extends HttpServlet {

    private final UsersService usersService = new UsersService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String userId = (session != null) ? (String) session.getAttribute("loginId") : null;

        response.setContentType("text/html;charset=UTF-8");

        if (userId != null) {
            String resultMessage = usersService.deleteAccount(userId); // ✅ 삭제 로직 실행

            if (resultMessage.contains("성공")) {
                if (session != null) session.invalidate(); // 세션 무효화
            }

            response.getWriter().println("<script>");
            response.getWriter().println("alert('" + resultMessage + "');");
            response.getWriter().println("location.href='" + request.getContextPath() + "/index.jsp';");
            response.getWriter().println("</script>");
        } else {
            response.getWriter().println("<script>");
            response.getWriter().println("alert('로그인이 필요합니다.');");
            response.getWriter().println("location.href='" + request.getContextPath() + "/login.jsp';");
            response.getWriter().println("</script>");
        }
    }
}
