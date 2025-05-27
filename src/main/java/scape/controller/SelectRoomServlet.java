package scape.controller;

import scape.room.RoomDTO;
import scape.ReservationSchedule.ReservationScheduleDTO;
import scape.ReservationSchedule.ReservationScheduleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

@WebServlet("/reservation/selectRoom")
public class SelectRoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("🧭 SelectRoomServlet 실행됨");

        request.setCharacterEncoding("UTF-8");

        String store = request.getParameter("store");
        String dateStr = request.getParameter("date");

        ReservationScheduleService service = new ReservationScheduleService();
        Map<RoomDTO, List<ReservationScheduleDTO>> originalMap =
                service.getAvailableSchedulesByStoreAndDate(store, dateStr);

        // 날짜/시간 객체화
        LocalDate today = LocalDate.now();
        LocalDate selectedDate = LocalDate.parse(dateStr);
        LocalTime now = LocalTime.now();

        Map<RoomDTO, List<ReservationScheduleDTO>> filteredMap = new LinkedHashMap<>();

        for (Map.Entry<RoomDTO, List<ReservationScheduleDTO>> entry : originalMap.entrySet()) {
            RoomDTO room = entry.getKey();
            List<ReservationScheduleDTO> schedules = entry.getValue();

            List<ReservationScheduleDTO> filteredList = new ArrayList<>();

            for (ReservationScheduleDTO s : schedules) {
                LocalTime slotTime = LocalTime.parse(s.getRESERVATION_TIME());

                if (selectedDate.equals(today)) {
                    if (slotTime.isAfter(now)) {
                        filteredList.add(s);
                    } else {
                    }
                } else {
                    filteredList.add(s);
                }
            }

            if (!filteredList.isEmpty()) {
                filteredMap.put(room, filteredList);
            }
        }

        request.setAttribute("store", store);
        request.setAttribute("date", dateStr);
        request.setAttribute("roomMap", filteredMap);

        request.getRequestDispatcher("/user/selectRoom.jsp").forward(request, response);
    }
}
