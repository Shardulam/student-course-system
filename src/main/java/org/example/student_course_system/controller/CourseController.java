package org.example.student_course_system.controller;

import org.example.student_course_system.entity.Course;
import org.example.student_course_system.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseService courseSer;

    @GetMapping("/year/{year}")
    public List<Course> getCoursesByYear(@PathVariable int year) {
        return courseSer.getCoursesByYear(year);
    }

    @GetMapping
    public List<Course> getAllCourses() {
        return courseSer.getAllCourses();
    }
}

