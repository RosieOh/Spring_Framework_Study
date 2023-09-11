package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.MemberDAO;
import kr.co.teaspoon.dto.Member;
import kr.co.teaspoon.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member getMember(String id) throws Exception {
        return memberDAO.getMember(id);
    }

    @Override
    public int memberCount() throws Exception {
        return memberDAO.memberCount();
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        memberDAO.memberInsert(member);
    }

    @Override
    public void memberEdit(Member member) throws Exception {
        memberDAO.memberEdit(member);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);
    }

    @Override
    public Member signIn(String id) throws Exception {
        return memberDAO.signIn(id);
    }

    @Override
    public boolean loginCheck(String id, String pw) throws Exception {
        // 회원 정보를 가져옴
        Member member = memberDAO.getMember(id);

        // 회원 정보가 존재하고 비밀번호가 일치하면 true 반환
        if (member != null && pw.equals(member.getPw())) {
            return true;
        }
        return false; // 그 외의 경우는 false 반환
    }

    @Override
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
    }
}