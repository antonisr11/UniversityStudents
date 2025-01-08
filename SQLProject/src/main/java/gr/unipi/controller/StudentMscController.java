package gr.unipi.controller;

import gr.unipi.entity.dto.StudentMscDto;
import gr.unipi.service.MscService;
import gr.unipi.service.StudentMscService;
import gr.unipi.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
@RequestMapping(value = "studentmsc", method = RequestMethod.GET)
public class StudentMscController {

    private final StudentMscService studentMscService;
    private final StudentService studentService;
    private final MscService mscService;

    @Autowired
    public StudentMscController(StudentMscService studentMscService, StudentService studentService, MscService mscService) {
        this.studentMscService = studentMscService;
        this.studentService = studentService;
        this.mscService = mscService;
    }

    @RequestMapping(value = "show/{ID}", method = RequestMethod.GET)
    public String showByID(@PathVariable String ID, Model model) {
        model.addAttribute("studentMsc", studentMscService.getStudentMscById(ID));
        return "Program/Msc/showOne.html";
    }

    @RequestMapping(value = "show/insert", method = RequestMethod.GET)
    public String showInsert(Model model) {
        model.addAttribute("studentMscDto", new StudentMscDto());
        model.addAttribute("studentsList", studentService.getAllStudents());
        model.addAttribute("mscList", mscService.getAllMsc());
        return "Program/Msc/insert.html";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("StudentMscDto") StudentMscDto studentmscDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/studentmsc/show/insert", model);
        }
        else {
            System.out.println(studentmscDto.toStudentMsc());
            studentMscService.saveStudentMsc(studentmscDto.toStudentMsc());
            return "redirect:/program/show/all";
        }
    }

    @RequestMapping(value = "show/update/{ID}", method = RequestMethod.GET)
    public String showUpdate(@PathVariable String ID, Model model) {
        model.addAttribute("studentmsc", studentMscService.getStudentMscById(ID));
        model.addAttribute("studentsList", studentService.getAllStudents());
        model.addAttribute("mscList", mscService.getAllMsc());
        return "Program/Msc/update.html";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid StudentMscDto studentMscDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/studentmsc/show/all", model);
        }
        else {
            studentMscService.saveStudentMsc(studentMscDto.toStudentMsc());
            return "redirect:/program/show/all";
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam("ID") String ID) {
        studentMscService.deleteStudentMsc(ID);
        return "redirect:/program/show/all";
    }

}
