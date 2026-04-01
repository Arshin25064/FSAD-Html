package com.example.studentapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.studentapp.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

    // Custom query methods
    List<Student> findByDepartment(String department);

    List<Student> findByAgeGreaterThan(int age);
}
