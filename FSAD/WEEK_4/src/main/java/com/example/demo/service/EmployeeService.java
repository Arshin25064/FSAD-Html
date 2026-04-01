package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Employee;

@Service   
public class EmployeeService {

    private List<Employee> employeeList = new ArrayList<>();

    public List<Employee> getEmployees() {
        return employeeList;
    }

    public void addEmployee(Employee emp) {
        employeeList.add(emp);
    }
}