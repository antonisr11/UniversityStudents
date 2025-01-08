package gr.unipi.controller.helper;

import gr.unipi.entity.Student;
import gr.unipi.entity.StudentBachelor;
import gr.unipi.entity.StudentMsc;
import gr.unipi.entity.StudentPhd;
import gr.unipi.entity.helper.Program;
import gr.unipi.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "program", method = RequestMethod.GET)
public class ProgramController {

    private final StudentService studentService;

    @Autowired
    public ProgramController(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping(value = "show/all", method = RequestMethod.GET)
    public String showAll(Model model) {
        List<Program> allStudentsPrograms = new ArrayList<>();

        for (Student student : studentService.getAllStudents()) {

            for (StudentBachelor studentBachelor : student.getStudentBachelors() ){
                allStudentsPrograms.add(new Program(student.getId(), student.getLastName(), studentBachelor.getDepartment().getId(), "Bachelor", studentBachelor.getRegistration(), studentBachelor.getId(), studentBachelor.getGraduation() != null));
            }

            for (StudentMsc studentMsc : student.getStudentMscs()){
                allStudentsPrograms.add(new Program(student.getId(), student.getLastName(), studentMsc.getMsc().getDepartment().getId(), "MSc", studentMsc.getRegistration(), studentMsc.getId(), studentMsc.getGraduation() != null));
            }

            for (StudentPhd studentPhd : student.getStudentPhds()){
                allStudentsPrograms.add(new Program(student.getId(), student.getLastName(), studentPhd.getDepartment().getId(), "PhD", studentPhd.getRegistration(), studentPhd.getId(), studentPhd.getGraduation() != null));
            }

        }
        model.addAttribute("programsList", allStudentsPrograms);
        return "Program/showAll.html";
    }
}