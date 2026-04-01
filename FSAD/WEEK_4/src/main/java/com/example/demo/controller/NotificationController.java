package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.NotificationService;

@RestController
public class NotificationController {

    @Autowired
    private NotificationService service;

    @GetMapping("/notify")
    public String notifyUser() {
        return service.sendNotification1();
    }
}