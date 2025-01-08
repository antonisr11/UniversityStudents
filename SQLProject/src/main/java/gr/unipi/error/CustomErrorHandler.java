package gr.unipi.error;

import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@ControllerAdvice
public class CustomErrorHandler {

    public static String redirectToErrorMenu(Errors errors, String redirectionPage, Model model){
        List<String> toReturn = new ArrayList<>();
        for (ObjectError error : errors.getAllErrors()) {
            toReturn.add(error.getDefaultMessage());
        }
        model.addAttribute("errorList", toReturn);
        model.addAttribute("redirectionPage", redirectionPage);
        return "Error/error.html";
    }

    public static String redirectToErrorMenu(String error, String redirectionPage, Model model){
        List<String> toReturn = new ArrayList<>();
        toReturn.add(error);
        model.addAttribute("errorList", toReturn);
        model.addAttribute("redirectionPage", redirectionPage);
        return "Error/error.html";
    }

    @ExceptionHandler(java.sql.SQLException.class)
    public String handleCityNotFoundException( SQLException ex, Model model) {
        return redirectToErrorMenu(ex.getMessage(), "http://localhost:8080", model);
    }

}
