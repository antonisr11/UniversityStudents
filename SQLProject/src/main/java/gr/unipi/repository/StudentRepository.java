package gr.unipi.repository;

import gr.unipi.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.math.BigInteger;
import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student, BigInteger> {
    @Query(value = "CALL getWidowsOrphans()", nativeQuery = true)
    List<Student> getWidowsOrphans();
    
    @Query(value = "CALL getCurrentlyWorking()", nativeQuery = true)
    List<Student> getCurrentlyWorking();
    
    @Query(value = "CALL getStudentWorkedTheMost()", nativeQuery = true)
    Student getStudentWorkedTheMost();
    
    @Query(value = "CALL getCommonFirstName()", nativeQuery = true)
    String getCommonFirstName();

    @Query(value = "CALL getCommonLastName()", nativeQuery = true)
    String getCommonLastName();
    
    @Query(value = "CALL getYearWithMostBachelorGraduates()", nativeQuery = true)
    int getYearWithMostBachelorGraduates();

    @Query(value = "CALL getMobileRate()", nativeQuery = true)
    float getMobileRate();
}
