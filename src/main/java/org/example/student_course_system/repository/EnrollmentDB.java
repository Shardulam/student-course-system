package org.example.student_course_system.repository;

import org.example.student_course_system.entity.Enrollment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnrollmentDB extends JpaRepository<Enrollment, Long> {
    List<Enrollment> findByStudentId(Long studentId);
}
