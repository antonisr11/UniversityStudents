package gr.unipi.controller.helper;
import gr.unipi.entity.Department;
import gr.unipi.service.DepartmentService;
import gr.unipi.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "statistics", method = RequestMethod.GET)
public class StatisticsController {

    private final StudentService studentService;
    private final DepartmentService departmentService;

    @Autowired
    public StatisticsController(StudentService studentService, DepartmentService departmentService) {
        this.studentService = studentService;
        this.departmentService = departmentService;
    }

    @RequestMapping(value = "show/all", method = RequestMethod.GET)
    public String showAll(Model model) {
        List<String> departmentsNames = new ArrayList<>();
        List<Integer> studentSum = new ArrayList<>();

        for (Department department : departmentService.getAllDepartments()) {
            departmentsNames.add(department.getName());
            studentSum.add(departmentService.getCountOfUniqueStudentsByDepartmentID(department.getId()));
        }
        model.addAttribute("departmentsNames", departmentsNames);
        model.addAttribute("studentSum", studentSum);

        model.addAttribute("studentWorkedTheMost", studentService.getStudentWorkedTheMost());
        model.addAttribute("commonFirstName", studentService.getCommonFirstName());
        model.addAttribute("commonLastName", studentService.getCommonLastName());
        model.addAttribute("yearWithMostBachelorGraduates", studentService.getYearWithMostBachelorGraduates());
        model.addAttribute("departmentWhichItsBatchelorHasTheMostWorkedDays", departmentService.getDepartmentWhichItsBatchelorHasTheMostWorkedDays());
        model.addAttribute("mobileRate", studentService.getMobileRate()*100 +"%");
        return "Statistics/main.html";
    }
}
