package cad.home.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cad.home.dto.MarkupDto;
import cad.home.dto.MemberDto;
import cad.home.service.MarkupService;

import cad.home.util.PageHandler;

@Controller
public class MarkupController {

    @Autowired
    private MarkupService markupService;

    // 1. 도면 업로드 폼 이동
    @GetMapping("/markupUpload")
    public String showUploadForm(HttpSession session) {
        // 로그인 체크 (보안)
        if (session.getAttribute("loginUser") == null) {
            return "redirect:/login"; 
        }
        return "markup/markupUpload";
    }

    // 2. 캔버스 편집기 이동 (업로드 직후 리다이렉트됨)
    @GetMapping("/markup")
    public String showMarkupPage(@RequestParam("filename") String filename,
                                @RequestParam("b_title") String b_title,
                                @RequestParam("b_category") String b_category,
                                Model model) {
    	
    	if(b_category == null) b_category = "기타";
        
    	model.addAttribute("filename", filename);
        model.addAttribute("b_title", b_title);
        model.addAttribute("b_category", b_category);
        return "markup/markup"; 
    }

    // 3. 최초 도면 업로드 처리 (파일 저장 후 편집기로 이동)
    @PostMapping("/uploadDrawing")
    public String uploadDrawing(@ModelAttribute MarkupDto dto, 
                                @RequestParam("file") MultipartFile file, 
                                RedirectAttributes rttr) {
        String uploadPath = "C:/upload/markup/"; 
        try {
            if(!file.isEmpty()) {
                String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                file.transferTo(new File(uploadPath, fileName));

                // 편집기(markup.jsp)에서 사용할 정보들 전달
                rttr.addAttribute("filename", fileName);
                rttr.addAttribute("b_title", dto.getB_title());
                rttr.addAttribute("b_category", dto.getB_category());
            }
            return "redirect:/markup"; 
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/markupUpload?error";
        }
    }

    // 4. 캔버스 마킹 이미지 최종 저장 (AJAX 호출)
    @PostMapping("/markup/save")
    @ResponseBody
    public Map<String, String> saveMarkup(@RequestBody Map<String, String> params, HttpSession session) {
        Map<String, String> response = new HashMap<>();
        try {
            String imgData = params.get("imgData"); // 캔버스 합성 이미지(Base64)
            String title = params.get("title");
            String category = params.get("category");
            
            MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");

            // 1) Base64 이미지 변환 및 저장
            String base64Content = imgData.split(",")[1];
            byte[] imageBytes = java.util.Base64.getDecoder().decode(base64Content);
            String uploadPath = "C:/upload/markup/"; 
            String fileName = "MARKUP_" + System.currentTimeMillis() + ".png";
            org.apache.commons.io.FileUtils.writeByteArrayToFile(new File(uploadPath, fileName), imageBytes);

            // 2) DTO 구성 (모든 컬럼 정보 집약)
            MarkupDto dto = new MarkupDto();
            dto.setB_title(title);
            dto.setB_filepath(fileName);
            dto.setB_category(category);
            dto.setB_status("검토중"); // 초기 상태 설정
            
            if(loginUser != null) {
                dto.setB_writer(loginUser.getUserId()); // 아이디
                dto.setB_job(loginUser.getUserJob());     // 직무
                dto.setB_dept(loginUser.getUserDept());   // 부서
            }

            // 3) DB 저장
            boolean isSaved = markupService.registerMarkup(dto);
            response.put("result", isSaved ? "success" : "fail");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.put("result", "error");
        }
        return response;
    }

    @GetMapping("/markupList")
    public String markupList(
            @RequestParam(value="page", defaultValue="1") int page, // 현재 페이지
            @RequestParam(value="status", required=false) String status,
            @RequestParam(value="keyword", required=false) String keyword,
            Model model) {
        
        int pageSize = 12; // Criteria에 있던 amount(12) 역할을 여기서 수행
        
        // 1. 전체 데이터 개수 조회 (검색 조건 포함)
        Map<String, Object> searchMap = new HashMap<>();
        searchMap.put("status", status);
        searchMap.put("keyword", keyword);
        int totalCount = markupService.getTotalCount(searchMap); // 전체 개수를 알아야 페이징 계산 가능

        // 2. PageHandler 생성 (전체개수, 현재페이지, 페이지당개수)
        PageHandler ph = new PageHandler(totalCount, page, pageSize);
        
        // 3. DB 조회를 위한 데이터 설정 (offset 계산 등)
        searchMap.put("offset", (page - 1) * pageSize); // MyBatis에서 쓸 시작 위치
        searchMap.put("pageSize", pageSize);
        
        // 4. 리스트 조회
        List<MarkupDto> list = markupService.getmarkupList(searchMap);
        
        model.addAttribute("list", list);
        model.addAttribute("ph", ph); // 화면 페이징 UI용
        
        return "markup/markupList";
    }

    // 6. 마크업 상세 보기
    @GetMapping("/markupDetail")
    public String markupDetail(@RequestParam("b_no") int b_no, Model model) {
        MarkupDto dto = markupService.getMarkupDetail(b_no);
        model.addAttribute("markup", dto);
        return "markup/markupDetail";
    }

    // 7. [기능 추가] 검토 승인 처리
    @GetMapping("/markupApprove")
    public String markupApprove(@RequestParam("b_no") int b_no) {
        MarkupDto dto = markupService.getMarkupDetail(b_no);
        dto.setB_status("승인완료");
        markupService.modifyMarkup(dto); // 수정을 통해 상태값만 변경
        return "redirect:/markupDetail?b_no=" + b_no;
    }

    // 8. 마크업 삭제
    @GetMapping("/markupDelete")
    public String markupDelete(@RequestParam("b_no") int b_no) {
        markupService.removeMarkup(b_no);
        return "redirect:/markupList";
    }

    // 9. 수정 화면 이동
    @GetMapping("/markupModify")
    public String showModifyForm(@RequestParam("b_no") int b_no, Model model) {
        model.addAttribute("markup", markupService.getMarkupDetail(b_no));
        return "markup/markupModify";
    }

    // 10. 정보 수정 처리 (제목, 카테고리 등)
    @PostMapping("/modifyAction")
    public String markupModify(@ModelAttribute MarkupDto dto) {
        markupService.modifyMarkup(dto);
        return "redirect:/markupDetail?b_no=" + dto.getB_no();
    }
}