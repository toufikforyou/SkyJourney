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

    public String bookingId = "BK00000001";
    public String flightNumber = "SK123";
    public String email = "N/A";
    public String currentTime = "N/A";
    public String seatType = "Economy";
    public int price = 0;

    public Ticket(String bookingId, String flightNumber, String email, String currentTime, String seatType, int price) {
        this.bookingId = bookingId;
        this.flightNumber = flightNumber;
        this.email = email;
        this.currentTime = currentTime;
        this.seatType = seatType;
        this.price = price;
    }
}