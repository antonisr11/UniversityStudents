package gr.unipi.repository;

import gr.unipi.entity.StudentMsc;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentMscRepository extends JpaRepository<StudentMsc, String> {
}