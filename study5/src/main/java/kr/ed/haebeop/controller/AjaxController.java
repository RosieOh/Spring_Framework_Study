package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.TestVO;
import kr.ed.haebeop.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ajax")
public class AjaxController {

    @GetMapping("/")
    public String ajaxHome() {
        return "/ajax/home";
    }

    @GetMapping("/test1")
    public String ajaxTest1() {
        return "/ajax/test1";
    }

    @GetMapping("/test1pro")
    public String ajaxTest1pro(@RequestParam("msg") String msg) {
        System.out.println(msg);
        return "/ajax/test1";
    }

    @GetMapping("/test2")
    public String ajaxTest1Pro(@RequestParam("msg") String msg) {
        System.out.println(msg);
        return "/ajax/test2";
    }
}
