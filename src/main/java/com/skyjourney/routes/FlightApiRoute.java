package com.skyjourney.routes;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.skyjourney.controllers.FlightController;
import com.skyjourney.controllers.TicketController;
import com.skyjourney.models.Flight;
import com.skyjourney.models.Ticket;
import com.skyjourney.services.EmailService;

@WebServlet("/api/flights")
public class FlightApiRoute extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");

        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();

        try {
            if ("airports".equals(action)) {
                handleAirportsRequest(out);
            } else if ("search".equals(action)) {
                handleSearchRequest(request, out);
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(new JSONObject().put("error", "Invalid action parameter"));
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(new JSONObject().put("error", e.getMessage()));
        }

        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

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
            String action = jsonRequest.getString("action");

            if ("book".equals(action)) {
                handleBookingRequest(jsonRequest, out);
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(new JSONObject().put("error", "Invalid action"));
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(new JSONObject().put("error", "Server error: " + e.getMessage()));
        }

        out.flush();
    }

    private void handleBookingRequest(JSONObject jsonRequest, PrintWriter out) {
        try {
            String flightNumber = jsonRequest.getString("flightNumber");
            String email = jsonRequest.getString("email");
            String name = jsonRequest.getString("name");
            String seatType = jsonRequest.getString("seatType");
            int price = jsonRequest.getInt("price");
            String bookingDate = jsonRequest.getString("bookingDate");
            String token = jsonRequest.getString("token");

            System.out.println("Booking request received:");
            System.out.println("Flight: " + flightNumber);
            System.out.println("Email: " + email);
            System.out.println("Seat Type: " + seatType);
            System.out.println("Price: " + price);

            if (token == null || token.isEmpty()) {
                JSONObject errorResponse = new JSONObject();
                errorResponse.put("success", false);
                errorResponse.put("message", "Authentication required");
                out.print(errorResponse.toString());
                return;
            }

            if (email == null || email.isEmpty()) {
                JSONObject errorResponse = new JSONObject();
                errorResponse.put("success", false);
                errorResponse.put("message", "Email is required");
                out.print(errorResponse.toString());
                return;
            }

            if (flightNumber == null || flightNumber.isEmpty()) {
                JSONObject errorResponse = new JSONObject();
                errorResponse.put("success", false);
                errorResponse.put("message", "Flight number is required");
                out.print(errorResponse.toString());
                return;
            }

            String bookingId = "BK" + TicketController.generateBookingId();

            Ticket ticket = TicketController.bookFlight(bookingId, flightNumber, email, seatType, price, bookingDate);
            System.out.println("Ticket created: " + (ticket != null));

            JSONObject jsonResponse = new JSONObject();
            if (ticket != null) {
                boolean emailSent = false;
                try {
                    emailSent = sendBookingConfirmationEmail(email, name, flightNumber, bookingDate, seatType, price,
                            bookingId);
                } catch (Exception e) {
                    System.err.println("Email sending failed: " + e.getMessage());
                }

                jsonResponse.put("success", true);
                jsonResponse.put("message", "Flight booked successfully");
                jsonResponse.put("bookingId", bookingId);
                jsonResponse.put("flightNumber", ticket.flightNumber);
                jsonResponse.put("email", ticket.email);
                jsonResponse.put("seatType", seatType);
                jsonResponse.put("price", ticket.price);
                jsonResponse.put("emailSent", emailSent);

                System.out.println("Booking successful for: " + email);
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Booking failed. Unable to create ticket.");
            }

            out.print(jsonResponse.toString());

        } catch (Exception e) {
            System.err.println("Booking error: " + e.getMessage());
            e.printStackTrace();

            JSONObject errorResponse = new JSONObject();
            errorResponse.put("success", false);
            errorResponse.put("message", "Booking failed: " + e.getMessage());
            out.print(errorResponse.toString());
        }
    }

    private boolean sendBookingConfirmationEmail(String email, String name, String flightNumber,
            String bookingDate, String seatType, int price, String bookingId) {
        try {
            EmailService emailService = new EmailService();
            String subject = "Flight Booking Confirmation - " + bookingId;
            String message = String.format(
                    "<html><body>" +
                            "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px;'>"
                            +
                            "<h2 style='color: #2c5aa0; text-align: center;'>Flight Booking Confirmation</h2>" +
                            "<p>Dear <strong>%s</strong>,</p>" +
                            "<p>Your flight booking has been confirmed!</p>" +
                            "<div style='background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;'>"
                            +
                            "<h3 style='color: #2c5aa0; margin-top: 0;'>Booking Details:</h3>" +
                            "<table style='width: 100%%; border-collapse: collapse;'>" +
                            "<tr><td style='padding: 8px 0; font-weight: bold;'>Booking ID:</td><td>%s</td></tr>" +
                            "<tr><td style='padding: 8px 0; font-weight: bold;'>Flight Number:</td><td>%s</td></tr>" +
                            "<tr><td style='padding: 8px 0; font-weight: bold;'>Date:</td><td>%s</td></tr>" +
                            "<tr><td style='padding: 8px 0; font-weight: bold;'>Class:</td><td>%s</td></tr>" +
                            "<tr><td style='padding: 8px 0; font-weight: bold;'>Price:</td><td>$%d</td></tr>" +
                            "</table>" +
                            "</div>" +
                            "<p>Thank you for choosing SkyJourney!</p>" +
                            "<p style='margin-top: 30px;'>Best regards,<br><strong>SkyJourney Team</strong></p>" +
                            "</div>" +
                            "</body></html>",
                    name, bookingId, flightNumber, bookingDate, seatType, price);

            return emailService.sendEmail(email, name, subject, message, bookingId);
        } catch (Exception e) {
            System.err.println("Failed to send confirmation email: " + e.getMessage());
            return false;
        }
    }

    private void handleAirportsRequest(PrintWriter out) {
        Set<String> addedCodes = new HashSet<>();
        JSONArray airports = new JSONArray();

        for (Flight flight : FlightController.flights) {
            if (!addedCodes.contains(flight.fromCode)) {
                JSONObject airport = new JSONObject();
                airport.put("code", flight.fromCode);
                airport.put("name", flight.from);
                airports.put(airport);
                addedCodes.add(flight.fromCode);
            }

            if (!addedCodes.contains(flight.toCode)) {
                JSONObject airport = new JSONObject();
                airport.put("code", flight.toCode);
                airport.put("name", flight.to);
                airports.put(airport);
                addedCodes.add(flight.toCode);
            }
        }

        out.print(airports.toString());
    }

    private void handleSearchRequest(HttpServletRequest request, PrintWriter out) {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String date = request.getParameter("date");

        ArrayList<Flight> matchingFlights = new ArrayList<>();

        for (Flight flight : FlightController.flights) {
            boolean matches = true;

            if (from != null && !from.isEmpty() && !flight.fromCode.equals(from)) {
                matches = false;
            }

            if (to != null && !to.isEmpty() && !flight.toCode.equals(to)) {
                matches = false;
            }

            if (matches) {
                matchingFlights.add(flight);
            }
        }

        JSONArray flights = new JSONArray();
        for (Flight flight : matchingFlights) {
            JSONObject flightObj = new JSONObject();
            flightObj.put("flightNumber", flight.flightNumber);
            flightObj.put("from", flight.from);
            flightObj.put("to", flight.to);
            flightObj.put("fromCode", flight.fromCode);
            flightObj.put("toCode", flight.toCode);

            if (date != null && !date.isEmpty()) {
                String fromTime = flight.fromTime.substring(flight.fromTime.indexOf('T'));
                String toTime = flight.toTime.substring(flight.toTime.indexOf('T'));

                flightObj.put("fromTime", date + fromTime);
                flightObj.put("toTime", date + toTime);
            } else {
                flightObj.put("fromTime", flight.fromTime);
                flightObj.put("toTime", flight.toTime);
            }

            flightObj.put("price", flight.price);
            flights.put(flightObj);
        }

        out.print(flights.toString());
    }
}
