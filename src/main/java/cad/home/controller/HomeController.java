package cad.home.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	// 1. 메인 화면 (http://localhost:8080/Main_Project/)
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Locale locale, Model model) {
			return "index"; // index.jsp 로 이동
		}
		
		// 2. 실시간 마크업 페이지
		@RequestMapping("/markup")
		public String pagemarkup() {
			return "markup"; // 
		}
//		
//		// 3. 실시간 히스토리 페이지
//		@RequestMapping("/history")
//		public String pagehistory() {
//			return "history"; // 
//		}
//		//4. 보안 솔루션
//       @RequestMapping("/cloud")
//       public String cloud() {
//    	   return "cloud";//
//       }
		
        //5. 기업 솔루션 인트로
		@RequestMapping("/intro")
		public String intro() {
		    return "intro"; 
		}
}
