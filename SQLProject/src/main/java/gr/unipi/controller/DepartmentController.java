package gr.unipi.controller;

import gr.unipi.entity.Department;
import gr.unipi.entity.dto.DepartmentDto;
import gr.unipi.service.DepartmentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
@RequestMapping(value = "department", method = RequestMethod.GET)
public class DepartmentController {
    
    private final DepartmentService departmentService;
    
    @Autowired
    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @RequestMapping(value = "show/all", method = RequestMethod.GET)
    public String showAll(Model model) {
        model.addAttribute("departmentsList", departmentService.getAllDepartments());
        return "Department/showAll.html";
    }

    @RequestMapping(value = "show/seriousMScs", method = RequestMethod.GET)
    public String showSeriousMScs(Model model) {
        model.addAttribute("departmentsList", departmentService.getDepartmentsWithSeriousMScs());
        return "Department/showAll.html";
    }

    @RequestMapping(value = "show/moreThan50", method = RequestMethod.GET)
    public String showMoreThan50(Model model) {
        model.addAttribute("departmentsList", departmentService.getDepartmentsWithMoreThan50UniqueStudents());
        return "Department/showAll.html";
    }

    @RequestMapping(value = "show/{ID}", method = RequestMethod.GET)
    public String showByID(@PathVariable String ID, Model model) {
        Department department = departmentService.getDepartmentById(ID);
        model.addAttribute("department", department);
        model.addAttribute("uniqueStudentCount", departmentService.getCountOfUniqueStudentsByDepartmentID(department.getId()));
        return "Department/showOne.html";
    }

    @RequestMapping(value = "show/insert", method = RequestMethod.GET)
    public String showInsert(Model model) {
        model.addAttribute("departmentDto", new DepartmentDto());
        return "Department/insert.html";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("departmentDto") DepartmentDto departmentDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/department/show/insert", model);
        }
        else {
            departmentService.saveDepartment(departmentDto.toDepartment());
            return showAll(model);
        }
    }

    @RequestMapping(value = "show/update/{ID}", method = RequestMethod.GET)
    public String showUpdate(@PathVariable String ID, Model model) {
        model.addAttribute("department", departmentService.getDepartmentById(ID));
        return "Department/update.html";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid DepartmentDto departmentDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/department/show/all", model);
        }
        else {
            departmentService.saveDepartment(departmentDto.toDepartment());
            return showAll(model);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam("ID") String ID, Model model) {
        departmentService.deleteDepartmentById(ID);
        return showAll(model);
    }
}
