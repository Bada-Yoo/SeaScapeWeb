package scape.controller;

import scape.ReservationSchedule.ReservationScheduleDTO;
import scape.ReservationSchedule.ReservationScheduleService;
import scape.room.RoomDTO;
import scape.store.StoreService;
import scape.users.UsersDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/reservation/check")
public class CheckServlet extends HttpServlet {

    private final ReservationScheduleService scheduleService = new ReservationScheduleService();
    private final StoreService storeService = new StoreService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        UsersDTO user = (session != null) ? (UsersDTO) session.getAttribute("loginUser") : null;

        if (user == null) {
            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().println("<script>alert('로그인이 필요합니다.'); location.href='" + req.getContextPath() + "/login.jsp';</script>");
            return;
        }

        String userId = user.getUSER_ID();  // UsersDTO에서 아이디 가져오기
        List<ReservationScheduleDTO> reservations = scheduleService.getMyReservations(userId);
        List<Map<String, Object>> detailedList = new ArrayList<>();

        for (ReservationScheduleDTO r : reservations) {
            RoomDTO room = scheduleService.getRoomInfo(r.getROOM_ID());
            String store = storeService.getLocationByRoomId(r.getROOM_ID());
            int total = r.getHEADCOUNT() * room.getPRICE();

            Map<String, Object> map = new HashMap<>();
            map.put("store", store);
            map.put("room", room.getROOM_NAME());
            map.put("genre", room.getGENRE());
            map.put("price", room.getPRICE());
            map.put("date", r.getRESERVATION_DATE());
            map.put("time", r.getRESERVATION_TIME());
            map.put("people", r.getHEADCOUNT());
            map.put("total", total);

            detailedList.add(map);
        }

        req.setAttribute("reservationList", detailedList);
        req.getRequestDispatcher("/user/check.jsp").forward(req, resp);
    }
}
