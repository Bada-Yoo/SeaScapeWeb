package scape.controller;

import scape.store.StoreDTO;
import scape.store.StoreService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/storeList")
public class StoreListServlet extends HttpServlet {
    private final StoreService storeService = new StoreService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 매장 리스트 가져오기
        List<StoreDTO> storeList = storeService.getAllStoreInfo();

        // 2. JSP로 전달
        req.setAttribute("storeList", storeList);

        // 3. forward to dashboard.jsp
        req.getRequestDispatcher("user/dashboard.jsp").forward(req, resp);
    }
} 