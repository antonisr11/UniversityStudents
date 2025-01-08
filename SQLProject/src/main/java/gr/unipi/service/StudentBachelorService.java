package gr.unipi.service;

import gr.unipi.entity.StudentBachelor;
import gr.unipi.repository.StudentBachelorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentBachelorService {

    private final StudentBachelorRepository studentBachelorRepository;

    @Autowired
    public StudentBachelorService(StudentBachelorRepository studentBachelorRepository) {
        this.studentBachelorRepository = studentBachelorRepository;
    }

    public StudentBachelor saveStudentBachelor(StudentBachelor studentBachelor) {
        return studentBachelorRepository.save(studentBachelor);
    }

    public StudentBachelor getStudentBachelorById(String id) {
        return studentBachelorRepository.getReferenceById(id);
    }

    public void deleteStudentBachelor(String id) {
        studentBachelorRepository.deleteById(id);
    }
    
}
