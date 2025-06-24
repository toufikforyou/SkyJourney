package com.skyjourney.models;

/*
    1 email
    2 flight number
    3 price 
    4 current time
    5 booking ID
    6 seat type
 */
public class Ticket {

    public String bookingId;
    public String flightNumber = "SK123";
    public String email = "N/A";
    public String currentTime = "N/A";
    public String seatType = "Economy";
    public int price = 0;

    public Ticket(String flightNumber, String email, String currentTime, String seatType, int price) {
        this.bookingId = generateBookingId();
        this.flightNumber = flightNumber;
        this.email = email;
        this.currentTime = currentTime;
        this.seatType = seatType;
        this.price = price;
    }

    private String generateBookingId() {
        return "BK" + java.util.UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}