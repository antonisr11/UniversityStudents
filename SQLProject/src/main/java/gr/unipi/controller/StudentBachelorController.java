package gr.unipi.controller;

import gr.unipi.entity.dto.StudentBachelorDto;
import gr.unipi.service.DepartmentService;
import gr.unipi.service.StudentBachelorService;
import gr.unipi.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
@RequestMapping(value = "studentbachelor", method = RequestMethod.GET)
public class StudentBachelorController {

    private final StudentBachelorService studentBachelorService;
    private final StudentService studentService;
    private final DepartmentService departmentService;

    @Autowired
    public StudentBachelorController(StudentBachelorService studentBachelorService, StudentService studentService, DepartmentService departmentService) {
        this.studentBachelorService = studentBachelorService;
        this.studentService = studentService;
        this.departmentService = departmentService;
    }

    @RequestMapping(value = "show/{ID}", method = RequestMethod.GET)
    public String showByID(@PathVariable String ID, Model model) {
        model.addAttribute("studentBachelor", studentBachelorService.getStudentBachelorById(ID));
        return "Program/Bachelor/showOne.html";
    }

    @RequestMapping(value = "show/insert", method = RequestMethod.GET)
    public String showInsert(Model model) {
        model.addAttribute("studentBachelorDto", new StudentBachelorDto());
        model.addAttribute("studentsList", studentService.getAllStudents());
        model.addAttribute("departmentsList", departmentService.getAllDepartments());
        return "Program/Bachelor/insert.html";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("StudentBachelorDto") StudentBachelorDto studentbachelorDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/studentbachelor/show/insert", model);
        }
        else {
            System.out.println(studentbachelorDto.toStudentBachelor());
            studentBachelorService.saveStudentBachelor(studentbachelorDto.toStudentBachelor());
            return "redirect:/program/show/all";
        }
    }

    @RequestMapping(value = "show/update/{ID}", method = RequestMethod.GET)
    public String showUpdate(@PathVariable String ID, Model model) {
        model.addAttribute("studentbachelor", studentBachelorService.getStudentBachelorById(ID));
        model.addAttribute("studentsList", studentService.getAllStudents());
        model.addAttribute("departmentsList", departmentService.getAllDepartments());
        return "Program/Bachelor/update.html";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid StudentBachelorDto studentBachelorDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/studentbachelor/show/all", model);
        }
        else {
            studentBachelorService.saveStudentBachelor(studentBachelorDto.toStudentBachelor());
            return "redirect:/program/show/all";
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam("ID") String ID) {
        studentBachelorService.deleteStudentBachelor(ID);
        return "redirect:/program/show/all";
    }

}
