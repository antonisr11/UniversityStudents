package gr.unipi.repository;

import gr.unipi.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DepartmentRepository extends JpaRepository<Department, String> {

 @Query(value = "CALL getCountOfUniqueStudentsByDepartmentID(?1)", nativeQuery = true)
 int getCountOfUniqueStudentsByDepartmentID(String id);

 @Query(value = "CALL getDepartmentsWithSeriousMScs(?1, ?2)", nativeQuery = true)
 List<Department> getDepartmentsWithSeriousMScs(int mscsCount, int studentCountInEachMsc);

 @Query(value ="CALL getDepartmentsWithMoreThan_UniqueStudents(?1)", nativeQuery = true)
 List<Department> getDepartmentsWithMoreThan_UniqueStudents(int studentsCount);

 @Query(value = "CALL getDepartmentWhichItsBatchelorHasTheMostWorkedDays()", nativeQuery = true)
 Department getDepartmentWhichItsBatchelorHasTheMostWorkedDays();
}