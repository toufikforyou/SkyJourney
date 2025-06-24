package com.skyjourney.controllers;

import java.util.ArrayList;

import com.skyjourney.models.Flight;

public class FlightController {

    public static ArrayList<Flight> flights = new ArrayList<Flight>();

    ArrayList<Flight> listFlight() {
        return flights;
    }

    public static boolean doesExist(String flightNumber) {
        for (Flight flight : flights) {
            if (flight.flightNumber.equals(flightNumber))
                return true;
        }
        return false;
    }

    static void addFlight(String flightNumber, String from, String to, String fromCode, String toCode, String fromTime,
            String toTime, int price) {

        if (!doesExist(flightNumber)) {
            Flight objFlight = new Flight(flightNumber, from, to, fromCode, toCode, fromTime, toTime, price);
            flights.add(objFlight);
        }
    }

    static {
        // Deshi mal
        addFlight("BG101", "Dhaka", "Chittagong", "DAC", "CGP", "2025-06-25T08:00", "2025-06-25T09:00", 150);
        addFlight("BG202", "Chittagong", "Sylhet", "CGP", "ZYL", "2025-06-26T09:30", "2025-06-26T10:30", 130);
        addFlight("BG303", "Sylhet", "Cox's Bazar", "ZYL", "CXB", "2025-06-25T14:15", "2025-06-25T15:15", 160);
        addFlight("BG404", "Jessore", "Dhaka", "JSR", "DAC", "2025-06-27T22:00", "2025-06-27T23:00", 140);
        addFlight("BG505", "Rajshahi", "Chittagong", "RJH", "CGP", "2025-06-25T06:00", "2025-06-25T07:30", 155);
        addFlight("BG606", "Barisal", "Sylhet", "BZL", "ZYL", "2025-06-26T13:00", "2025-06-26T14:30", 165);
        addFlight("BG707", "Dhaka", "Saidpur", "DAC", "SPD", "2025-06-25T10:00", "2025-06-25T11:00", 135);
        addFlight("BG808", "Cox's Bazar", "Dhaka", "CXB", "DAC", "2025-06-25T16:00", "2025-06-25T17:00", 150);
        addFlight("BG909", "Khulna", "Barisal", "KHL", "BZL", "2025-06-25T07:00", "2025-06-25T08:00", 145);
        addFlight("BG010", "Dhaka", "Rajshahi", "DAC", "RJH", "2025-06-26T11:00", "2025-06-26T12:00", 155);
        addFlight("BG011", "Dhaka", "Barisal", "DAC", "BZL", "2025-06-27T08:15", "2025-06-27T09:15", 140);
        addFlight("BG012", "Saidpur", "Chittagong", "SPD", "CGP", "2025-06-28T07:30", "2025-06-28T09:00", 165);
        addFlight("BG013", "Sylhet", "Jessore", "ZYL", "JSR", "2025-06-29T13:00", "2025-06-29T14:30", 160);
        addFlight("BG014", "Khulna", "Cox's Bazar", "KHL", "CXB", "2025-06-30T12:00", "2025-06-30T13:45", 170);
        addFlight("BG015", "Rajshahi", "Barisal", "RJH", "BZL", "2025-07-01T15:00", "2025-07-01T16:15", 150);

        // Bedeshi mal flights
        addFlight("BG701", "Dhaka", "Kolkata", "DAC", "CCU", "2025-07-02T10:00", "2025-07-02T10:45", 180);
        addFlight("BG702", "Chittagong", "Kuala Lumpur", "CGP", "KUL", "2025-07-03T14:00", "2025-07-03T19:30", 350);
        addFlight("BG703", "Sylhet", "London", "ZYL", "LHR", "2025-07-04T22:00", "2025-07-05T08:00", 820);
        addFlight("BG704", "Dubai", "Dhaka", "DXB", "DAC", "2025-07-05T01:00", "2025-07-05T07:00", 390);
        addFlight("BG705", "Doha", "Chittagong", "DOH", "CGP", "2025-07-06T04:00", "2025-07-06T10:00", 360);
        addFlight("BG706", "Muscat", "Sylhet", "MCT", "ZYL", "2025-07-07T02:00", "2025-07-07T07:00", 310);
        addFlight("BG707", "Dhaka", "Singapore", "DAC", "SIN", "2025-07-08T06:00", "2025-07-08T10:00", 420);
        addFlight("BG708", "Kuwait City", "Dhaka", "KWI", "DAC", "2025-07-09T03:30", "2025-07-09T10:00", 385);
        addFlight("BG709", "Jeddah", "Dhaka", "JED", "DAC", "2025-07-10T01:00", "2025-07-10T07:30", 450);
        addFlight("BG710", "Bangkok", "Chittagong", "BKK", "CGP", "2025-07-11T05:00", "2025-07-11T09:00", 310);
    }
}
