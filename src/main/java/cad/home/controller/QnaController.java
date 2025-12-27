package cad.home.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cad.home.dto.QnaDto;
import cad.home.service.QnaService;
import cad.home.util.PageHandler;

@Controller
public class QnaController {

	@Autowired
	QnaService qnaService;

	// 1. 목록 보기
	@RequestMapping("/qna/list")
	public String list(Model model, 
	                   @RequestParam(value = "searchType", required = false) String searchType,
	                   @RequestParam(value = "keyword", required = false) String keyword,
	                   @RequestParam(value = "page", defaultValue = "1") int page,
	                   HttpSession session) { // [추가] 세션 확인을 위해 HttpSession 파라미터 추가

	    // [보안 추가] 로그인 세션 체크: userName이 없으면 로그인 페이지로 강제 이동
	    if (session.getAttribute("userName") == null) {
	        return "redirect:/login"; 
	    }

	    HashMap<String, String> map = new HashMap<>();
	    map.put("searchType", searchType);
	    map.put("keyword", keyword);

	    int totalCount = qnaService.count(map);

	    int pageSize = 10;
	    PageHandler ph = new PageHandler(totalCount, page, pageSize);

	    int start = (page - 1) * pageSize + 1;
	    int end = page * pageSize;

	    map.put("start", String.valueOf(start));
	    map.put("end", String.valueOf(end));

	    // 데이터 바인딩
	    model.addAttribute("list", qnaService.list(map));
	    model.addAttribute("ph", ph);
	    model.addAttribute("totalCount", totalCount);

	    return "qna/list";
	}

	// 2. 글쓰기 화면
	@RequestMapping("/qna/write_view")
	public String writeView(HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			return "redirect:/login";
		}
		return "qna/write_view"; // board 폴더의 jsp 재사용
	}

	// 3. 글쓰기 저장 (파일 업로드 제거 - DTO에 없으므로)
	@RequestMapping("/qna/write") // [수정] URL /board -> /qna
	public String write(QnaDto dto, HttpSession session) {

		if (session.getAttribute("loginUser") == null) {
			return "redirect:/login";
		}

		String userName = (String) session.getAttribute("userName");

		dto.setqName(userName);

		// [수정] 서비스 호출
		qnaService.write(dto);

		return "redirect:/qna/list";
	}
	//4. 비밀글 로직
	//jsp에서 다룸
	@RequestMapping("/qna/view")
	public String view(@RequestParam("qId") int qId, Model model, HttpSession session) {
	    // 1. 데이터 가져오기
	    QnaDto dto = qnaService.content(qId);
	    
	    // 2. 조회수 증가
	    qnaService.upHit(qId);
	    
	    // 3. 모델에 담기
	    model.addAttribute("board", dto);
	    
	    return "qna/view"; 
	}

	// 5. 댓글 달기 기능 삭제 (QnA는 답글 구조이므로 일단 제외)

	// 6. 수정 화면 이동
	@RequestMapping("/qna/modify_view")
	public String modifyView(@RequestParam("qId") int qId, Model model, HttpSession session) { // bId -> qId

		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			return "redirect:/login";
		}

		// [수정] DTO 변경
		QnaDto dto = qnaService.content(qId);

		// [수정] 작성자 확인 (getqName)
		if (!userName.equals(dto.getqName())) {
			return "redirect:/qna/list";
		}

		model.addAttribute("board", dto);
		return "qna/modify_view";
	}

	// 7. 수정 실행
	@RequestMapping("/qna/modify") // URL 변경
	public String modify(QnaDto dto, HttpSession session) {

		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			return "redirect:/login";
		}

		// [수정] service 호출
		qnaService.modify(dto);

		return "redirect:/qna/view?qId=" + dto.getqId(); // [수정] 리다이렉트 파라미터 변경
	}

	// 8. 삭제 실행
	@RequestMapping("/qna/delete") // URL 변경
	public String delete(@RequestParam("qId") int qId, HttpSession session) { // bId -> qId

		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			return "redirect:/login";
		}

		// 본인 확인
		QnaDto dto = qnaService.content(qId);
		if (!userName.equals(dto.getqName())) {
			return "redirect:/qna/list";
		}

		// 삭제
		qnaService.delete(qId);

		return "redirect:/qna/list";
	}

	// 9. 답변 작성 화면(관리자만 가능)
	@RequestMapping("/qna/reply_view")
	public String replyView(@RequestParam("qId") int qId, Model model, HttpSession session) {
		// 관리자 아닐시 벤
		String userName = (String) session.getAttribute("userName");
		if (userName == null || !userName.equals("admin")) {
			return "redirect:/qna/list";
		}
		// 원글 정보 가져오기
		QnaDto dto = qnaService.content(qId);
		model.addAttribute("reply_view", dto);
		return "qna/reply_view";
	}

	// 10. 답변 등록 실행(관리자만 가능)
	@RequestMapping("qna/reply")
	public String reply(QnaDto dto, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		if (userName == null || !userName.equals("admin")) {
			return "redirect:/qna/list";
		}
		dto.setqName(userName); // 작성자 admin 고정
		qnaService.reply(dto); // 답변 등록
		return "redirect:/qna/list";
	}

}