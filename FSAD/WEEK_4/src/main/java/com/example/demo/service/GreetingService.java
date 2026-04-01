package com.example.demo.service;

import org.springframework.stereotype.Service;

@Service
public class GreetingService {
    public String message() {
        return "Hello from Service!";
    }
}

