package gr.unipi.controller;

import gr.unipi.entity.Msc;
import gr.unipi.entity.dto.MscDto;
import gr.unipi.service.DepartmentService;
import gr.unipi.service.MscService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.math.BigInteger;
import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
@RequestMapping(value = "msc", method = RequestMethod.GET)
public class MscController {

    private final MscService mscService;
    private final DepartmentService departmentService;

    @Autowired
    public MscController(MscService mscService, DepartmentService departmentService) {
        this.mscService = mscService;
        this.departmentService = departmentService;
    }

    @RequestMapping(value = "show/all", method = RequestMethod.GET)
    public String showAll(Model model) {
        model.addAttribute("mscsList", mscService.getAllMsc());
        return "Msc/showAll.html";
    }

    @RequestMapping(value = "show/free", method = RequestMethod.GET)
    public String showFree(Model model) {
        model.addAttribute("mscsList", mscService.getFreeMscs());
        return "Msc/showAll.html";
    }

    @RequestMapping(value = "show/costPerMonth", method = RequestMethod.GET)
    public String showCostPerMonth(Model model) {
        model.addAttribute("mscsList", mscService.getCostPerMonthMscs());
        return "Msc/showAll.html";
    }

    @RequestMapping(value = "show/{ID}", method = RequestMethod.GET)
    public String showByID(@PathVariable BigInteger ID, Model model) {
        Msc msc = mscService.getMscById(ID);
        model.addAttribute("msc", msc);
        return "Msc/showOne.html";
    }
    @RequestMapping(value = "show/insert", method = RequestMethod.GET)
    public String showInsert(Model model) {
        model.addAttribute("mscDto", new MscDto());
        model.addAttribute("departmentsList", departmentService.getAllDepartments());
        return "Msc/insert.html";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(@Valid MscDto mscDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/msc/show/insert", model);
        }
        else {
            mscService.saveMsc(mscDto.toMsc());
            return showAll(model);
        }
    }

    @RequestMapping(value = "show/update/{ID}", method = RequestMethod.GET)
    public String showUpdate(@PathVariable BigInteger ID, Model model) {
        model.addAttribute("msc", mscService.getMscById(ID));
        model.addAttribute("departmentsList", departmentService.getAllDepartments());
        return "Msc/update.html";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid MscDto mscDto, Errors errors, Model model){
        if (errors.hasErrors()){
            return redirectToErrorMenu(errors, "http://localhost:8080/msc/show/all", model);
        }
        else {
            mscService.saveMsc(mscDto.toMsc());
            return showAll(model);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam("ID") BigInteger ID, Model model) {
        mscService.deleteMscByID(ID);
        return showAll(model);
    }
    
}
