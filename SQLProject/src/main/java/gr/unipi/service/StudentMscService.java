package gr.unipi.service;

import gr.unipi.entity.StudentMsc;
import gr.unipi.repository.StudentMscRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentMscService {

    private final StudentMscRepository studentMscRepository;

    @Autowired
    public StudentMscService(StudentMscRepository studentMscRepository) {
        this.studentMscRepository = studentMscRepository;
    }

    public StudentMsc saveStudentMsc(StudentMsc studentMsc) {
        return studentMscRepository.save(studentMsc);
    }

    public StudentMsc getStudentMscById(String id) {
        return studentMscRepository.getReferenceById(id);
    }

    public void deleteStudentMsc(String id) {
        studentMscRepository.deleteById(id);
    }
    
}
