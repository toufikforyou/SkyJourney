package com.skyjourney.controllers;

import java.util.ArrayList;

import com.skyjourney.models.Flight;

public class FlightController {
    public static ArrayList<Flight> flights = new ArrayList<Flight>();

    ArrayList<Flight> listFlight() {
        return flights;
    }

    static boolean doesExist(String flightNumber) {
        for (Flight flight : flights) {
            if (flight.flightNumber == flightNumber)
                return true;
        }
        return false;
    }

    static void addFlight(String flightNumber, String from, String to, String fromTime, String toTime, int price) {

        if (!doesExist(flightNumber)) {
            Flight objFlight = new Flight(flightNumber, from, to, fromTime, toTime, price);
            flights.add(objFlight);
        }
    }

    public static void main(String[] args) {

        // deshi maal
        addFlight("BG101", "Dhaka", "Chittagong", "2025-05-08T08:00", "2025-05-08T09:00", 150);
        addFlight("BG202", "Chittagong", "Sylhet", "2025-05-09T09:30", "2025-05-09T10:30", 130);
        addFlight("BG303", "Sylhet", "Cox's Bazar", "2025-05-07T14:15", "2025-05-07T15:15", 160);
        addFlight("BG404", "Jessore", "Dhaka", "2025-05-10T22:00", "2025-05-10T23:00", 140);
        addFlight("BG505", "Rajshahi", "Chittagong", "2025-05-08T06:00", "2025-05-08T07:30", 155);
        addFlight("BG606", "Barisal", "Sylhet", "2025-05-09T13:00", "2025-05-09T14:30", 165);
        addFlight("BG707", "Dhaka", "Saidpur", "2025-05-08T10:00", "2025-05-08T11:00", 135);
        addFlight("BG808", "Cox's Bazar", "Dhaka", "2025-05-07T16:00", "2025-05-07T17:00", 150);
        addFlight("BG909", "Khulna", "Barisal", "2025-05-08T07:00", "2025-05-08T08:00", 145);
        addFlight("BG010", "Dhaka", "Rajshahi", "2025-05-09T11:00", "2025-05-09T12:00", 155);
        addFlight("BG011", "Dhaka", "Barisal", "2025-05-10T08:15", "2025-05-10T09:15", 140);
        addFlight("BG012", "Saidpur", "Chittagong", "2025-05-11T07:30", "2025-05-11T09:00", 165);
        addFlight("BG013", "Sylhet", "Jessore", "2025-05-12T13:00", "2025-05-12T14:30", 160);
        addFlight("BG014", "Khulna", "Cox's Bazar", "2025-05-13T12:00", "2025-05-13T13:45", 170);
        addFlight("BG015", "Rajshahi", "Barisal", "2025-05-14T15:00", "2025-05-14T16:15", 150);
        
        // bedeshi maal (Russian)
        addFlight("BG701", "Dhaka", "Kolkata", "2025-05-15T10:00", "2025-05-15T10:45", 180);
        addFlight("BG702", "Chittagong", "Kuala Lumpur", "2025-05-16T14:00", "2025-05-16T19:30", 350);
        addFlight("BG703", "Sylhet", "London", "2025-05-17T22:00", "2025-05-18T08:00", 820);
        addFlight("BG704", "Dubai", "Dhaka", "2025-05-18T01:00", "2025-05-18T07:00", 390);
        addFlight("BG705", "Doha", "Chittagong", "2025-05-19T04:00", "2025-05-19T10:00", 360);
        addFlight("BG706", "Muscat", "Sylhet", "2025-05-20T02:00", "2025-05-20T07:00", 310);
        addFlight("BG707", "Dhaka", "Singapore", "2025-05-21T06:00", "2025-05-21T10:00", 420);
        addFlight("BG708", "Kuwait City", "Dhaka", "2025-05-22T03:30", "2025-05-22T10:00", 385);
        addFlight("BG709", "Jeddah", "Dhaka", "2025-05-23T01:00", "2025-05-23T07:30", 450);
        addFlight("BG710", "Bangkok", "Chittagong", "2025-05-24T05:00", "2025-05-24T09:00", 310);

    }

}
