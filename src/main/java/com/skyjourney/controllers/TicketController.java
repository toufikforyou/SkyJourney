package com.skyjourney.controllers;

import java.util.ArrayList;
import com.skyjourney.models.Ticket;

public class TicketController {
    public static ArrayList<Ticket> ticket = new ArrayList<Ticket>();
    
    Ticket booking (String flightNumber, String email, String currentTime,String seatType, int price)
    {
        if(FlightController.doesExist(flightNumber) && UserController.doesExist(email))
        {
            Ticket objTicket = new Ticket(flightNumber, email, currentTime,seatType, price);
            ticket.add(objTicket);
            return objTicket;
        }
        return null;
    }
}
