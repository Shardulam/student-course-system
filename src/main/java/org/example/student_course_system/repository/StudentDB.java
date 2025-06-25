package org.example.student_course_system.repository;

import org.example.student_course_system.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentDB extends JpaRepository<Student, Long> {
}
