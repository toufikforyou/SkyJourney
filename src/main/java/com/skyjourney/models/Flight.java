package com.skyjourney.models;

public class Flight {

    public String flightNumber = "SK123";
    public String from = "N/A";
    public String to = "N/A";
    public String fromCode = "N/A";
    public String toCode = "N/A";
    public String fromTime = "N/A";
    public String toTime = "N/A";
    public int price = 0;

    public Flight(String flightNumber, String from, String to, String fromCode, String toCode, String fromTime,
            String toTime, int price) {
        this.flightNumber = flightNumber;
        this.from = from;
        this.to = to;
        this.fromCode = fromCode;
        this.toCode = toCode;
        this.fromTime = fromTime;
        this.toTime = toTime;
        this.price = price;
    }
}
