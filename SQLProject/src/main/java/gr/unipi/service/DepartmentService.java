package gr.unipi.service;

import gr.unipi.entity.Department;
import gr.unipi.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class DepartmentService {

    private final DepartmentRepository departmentRepository;

    @Autowired
    public DepartmentService(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    public List<Department> getAllDepartments() {
        return departmentRepository.findAll();
    }

    public Department getDepartmentById(String id) {
        return departmentRepository.getReferenceById(id);
    }

    public void saveDepartment(Department department) {
        departmentRepository.save(department);
    }

    public void deleteDepartmentById(String id) {
        departmentRepository.deleteById(id);
    }

    public int getCountOfUniqueStudentsByDepartmentID(String id) {
        return departmentRepository.getCountOfUniqueStudentsByDepartmentID(id);
    }

    public List<Department> getDepartmentsWithSeriousMScs() {
        return departmentRepository.getDepartmentsWithSeriousMScs(2, 5);
    }

    public List<Department> getDepartmentsWithMoreThan50UniqueStudents() {
        return departmentRepository.getDepartmentsWithMoreThan_UniqueStudents(50);
    }

    public Department getDepartmentWhichItsBatchelorHasTheMostWorkedDays() {
        return departmentRepository.getDepartmentWhichItsBatchelorHasTheMostWorkedDays();
    }
}
