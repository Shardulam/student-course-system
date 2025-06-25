package org.example.student_course_system.service;

import org.example.student_course_system.entity.Student;
import org.example.student_course_system.repository.StudentDB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class StudentService {

    @Autowired
    private StudentDB studentdb;

    public Student addStudent(Student student) {
        return studentdb.save(student);
    }

    public Optional<Student> getStudentById(Long id) {
        return studentdb.findById(id);
    }
}

