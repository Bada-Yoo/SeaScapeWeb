package scape.controller;

import scape.users.UsersDTO;
import scape.users.UsersService;
import scape.creator.CreatorDTO;
import scape.creator.CreatorService;
import scape.store.StoreDTO;
import scape.store.StoreService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        String role = req.getParameter("role");
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        HttpSession session = req.getSession();

        switch (role) {
            case "user":
                UsersDTO user = new UsersService().login(id, pw);
                if (user != null) {
                    session.setAttribute("loginUser", user);
                    res.sendRedirect("storeList");
                } else {
                    res.sendRedirect("login.jsp?error=user");
                }
                break;

            case "creator":
                CreatorDTO creator = new CreatorService().loginAndGetCreator(id, pw);
                if (creator != null) {
                    session.setAttribute("loginCreator", creator);
                    res.sendRedirect("creator/dashboard.jsp");
                } else {
                    res.sendRedirect("login.jsp?error=creator");
                }
                break;

            case "store":
                StoreService storeService = new StoreService();
                if (storeService.login(id, pw)) {
                    StoreDTO store = new StoreDTO();
                    store.setSTORE_ID(id);
                    session.setAttribute("loginStore", store);
                    res.sendRedirect("store/dashboard.jsp");
                } else {
                    res.sendRedirect("login.jsp?error=store");
                }
                break;

            case "admin":
                if (pw.equals("seascape")) {
                    session.setAttribute("admin", "true");
                    res.sendRedirect("admin/dashboard.jsp");
                } else {
                    res.sendRedirect("login.jsp?error=admin");
                }
                break;

        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.sendRedirect("login.jsp");
    }

}
