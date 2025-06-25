package org.example.student_course_system.controller;

import org.example.student_course_system.entity.Enrollment;
import org.example.student_course_system.service.EnrollmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/enrollments")
public class EnrollmentController {

    @Autowired
    private EnrollmentService enrollmentSer;

    @PostMapping
    public String enrollStudent(
            @RequestParam Long studentId,
            @RequestParam List<Long> courseIds,
            @RequestParam int enrollYear
    ) {
        return enrollmentSer.enrollStudent(studentId, courseIds, enrollYear);
    }

    @DeleteMapping("/{id}")
    public String unenroll(@PathVariable Long id) {
        enrollmentSer.unenrollById(id);
        return "Unenrolled successfully!";
    }

    @GetMapping("/student/{studentId}")
    public List<Enrollment> getEnrollments(@PathVariable Long studentId) {
        return enrollmentSer.getEnrollmentsForStudent(studentId);
    }

    @GetMapping("/student/{studentId}/cgpa")
    public double getCGPA(@PathVariable Long studentId) {
        return enrollmentSer.calculateCGPA(studentId);
    }
}

