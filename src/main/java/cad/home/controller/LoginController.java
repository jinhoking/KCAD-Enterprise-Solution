package cad.home.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cad.home.dto.CompanyDto;
import cad.home.dto.MemberDto;
import cad.home.service.LoginService;


@Controller
public class LoginController {

	@Autowired
	LoginService loginService; // 서비스 주입 (패키지명 cad.home 확인!)

	//  로그인 화면으로 이동
	@RequestMapping("/login")
	public String loginForm() {
		return "member/login"; // login.jsp 로 이동
	}

	//  로그인 실행 (암호화된 비번 비교 -> 세션 저장)
	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String loginOk(@RequestParam("id") String id, 
	                      @RequestParam("pw") String pw, 
	                      @RequestParam(value="loginCompId", required=false) String loginCompId, // [추가] hidden으로 넘어온 회사ID
	                      HttpSession session, 
	                      HttpServletResponse response) throws Exception {
	    
	    MemberDto loginUser = loginService.loginService(id, pw);
	    
	    if (loginUser != null) {
	        // [추가] 기업 전용 페이지에서 로그인 시도 시 소속 확인 보안 로직
	        if (loginCompId != null && !loginCompId.isEmpty()) {
	            if (!loginUser.getCompId().equals(loginCompId)) {
	                response.setContentType("text/html; charset=UTF-8");
	                PrintWriter out = response.getWriter();
	                out.println("<script>alert('해당 기업의 소속 인원이 아닙니다.'); history.go(-1);</script>");
	                out.flush();
	                return null;
	            }
	        }

	        // 로그인 성공 시 세션 저장
	        session.setAttribute("loginUser", loginUser);       
	        session.setAttribute("userId", loginUser.getUserId());
	        session.setAttribute("userName", loginUser.getUserName());
	        session.setAttribute("compId", loginUser.getCompId()); // [추가] 유저의 회사코드 저장
	        
	        session.setAttribute("userJob", loginUser.getUserJob());
	        session.setAttribute("userDept", loginUser.getUserDept());
	        
	        session.setMaxInactiveInterval(60 * 60);

	        // [수정] 로그인 후 원래 접속했던 기업 전용 메인으로 이동
	        if (loginCompId != null && !loginCompId.isEmpty()) {
	            return "redirect:/solution/" + loginCompId;
	        }
	        return "redirect:/"; 
	        
	    } else {
	        // 로그인 실패 로직 (기존 유지)
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인 실패! 아이디나 비밀번호를 확인해주세요.'); history.go(-1);</script>");
	        out.flush();
	        return null;
	    }
	}

	// 로그아웃 시 세션을 비우더라도 어느 회사였는지는 기억했다가 다시 그 회사 대문으로 보내기
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    CompanyDto currentComp = (CompanyDto) session.getAttribute("currentComp");
	    String compId = (currentComp != null) ? currentComp.getCompId() : "";
	    
	    session.invalidate();
	    
	    if (!compId.isEmpty()) {
	        return "redirect:/solution/" + compId;
	    }
	    return "redirect:/";
	}
	
	@RequestMapping("/join")
	public String joinForm() {
		return "member/join"; //join.jsp
	}
	@RequestMapping(value="/joinOk", method = RequestMethod.POST)
	public String joinOk(MemberDto member, HttpServletResponse response) throws Exception {
	    
	    // 1. 유효성 검사 (빈칸 체크)
	    if (member.getUserId() == null || member.getUserId().trim().isEmpty() || 
	        member.getUserPw() == null || member.getUserPw().trim().isEmpty() || 
	        member.getUserName() == null || member.getUserName().trim().isEmpty()) {
	        
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('필수 정보에 빈칸이 있습니다.'); history.go(-1);</script>");
	        out.flush();
	        return null;
	    }

	    try {
	        // 2. 서비스 호출 (DTO 객체 통째로 전달)
	        // 서비스의 joinService 메서드 파라미터도 MemberDto를 받도록 수정해야 합니다.
	        loginService.joinService(member); 
	        
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('회원가입이 완료되었습니다! 로그인해주세요.'); location.href='login';</script>");
	        out.flush();
	        return null;
	    
	    } catch (Exception e) {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('회원가입 중 오류가 발생했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
	        out.flush();
	        return null;
	    }	
	}
	//비밀번호 찾기 컨트롤러
//  비밀번호 찾기 화면으로 이동
		@RequestMapping("/findPw")
		public String findPw() {
			return "member/find_pw"; // find_pw.jsp
		}
		
		//  본인 확인 후 -> 비밀번호 변경 페이지로 이동
		@RequestMapping(value = "/findCheck", method = RequestMethod.POST)
		public String findCheck(@RequestParam("userId") String id, 
				                @RequestParam("userName") String name,
				                Model model,
				                HttpServletResponse response) throws Exception {
			
			boolean exists = loginService.userCheckService(id, name);
			
			if (exists) {
				// 본인 확인 성공! -> 아이디를 변경 페이지로 넘겨줌
				model.addAttribute("userId", id);
				return "member/update_pw"; // update_pw.jsp (새 비번 입력창)
			} else {
				// 실패
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('일치하는 회원 정보가 없습니다.'); history.go(-1);</script>");
				out.flush();
				return null;
			}
		}

		//  새 비밀번호 저장 실행
		@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
		public String updatePw(@RequestParam("userId") String id,
				               @RequestParam("userPw") String newPw,
				               HttpServletResponse response) throws Exception {
			
			loginService.updatePwService(id, newPw);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 변경되었습니다. 다시 로그인해주세요.'); location.href='login';</script>");
			out.flush();
			return null;
		}	

}