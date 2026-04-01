package com.example.studentapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import com.example.studentapp.model.Student;
import com.example.studentapp.repository.StudentRepository;

@Service
public class StudentService {

    @Autowired
    private StudentRepository repo;

    // CREATE
    public Student saveStudent(Student s) {
        return repo.save(s);
    }

    // READ ALL
    public List<Student> getAllStudents() {
        return repo.findAll();
    }

    // READ BY ID
    public Student getStudentById(int id) {
        return repo.findById(id).orElse(null);
    }

    // UPDATE
    public Student updateStudent(int id, Student s) {
        Student existing = repo.findById(id).orElse(null);
        if (existing != null) {
            existing.setName(s.getName());
            existing.setAge(s.getAge());
            existing.setDepartment(s.getDepartment());
            return repo.save(existing);
        }
        return null;
    }

    // DELETE
    public String deleteStudent(int id) {
        repo.deleteById(id);
        return "Student Deleted Successfully";
    }

    // CUSTOM QUERY METHODS
    public List<Student> getByDepartment(String dept) {
        return repo.findByDepartment(dept);
    }

    public List<Student> getByAgeGreaterThan(int age) {
        return repo.findByAgeGreaterThan(age);
    }

    // SORTING
    public List<Student> getStudentsSorted(String field) {
        return repo.findAll(Sort.by(Sort.Direction.ASC, field));
    }

    // PAGINATION
    public Page<Student> getStudentsPaginated(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return repo.findAll(pageable);
    }
}