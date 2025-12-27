package cad.home.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cad.home.dao.MemberDao;
import cad.home.dto.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
//마이페이지 화면
	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");

		if (userId == null)
			return "redirect:/login";

		MemberDto dto = memberDao.getMemberById(userId);
		model.addAttribute("member", dto);

		return "member/mypage";
	}
//정보 수정 처리
	@PostMapping("/update")
	public String update(MemberDto dto, HttpSession session) {
		int result = memberDao.updateMember(dto);

		if (result > 0) {
			session.setAttribute("userName", dto.getUserName());
			session.setAttribute("userJob", dto.getUserJob());
			session.setAttribute("userDept", dto.getUserDept());
			session.setAttribute("userEmail", dto.getUserEmail());
			session.setAttribute("userPhone", dto.getUserPhone());
			session.setAttribute("userAddr", dto.getUserAddr());
			return "redirect:/member/mypage?msg=success";
		} else {
			return "redirect:/member/mypage?msg=fail";
		}

	}
}
