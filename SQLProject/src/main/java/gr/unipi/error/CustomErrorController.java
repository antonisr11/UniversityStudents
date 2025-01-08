package gr.unipi.error;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static gr.unipi.error.CustomErrorHandler.redirectToErrorMenu;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        try {
            Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
            int statusCode = Integer.parseInt(status.toString());
            if (statusCode == 404) {
                return redirectToErrorMenu("Page not found", "http://localhost:8080", model);
            }
            else {
                String errorMessage = ((Exception) request.getAttribute(RequestDispatcher.ERROR_EXCEPTION)).getCause().getCause().getMessage();
                return redirectToErrorMenu(errorMessage.replace("com.example.sqlproject.entity.", ""), "http://localhost:8080", model);
            }
        } catch (Exception e) {
            return "redirect:/";
        }
    }

}
