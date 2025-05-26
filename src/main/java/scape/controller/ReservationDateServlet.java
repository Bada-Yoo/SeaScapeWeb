package scape.controller;

import scape.ReservationSchedule.ReservationScheduleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/reservation/date")
public class ReservationDateServlet extends HttpServlet {
    private final ReservationScheduleService scheduleService = new ReservationScheduleService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String store = req.getParameter("store");
        if (store == null || store.isEmpty()) {
            res.sendRedirect("/storeList"); // store 정보 없으면 매장 목록으로
            return;
        }

        List<String> availableDates = scheduleService.getAvailableDatesByStore(store);

        req.setAttribute("store", store);
        req.setAttribute("availableDates", availableDates);
        req.getRequestDispatcher("/user/selectDate.jsp").forward(req, res);
    }
} 