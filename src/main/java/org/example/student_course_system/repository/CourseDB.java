package org.example.student_course_system.repository;

import org.example.student_course_system.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseDB extends JpaRepository<Course, Long> {
    List<Course> findByYearOffered(int yearOffered);
}
