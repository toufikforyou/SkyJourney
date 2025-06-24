package com.skyjourney.controllers;

import java.util.ArrayList;
import java.util.UUID;

import com.skyjourney.models.User;

public class UserController {

    public static ArrayList<User> users = new ArrayList<User>();

    public User login(String email, String password) {
        for (User user : users) {
            if (user.email.equals(email) && user.password.equals(password)) {
                return user;
            }
        }
        return null;
    }

    public boolean registerUser(User user) {
        if (doesExist(user.email)) {
            return false;
        }
        users.add(user);
        return true;
    }

    static boolean doesExist(String email) {
        for (User user : users) {
            if (user.email.equals(email)) {
                return true;
            }
        }
        return false;
    }

    public String generateToken() {
        return UUID.randomUUID().toString();
    }
}