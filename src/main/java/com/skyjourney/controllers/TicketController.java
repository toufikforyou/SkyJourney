package com.skyjourney.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.skyjourney.models.Ticket;

public class TicketController {
    public static ArrayList<Ticket> tickets = new ArrayList<Ticket>();

    public static Ticket bookFlight(String bookingId, String flightNumber, String email, String seatType, int price,
            String bookingDate) {
        try {
            String currentTime = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            Ticket objTicket = new Ticket(bookingId, flightNumber, email, currentTime, seatType, price);
            tickets.add(objTicket);

            System.out.println("Ticket created successfully for: " + email);
            System.out.println("Total tickets: " + tickets.size());

            return objTicket;
        } catch (Exception e) {
            System.err.println("Error creating ticket: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public static ArrayList<Ticket> getUserTickets(String email) {
        ArrayList<Ticket> userTickets = new ArrayList<>();
        for (Ticket ticket : tickets) {
            if (ticket.email.equals(email)) {
                userTickets.add(ticket);
            }
        }
        return userTickets;
    }

    public static String generateBookingId() {
        return "BK" + java.util.UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
