package com.example.studentapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import com.example.studentapp.model.Student;
import com.example.studentapp.service.StudentService;

@RestController
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService service;

    // CREATE
    @PostMapping
    public Student createStudent(@RequestBody Student s) {
        return service.saveStudent(s);
    }

    // READ ALL
    @GetMapping
    public List<Student> getAllStudents() {
        return service.getAllStudents();
    }

    // READ BY ID
    @GetMapping("/{id}")
    public Student getStudentById(@PathVariable int id) {
        return service.getStudentById(id);
    }

    // UPDATE
    @PutMapping("/{id}")
    public Student updateStudent(@PathVariable int id, @RequestBody Student s) {
        return service.updateStudent(id, s);
    }

    // DELETE
    @DeleteMapping("/{id}")
    public String deleteStudent(@PathVariable int id) {
        return service.deleteStudent(id);
    }

    // FILTER BY DEPARTMENT
    @GetMapping("/department/{dept}")
    public List<Student> getByDepartment(@PathVariable String dept) {
        return service.getByDepartment(dept);
    }

    // FILTER BY AGE
    @GetMapping("/age/{age}")
    public List<Student> getByAge(@PathVariable int age) {
        return service.getByAgeGreaterThan(age);
    }

    // SORTING
    @GetMapping("/sort/{field}")
    public List<Student> sortStudents(@PathVariable String field) {
        return service.getStudentsSorted(field);
    }

    // PAGINATION
    @GetMapping("/page")
    public Page<Student> paginateStudents(
            @RequestParam int page,
            @RequestParam int size) {
        return service.getStudentsPaginated(page, size);
    }
}