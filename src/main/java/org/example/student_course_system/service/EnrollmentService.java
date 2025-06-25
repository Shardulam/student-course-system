package org.example.student_course_system.service;

import org.example.student_course_system.entity.Course;
import org.example.student_course_system.entity.Enrollment;
import org.example.student_course_system.entity.Student;
import org.example.student_course_system.repository.CourseDB;
import org.example.student_course_system.repository.EnrollmentDB;
import org.example.student_course_system.repository.StudentDB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EnrollmentService {

    @Autowired
    private EnrollmentDB enrollmentdb;

    @Autowired
    private StudentDB studentdb;

    @Autowired
    private CourseDB coursedb;

    public String enrollStudent(Long studentId, List<Long> courseIds, int enrollYear) {
        Optional<Student> studentOpt = studentdb.findById(studentId);
        if (studentOpt.isEmpty()) {
            return "Student not found";
        }

        Student student = studentOpt.get();

        // Validate course count
        int expectedCount = (enrollYear == 2024) ? 3 : 5;
        if (courseIds.size() != expectedCount) {
            return "You must enroll in exactly " + expectedCount + " courses for year " + enrollYear;
        }

        List<Enrollment> enrollments = new ArrayList<>();

        for (Long courseId : courseIds) {
            Optional<Course> courseOpt = coursedb.findById(courseId);
            if (courseOpt.isEmpty()) continue;

            Course course = courseOpt.get();

            Enrollment enrollment = new Enrollment();
            enrollment.setStudent(student);
            enrollment.setCourse(course);
            enrollment.setEnrollYear(enrollYear);
            enrollment.setGrade(null);
            enrollment.setStatus(null);

            enrollments.add(enrollment);
        }

        enrollmentdb.saveAll(enrollments);
        return "Enrolled successfully!";
    }

    public void unenrollById(Long enrollmentId) {
        enrollmentdb.deleteById(enrollmentId);
    }

    public List<Enrollment> getEnrollmentsForStudent(Long studentId) {
        return enrollmentdb.findByStudentId(studentId);
    }

    public double calculateCGPA(Long studentId) {
        List<Enrollment> enrollments = enrollmentdb.findByStudentId(studentId);
        double totalPoints = 0;
        int totalCredits = 0;

        for (Enrollment e : enrollments) {
            String grade = e.getGrade();
            if (grade == null) continue;

            int gradePoint = mapGradeToPoint(grade);
            int credits = e.getCourse().getCredits();

            totalPoints += gradePoint * credits;
            totalCredits += credits;
        }

        return totalCredits == 0 ? 0.0 : totalPoints / totalCredits;
    }

    private int mapGradeToPoint(String grade) {
        return switch (grade.toUpperCase()) {
            case "A" -> 10;
            case "B" -> 8;
            case "C" -> 6;
            case "D" -> 4;
            case "F" -> 0;
            default -> 0;
        };
    }
}

