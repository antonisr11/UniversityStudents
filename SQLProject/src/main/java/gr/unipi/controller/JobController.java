package gr.unipi.controller;

import gr.unipi.entity.Job;
import gr.unipi.entity.dto.JobDto;
import gr.unipi.service.JobService;
import gr.unipi.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import java.math.BigInteger;
import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
@RequestMapping(value = "job", method = RequestMethod.GET)
public class JobController {

    private final JobService jobService;
    private final StudentService studentService;

    @Autowired
    public JobController(JobService jobService, StudentService studentService) {
        this.jobService = jobService;
        this.studentService = studentService;
    }

    @RequestMapping(value = "show/all", method = RequestMethod.GET)
    public String showAll(Model model) {
        model.addAttribute("jobsList", jobService.getAllJobs());
        return "Job/showAll.html";
    }

    @RequestMapping(value = "show/{ID}", method = RequestMethod.GET)
    public String showByID(@PathVariable BigInteger ID, Model model) {
        Job job = jobService.getJobById(ID);
        model.addAttribute("job", job);
        return "Job/showOne.html";
    }

    @RequestMapping(value = "show/insert", method = RequestMethod.GET)
    public String showInsert(Model model) {
        model.addAttribute("jobDto", new JobDto());
        model.addAttribute("studentsList", studentService.getAllStudents());
        return "Job/insert.html";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@Valid @ModelAttribute("jobDto") JobDto jobDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/job/show/insert", model);
        }
        else {
            jobService.saveJob(jobDto.toJob());
            return showAll(model);
        }
    }

    @RequestMapping(value = "show/update/{ID}", method = RequestMethod.GET)
    public String showUpdate(@PathVariable BigInteger ID, Model model) {
        model.addAttribute("job", jobService.getJobById(ID));
        model.addAttribute("studentsList", studentService.getAllStudents());
        return "Job/update.html";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid JobDto jobDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/job/show/all", model);
        }
        else {
            jobService.saveJob(jobDto.toJob());
            return showAll(model);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam("ID") BigInteger ID, Model model) {
        jobService.deleteJobById(ID);
        return showAll(model);
    }
}
