package gr.unipi.service;

import gr.unipi.entity.Student;
import gr.unipi.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigInteger;
import java.util.List;

@Service
public class StudentService {

    private final StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public List<Student> getAllStudents(){
        return studentRepository.findAll();
    }

    public Student getStudentById(BigInteger ID){
        return studentRepository.getReferenceById(ID);
    }

    public void deleteStudentById(BigInteger ID) {
        studentRepository.deleteById(ID);
    }

    public void saveStudent(Student student){
        studentRepository.saveAndFlush(student);
    }

    public List<Student> getWidowsOrphans() {
        return studentRepository.getWidowsOrphans();
    }

    public List<Student> getCurrentlyWorking() {
        return studentRepository.getCurrentlyWorking();
    }

    public Student getStudentWorkedTheMost(){
        return studentRepository.getStudentWorkedTheMost();
    }

    public String getCommonFirstName(){
        return studentRepository.getCommonFirstName();
    }

    public String getCommonLastName() {
        return studentRepository.getCommonLastName();
    }

    public int getYearWithMostBachelorGraduates() {
        return studentRepository.getYearWithMostBachelorGraduates();
    }

    public float getMobileRate() {
        return studentRepository.getMobileRate();
    }
}
