package com.skyjourney.models;

/*
    1 email
    2 flight number
    3 price 
    4 current time
 */
public class Ticket{
    
    public String flightNumber = "SK123";
    public String email = "N/A";
    public String currentTime = "N/A";
    public boolean seatType = false;
    public int price = 0;
    

    public Ticket(String flightNumber, String email, String currentTime,String seatType, int price) {
        this.flightNumber = flightNumber;
        this.email = email;
        this.currentTime = currentTime;
        this.price = price;
        if(seatType == "Business") this.seatType = true;
    }
}