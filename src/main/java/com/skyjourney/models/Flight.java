package com.skyjourney.models;

public class Flight {
    public String flight_name = "N/A";
    public int flight_number = 0;
    public int ticket_price = 0;
    // Need a time for departure and arrival
    public String starting_destination = "N/A";
    public String ending_destination = "N/A";

    public Flight(String flight_name, int flight_number, int ticket_price, String starting_destination,
            String ending_destination) {
        this.flight_name = flight_name;
        this.flight_number = flight_number;
        this.ticket_price = ticket_price;
        this.starting_destination = starting_destination;
        this.ending_destination = ending_destination;
    }
}
