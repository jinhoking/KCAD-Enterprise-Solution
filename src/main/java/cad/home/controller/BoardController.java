package cad.home.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cad.home.dto.BoardDto;
import cad.home.dto.MemberDto;
import cad.home.dto.ReplyDto;
import cad.home.service.BoardService;
import cad.home.util.PageHandler;

import java.io.File;
import java.util.UUID;

@Controller
public class BoardController {
    
    @Autowired
    BoardService boardService;
    
    private static final String UPLOAD_PATH = "C:\\upload\\";

    // 1. 목록 보기 (누구나 가능) , //*게시판 목록 검색기능 추가
    @RequestMapping("/board/list")
    public String list(Model model,
    		                  @RequestParam(value ="searchType",required = false) String searchType,
    		                  @RequestParam(value ="keyword", required = false) String keyword,
    		                  @RequestParam(value ="page", defaultValue = "1") int page) {
    	
        HashMap<String, String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("keyword", keyword);
        
        int totalCount = boardService.count(map);
        
        int pageSize = 10;
        PageHandler ph = new PageHandler(totalCount, page, pageSize);
        
        int start = (page-1) * pageSize + 1;
        int end = page * pageSize;
        
        map.put("start", String.valueOf(start));
        map.put("end", String.valueOf(end));
        
        model.addAttribute("list", boardService.list(map));
        model.addAttribute("ph", ph);
        model.addAttribute("totalCount", totalCount);
        
        return "board/list"; // views/board/list.jsp 실행
    }
    
    // 2. 글쓰기 화면 (로그인 필수!)
    @RequestMapping("/board/write_view")
    public String writeView(HttpSession session) {
        // 세션에 loginUser가 없으면 로그인 페이지로 쫓아냄
        if(session.getAttribute("loginUser") == null) {
            return "redirect:/login"; 
        }
        // 로그인 되어있으면 글쓰기 화면으로 이동
        return "board/write_view"; // views/board/write_view.jsp 실행
    } 
    
 // 3. 글쓰기 저장 (파일 업로드 추가됨)
    @RequestMapping("/board/write")
    public String write(BoardDto dto, 
                        @RequestParam("file") MultipartFile file, // [중요] 파일을 따로 받음
                        HttpSession session) throws Exception {
        
        //  로그인 체크
        if(session.getAttribute("loginUser") == null) {
            return "redirect:/login"; 
        }
        
        // 작성자 이름 세션에서 가져오기
        MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
        
        if(loginUser !=null) {
        	dto.setbName(loginUser.getUserName());
        	dto.setbJob(loginUser.getUserJob());
        	dto.setbDept(loginUser.getUserDept());
        }
        //공지사항
        if (!"admin".equals(loginUser.getUserId())) { 
            dto.setbNotice("N"); 
        } else {
            // 관리자인 경우 JSP에서 넘어온 bNotice 값을 그대로 사용 (Y 또는 N)
            if (dto.getbNotice() == null) dto.setbNotice("N");
        }
        

        // 파일 업로드 처리 로직
        if (file != null && !file.isEmpty()) {
            // 원본 파일명 가져오기
            String originalFileName = file.getOriginalFilename();
            
            // 파일명 중복 방지를 위한 UUID 생성 (랜덤문자열_원본파일.jpg)
            String uuid = UUID.randomUUID().toString();
            String savedFileName = uuid + "_" + originalFileName;
            
            // 파일 객체 생성
            File targetFile = new File(UPLOAD_PATH + savedFileName);
            
            // 폴더가 없으면 에러나니까 폴더 생성
            if (!targetFile.getParentFile().exists()) {
                targetFile.getParentFile().mkdirs();
            }

            // 실제 파일 저장 (내 컴퓨터 C:/upload 폴더에 저장됨)
            file.transferTo(targetFile);

            // DB에는 '파일 이름'만 저장
            dto.setFileName(savedFileName);
        } else {
            // 파일 첨부 안 했을 경우
            dto.setFileName(null);
        }
        

        // 서비스 호출 (DB 저장)
        boardService.write(dto);
        
        return "redirect:/board/list"; 
    }
   
    // 4. 상세보기 (누구나 가능)
    @RequestMapping("/board/view")
    public String view(@RequestParam("bId") int bId, Model model) {
        // 조회수 증가 로직이 필요하다면 Service에 추가해야 함 (일단 생략)
    	boardService.upHit(bId);
        model.addAttribute("board", boardService.content(bId));
        model.addAttribute("replyList", boardService.replyList(bId));
        return "board/view"; // views/board/view.jsp 실행
    }
    
    // 5. 댓글 달기 (로그인 필수)
    @RequestMapping("/board/replyOk")
    public String replyOk(ReplyDto rDto, HttpSession session) {
        if(session.getAttribute("loginUser") == null) {
            return "redirect:/login"; 
        }
        // 댓글 작성자도 세션에서 가져오는 게 안전함
        MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
        
        if(loginUser !=null) {
        	rDto.setrName(loginUser.getUserName());
        	rDto.setR_Job(loginUser.getUserJob());
        	rDto.setR_Dept(loginUser.getUserDept());
        }

        boardService.replyWrite(rDto);
        return "redirect:/board/view?bId=" + rDto.getbId(); 
    }
    
 // 6. 수정 화면 이동 (로그인 체크 + 본인 확인)
    @RequestMapping("/board/modify_view")
    public String modifyView(@RequestParam("bId") int bId, Model model, HttpSession session) {
        // 로그인 안 했으면 쫓아내기
        String userName = (String) session.getAttribute("userName");
        if (userName == null) {
            return "redirect:/login";
        }
        
        // 글 정보 가져오기
        BoardDto dto = boardService.content(bId);
        
        // 내 글이 아니면 목록으로 쫓아내기 (보안)
        if (!userName.equals(dto.getbName())) {
            return "redirect:/board/list";
        }

        model.addAttribute("board", dto);
        return "board/modify_view"; // views/board/modify_view.jsp 로 이동
    }

    // 7. 수정 실행 (DB 업데이트)
    @RequestMapping("/board/modify")
    public String modify(BoardDto dto, HttpSession session) {
        // 보안 체크
        String userName = (String) session.getAttribute("userName");
        if (userName == null) { return "redirect:/login"; }
        
        // 수정할 때 작성자는 변하지 않지만, 혹시 모르니 세션값이나 기존값 유지 필요
        // (여기서는 간단히 제목, 내용만 업데이트한다고 가정)
        
        boardService.modify(dto);
        
        return "redirect:/board/view?bId=" + dto.getbId(); // 수정 후 상세페이지로 복귀
    }

    // 8. 삭제 실행
    @RequestMapping("/board/delete")
    public String delete(@RequestParam("bId") int bId, HttpSession session) {
        //  로그인 체크
        String userName = (String) session.getAttribute("userName");
        if (userName == null) { return "redirect:/login"; }

        //  본인 글인지 확인 (DB한번 더 조회해서 체크하는게 안전함)
        BoardDto dto = boardService.content(bId);
        if (!userName.equals(dto.getbName())) {
             return "redirect:/board/list"; // 남의 글 삭제 시도 차단
        }

        //  삭제
        boardService.delete(bId);
        
        return "redirect:/board/list";
    }
}