package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.OptionalService;

@RestController
public class OptionalController {

    @Autowired
    private OptionalService service;

    @GetMapping("/optional")
    public String optional() {
        return service.getOptionalMessage();
    }
}