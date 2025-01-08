package gr.unipi.service;

import gr.unipi.entity.StudentPhd;
import gr.unipi.repository.StudentPhdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentPhdService {

    private final StudentPhdRepository studentPhdRepository;

    @Autowired
    public StudentPhdService(StudentPhdRepository studentPhdRepository) {
        this.studentPhdRepository = studentPhdRepository;
    }

    public StudentPhd saveStudentPhd(StudentPhd studentPhd) {
        return studentPhdRepository.save(studentPhd);
    }

    public StudentPhd getStudentPhdById(String id) {
        return studentPhdRepository.getReferenceById(id);
    }

    public void deleteStudentPhd(String id) {
        studentPhdRepository.deleteById(id);
    }

}
