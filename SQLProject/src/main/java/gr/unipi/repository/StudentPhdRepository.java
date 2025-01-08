package gr.unipi.repository;

import gr.unipi.entity.StudentPhd;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentPhdRepository extends JpaRepository<StudentPhd, String> {
}