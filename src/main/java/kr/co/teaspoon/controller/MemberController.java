package kr.co.teaspoon.controller;

import kr.co.teaspoon.service.MemberService;
import kr.co.teaspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member/*")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    @RequestMapping(value = "list.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
        List <Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        return "/member/memberList";
    }
    // 관리자가 회원의 상세 정보 보기

    // 관리자가 회원의 상세 정보 보기
//    @GetMapping("detail.do")
//    public String memberDetail(@RequestParam String id, Model model) throws Exception {
//        Member member = memberService.getMember(id);
//        model.addAttribute("member", member);
//        return "/member/memberDetail";
//    }
    @GetMapping("detail.do")
    public String memberDetail(@RequestParam(required = false) String id, Model model) throws Exception {
        if (id == null) {
            // 'id' 파라미터가 누락된 경우
            model.addAttribute("errorMessage", "회원 ID가 누락되었습니다.");
            return "/errorPage"; // 오류 페이지로 이동하도록 수정
        }

        Member member = memberService.getMember(id);
        if (member == null) {
            // 해당 ID의 회원을 찾을 수 없는 경우
            model.addAttribute("errorMessage", "해당 회원을 찾을 수 없습니다.");
            return "/errorPage"; // 오류 페이지로 이동하도록 수정
        }

        model.addAttribute("member", member);
        return "/member/memberDetail";
    }
    // 일반 회원 본인 정보 보기
    @GetMapping("mypage.do")
    public String mypage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }

    // 회원가입 - 회원 가입 처리
    @RequestMapping(value = "insert.do", method = RequestMethod.POST)
    public String memberWrite(Member member, Model model) throws Exception{
        return "redirect:/";
    }

    // 로그인 폼 로딩
    @RequestMapping("login.do")
    public String memberLoginForm(Model model) throws Exception {
        return "/member/loginForm";
    }

    // 관리자가 회원 정보 보는 방법
    @GetMapping("admin/memberList.do")
    public String adminMemberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        return "/admin/memberList";
    }

    // 관리자가 회원 상세정보를 조회
    @GetMapping("admin/memberDetail.do")
    public String adminMemberDetail(@RequestParam(required = false) String id, Model model) throws Exception {
        if (id == null) {
            // 'id' 파라미터가 누락된 경우
            model.addAttribute("errorMessage", "회원 ID가 누락되었습니다.");
            return "/errorPage"; // 오류 페이지로 이동하도록 수정
        }

        Member member = memberService.getMember(id);
        if (member == null) {
            // 해당 ID의 회원을 찾을 수 없는 경우
            model.addAttribute("errorMessage", "해당 회원을 찾을 수 없습니다.");
            return "/errorPage"; // 오류 페이지로 이동하도록 수정
        }

        model.addAttribute("member", member);
        return "/admin/memberDetail";
    }

    // 관리자가 회원 목록 조회 페이지로 이동하는 메서드
    @GetMapping("admin/memberListForm.do")
    public String adminMemberListForm() {
        return "/admin/memberListForm";
    }



}
