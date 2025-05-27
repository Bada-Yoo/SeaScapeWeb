package scape.controller;

import scape.store.StoreDTO;
import scape.store.StoreService;
import scape.room.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/reservation")
public class StoreListServlet extends HttpServlet {
    private final StoreService storeService = new StoreService();
    private final RoomService roomService = new RoomService(); 

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 모든 매장 정보 가져오기
        List<StoreDTO> storeList = storeService.getAllStoreInfo();
        Map<String, List<String>> roomThemes = new HashMap<>();

        for (StoreDTO store : storeList) {
            String location = store.getLOCATION();
            List<String> topThemes = roomService.getTop3ThemesByLocation(location); 
            roomThemes.put(location, topThemes);
        }

        req.setAttribute("storeList", storeList);
        req.setAttribute("roomThemes", roomThemes);

        req.getRequestDispatcher("user/reservation.jsp").forward(req, resp);
    }
}
