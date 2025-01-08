package gr.unipi.repository;

import gr.unipi.entity.StudentBachelor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentBachelorRepository extends JpaRepository<StudentBachelor, String> {
}