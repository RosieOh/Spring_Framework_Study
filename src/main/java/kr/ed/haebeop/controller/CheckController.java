package kr.ed.haebeop.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/check/")
public class CheckController {
    @GetMapping("check1")   // http://localhost:8084/check/check1
    public String check1(Model model) {
        return "/check/check1";
    }
    @PostMapping("check1")  // http://localhost:8084/check/check1 POST
    public String checkPro(@RequestParam String id, @RequestParam String pw, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("pw", pw);
        return "/check/check1_result";
    }
}