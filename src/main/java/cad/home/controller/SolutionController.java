package cad.home.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cad.home.dto.CompanyDto;
import cad.home.service.CompanyService;

@Controller
@RequestMapping("/solution")
public class SolutionController {
        
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/{compId}")
	public String enterCompany(@PathVariable("compId") String compId, HttpSession session) {
		//해당 회사 정보 조회
		CompanyDto comp = companyService.getCompanyInfo(compId);
		
		if(comp ==null) return "errorPage"; //회사 없으면 에러
		//세션 "현재 접속 중인 회사 정보"
		session.setAttribute("currentComp", comp);
		//전용 랜딩페이지 이동
		return "company/landing";
	}
}
