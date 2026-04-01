package com.example.demo.service;

import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImp1 extends PaymentService {

    public String pay() {
        return "Payment Processed Successfully";
    }
}