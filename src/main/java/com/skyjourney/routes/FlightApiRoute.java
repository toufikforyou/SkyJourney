package com.skyjourney.routes;

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
import com.skyjourney.models.Flight;

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
