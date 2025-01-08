package gr.unipi.controller.helper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(method = RequestMethod.GET)
public class HomeController {

    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    public String home(){
        return "home.html";
    }

}
