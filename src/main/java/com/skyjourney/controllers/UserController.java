package com.skyjourney.controllers;

import java.util.ArrayList;

import com.skyjourney.models.User;

public class UserController{

    public static ArrayList<User> users = new ArrayList<User>();
    public boolean login(String email, String password)
    {
        for(int i = 0; i<users.size(); i++)
        {
            if(users.get(i).email == email && users.get(i).password == password){
                return true;
            }
        }
        return false;
    }
    public void RegisterUser(User user)
    {
        users.add(user);
    }

    static boolean doesExist(String emailOrPhone) {
        for (User user : users) {
            if (user.email == emailOrPhone)
                return true;
        }
        return false;
    }
}