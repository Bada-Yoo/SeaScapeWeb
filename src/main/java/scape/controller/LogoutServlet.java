package scape.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<script>");
        response.getWriter().println("alert('로그아웃되었습니다.');");
        response.getWriter().println("location.href='" + request.getContextPath() + "/index.jsp';");
        response.getWriter().println("</script>");
    }
}
