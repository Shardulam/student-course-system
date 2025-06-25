package org.example.student_course_system.service;

import org.example.student_course_system.entity.Course;
import org.example.student_course_system.repository.CourseDB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseDB coursedb;

    public List<Course> getCoursesByYear(int yearOffered) {
        return coursedb.findByYearOffered(yearOffered);
    }

    public List<Course> getAllCourses() {
        return coursedb.findAll();
    }
}

