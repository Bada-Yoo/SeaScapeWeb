package scape.controller;

import scape.users.UsersDTO;
import scape.users.UsersService;
import scape.creator.CreatorDTO;
import scape.creator.CreatorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final UsersService usersService = new UsersService();
    private final CreatorService creatorService = new CreatorService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/user/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");

        response.setContentType("text/html;charset=UTF-8");

        if ("user".equals(type)) {
            String id = request.getParameter("user_id");
            String pw = request.getParameter("user_pw");
            String name = request.getParameter("user_name");
            String nickname = request.getParameter("user_nickname");
            int age = Integer.parseInt(request.getParameter("user_age"));

            UsersDTO user = new UsersDTO();
            user.setUSER_ID(id);
            user.setUSER_PW(pw);
            user.setUSER_NAME(name);
            user.setUSER_NICKNAME(nickname);
            user.setUSER_AGE(age);
            user.setESCAPE_HISTORY(0);

            String result = usersService.insertId(user);

            if (result == null) {
                response.getWriter().println("<script>alert('회원가입에 실패했습니다.'); history.back();</script>");
            } else if ("이미 존재하는 아이디입니다.".equals(result)) {
                response.getWriter().println("<script>alert('이미 존재하는 아이디입니다.'); history.back();</script>");
            } else {
                response.getWriter().println("<script>alert('" + result + "님 반갑습니다! 메인화면으로 이동합니다.'); location.href='" + request.getContextPath() + "/index.jsp';</script>");
            }

        } else if ("creator".equals(type)) {
            String id = request.getParameter("creator_id");
            String pw = request.getParameter("creator_pw");
            String nickname = request.getParameter("creator_nickname");

            CreatorDTO creator = new CreatorDTO();
            creator.setCREATOR_ID(id);
            creator.setCREATOR_PW(pw);
            creator.setCREATOR_NICKNAME(nickname);

            String result = creatorService.registerCreator(creator);

            if ("개발자 등록이 완료되었습니다!".equals(result)) {
                response.getWriter().println("<script>alert('" + nickname + "님 반갑습니다! 메인화면으로 이동합니다.'); location.href='" + request.getContextPath() + "/index.jsp';</script>");
            } else {
                response.getWriter().println("<script>alert('개발자 등록에 실패했습니다.'); history.back();</script>");
            }
        }
    }
}
