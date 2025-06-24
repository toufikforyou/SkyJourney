package com.skyjourney.routes;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.JSONArray;

import com.skyjourney.controllers.TicketController;
import com.skyjourney.controllers.UserController;
import com.skyjourney.models.Ticket;

@WebServlet("/api/booking")
public class BookingApiRoute extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");

        PrintWriter out = response.getWriter();

        try {
            StringBuilder buffer = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            String data = buffer.toString();

            JSONObject jsonRequest = new JSONObject(data);
            String flightNumber = jsonRequest.getString("flightNumber");
            String email = jsonRequest.getString("email");
            String seatType = jsonRequest.getString("seatType");
            int price = jsonRequest.getInt("price");
            String bookingDate = jsonRequest.getString("bookingDate");
            String token = jsonRequest.getString("token");

            if (token == null || token.isEmpty()) {
                JSONObject errorResponse = new JSONObject();
                errorResponse.put("success", false);
                errorResponse.put("message", "Authentication required");
                out.print(errorResponse.toString());
                return;
            }

            if (!UserController.doesExist(email)) {
                JSONObject errorResponse = new JSONObject();
                errorResponse.put("success", false);
                errorResponse.put("message", "User not found");
                out.print(errorResponse.toString());
                return;
            }

            Ticket ticket = TicketController.bookFlight(flightNumber, email, seatType, price, bookingDate);

            JSONObject jsonResponse = new JSONObject();
            if (ticket != null) {
                jsonResponse.put("success", true);
                jsonResponse.put("message", "Flight booked successfully");
                jsonResponse.put("bookingId", ticket.bookingId);
                jsonResponse.put("flightNumber", ticket.flightNumber);
                jsonResponse.put("email", ticket.email);
                jsonResponse.put("seatType", ticket.seatType);
                jsonResponse.put("price", ticket.price);
                jsonResponse.put("bookingTime", ticket.currentTime);
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Booking failed. Flight or user not found.");
            }

            out.print(jsonResponse.toString());

        } catch (Exception e) {
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("success", false);
            errorResponse.put("message", "Booking failed: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(errorResponse.toString());
        }

        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");

        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");

        try {
            if (email != null && !email.isEmpty()) {
                ArrayList<Ticket> userTickets = TicketController.getUserTickets(email);

                JSONArray bookingsArray = new JSONArray();
                for (Ticket ticket : userTickets) {
                    JSONObject ticketObj = new JSONObject();
                    ticketObj.put("flightNumber", ticket.flightNumber);
                    ticketObj.put("email", ticket.email);
                    ticketObj.put("currentTime", ticket.currentTime);
                    ticketObj.put("seatType", ticket.seatType);
                    ticketObj.put("price", ticket.price);
                    bookingsArray.put(ticketObj);
                }

                JSONObject jsonResponse = new JSONObject();
                jsonResponse.put("success", true);
                jsonResponse.put("bookings", bookingsArray);
                out.print(jsonResponse.toString());
            } else {
                JSONObject errorResponse = new JSONObject();
                errorResponse.put("success", false);
                errorResponse.put("message", "Email parameter required");
                out.print(errorResponse.toString());
            }
        } catch (Exception e) {
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("success", false);
            errorResponse.put("message", "Error retrieving bookings: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(errorResponse.toString());
        }

        out.flush();
    }
}
