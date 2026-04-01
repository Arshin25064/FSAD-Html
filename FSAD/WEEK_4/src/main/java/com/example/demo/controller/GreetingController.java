package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.GreetingService;

@RestController
public class GreetingController {

    @Autowired
    private GreetingService service;

    @GetMapping("/greet")
    public String greet() {
        return service.message();
    }
}