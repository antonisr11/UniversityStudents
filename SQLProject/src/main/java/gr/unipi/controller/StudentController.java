package gr.unipi.controller;

import gr.unipi.entity.Student;
import gr.unipi.entity.dto.StudentDto;
import gr.unipi.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import java.math.BigInteger;
import java.time.LocalDate;
import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
@RequestMapping(value = "student", method = RequestMethod.GET)
public class StudentController {

    private final StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping(value = "show/all", method = RequestMethod.GET)
    public String showAll(Model model) {
        model.addAttribute("yearNow", LocalDate.now().getYear());
        model.addAttribute("studentsList", studentService.getAllStudents());
        return "Student/showAll.html";
    }

    @RequestMapping(value = "show/{ID}", method = RequestMethod.GET)
    public String showByID(@PathVariable BigInteger ID, Model model) {
        Student student = studentService.getStudentById(ID);
        model.addAttribute("student", student);
        return "Student/showOne.html";
    }

//    @RequestMapping(value = "show/department/id/{departmentID}", method = RequestMethod.GET)
//    public String showByDepartmentID(@PathVariable String departmentID, Model model) {
//        model.addAttribute("studentsList", studentService.getStudentsByDepartmentID(departmentID));
//        model.addAttribute("departmentsList", departmentService.getAllDepartments());
//        return "Student/showAll.html";
//    }

    @RequestMapping(value = "show/currentlyWorking", method = RequestMethod.GET)
    public String currentlyWorking(Model model) {
        model.addAttribute("yearNow", LocalDate.now().getYear());
        model.addAttribute("studentsList", studentService.getCurrentlyWorking());
        return "Student/showAll.html";
    }

    @RequestMapping(value = "show/widowsOrphans", method = RequestMethod.GET)
    public String showOrphans(Model model) {
        model.addAttribute("yearNow", LocalDate.now().getYear());
        model.addAttribute("studentsList", studentService.getWidowsOrphans());
        return "Student/showAll.html";
    }

    @RequestMapping(value = "show/insert", method = RequestMethod.GET)
    public String showInsert(Model model) {
        model.addAttribute("studentDto", new StudentDto());
        return "Student/insert.html";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@Valid StudentDto studentDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/student/show/insert", model);
        }
        else {
            studentService.saveStudent(studentDto.toStudent());
            return showAll(model);
        }
    }

    @RequestMapping(value = "show/update/{ID}", method = RequestMethod.GET)
    public String showUpdate(@PathVariable BigInteger ID, Model model) {
        model.addAttribute("student", studentService.getStudentById(ID));
        return "Student/update.html";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid StudentDto studentDto, Errors errors, Model model){
        if (errors.hasErrors()){

            return redirectToErrorMenu(errors, "http://localhost:8080/student/show/all", model);
        }
        else {
            studentService.saveStudent(studentDto.toStudent());
            return showAll(model);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam("ID") BigInteger ID, Model model) {
        studentService.deleteStudentById(ID);
        return showAll(model);
    }

}
