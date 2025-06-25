package org.example.student_course_system.controller;

import org.example.student_course_system.entity.Student;
import org.example.student_course_system.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentSer;

    @PostMapping
    public Student addStudent(@RequestBody Student student) {
        return studentSer.addStudent(student);
    }

    @GetMapping("/{id}")
    public Optional<Student> getStudentById(@PathVariable Long id) {
        return studentSer.getStudentById(id);
    }
}

