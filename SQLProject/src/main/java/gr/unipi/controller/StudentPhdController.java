package gr.unipi.controller;

import gr.unipi.entity.dto.StudentPhdDto;
import gr.unipi.service.DepartmentService;
import gr.unipi.service.StudentPhdService;
import gr.unipi.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
@RequestMapping(value = "studentphd", method = RequestMethod.GET)
public class StudentPhdController {

    private final StudentPhdService studentPhdService;
    private final StudentService studentService;
    private final DepartmentService departmentService;

    @Autowired
    public StudentPhdController(StudentPhdService studentPhdService, StudentService studentService, DepartmentService departmentService) {
        this.studentPhdService = studentPhdService;
        this.studentService = studentService;
        this.departmentService = departmentService;
    }

    @RequestMapping(value = "show/{ID}", method = RequestMethod.GET)
    public String showByID(@PathVariable String ID, Model model) {
        model.addAttribute("studentPhd", studentPhdService.getStudentPhdById(ID));
        return "Program/Phd/showOne.html";
    }

    @RequestMapping(value = "show/insert", method = RequestMethod.GET)
    public String showInsert(Model model) {
        model.addAttribute("studentPhdDto", new StudentPhdDto());
        model.addAttribute("studentsList", studentService.getAllStudents());
        model.addAttribute("departmentsList", departmentService.getAllDepartments());
        return "Program/Phd/insert.html";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("StudentPhdDto") StudentPhdDto studentphdDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/studentphd/show/insert", model);
        }
        else {
            System.out.println(studentphdDto.toStudentPhd());
            studentPhdService.saveStudentPhd(studentphdDto.toStudentPhd());
            return "redirect:/program/show/all";
        }
    }

    @RequestMapping(value = "show/update/{ID}", method = RequestMethod.GET)
    public String showUpdate(@PathVariable String ID, Model model) {
        model.addAttribute("studentphd", studentPhdService.getStudentPhdById(ID));
        model.addAttribute("studentsList", studentService.getAllStudents());
        model.addAttribute("departmentsList", departmentService.getAllDepartments());
        return "Program/Phd/update.html";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid StudentPhdDto studentPhdDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/studentphd/show/all", model);
        }
        else {
            studentPhdService.saveStudentPhd(studentPhdDto.toStudentPhd());
            return "redirect:/program/show/all";
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam("ID") String ID) {
        studentPhdService.deleteStudentPhd(ID);
        return "redirect:/program/show/all";
    }

}
