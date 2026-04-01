package com.example.demo.service;

import org.springframework.stereotype.Service;

@Service
public class SMSNotificationService extends NotificationService {

    public String sendNotification1() {
        return "SMS Notification Sent";
    }
}