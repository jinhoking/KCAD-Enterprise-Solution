package cad.home.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cad.home.dao.QnaDao;
import cad.home.dto.QnaDto; 

@Service 
public class QnaService {
    
    @Autowired
    QnaDao qnaDao;
    
    // 1. 목록 조회 
    public List<QnaDto> list(HashMap<String, String> map) { 
        return qnaDao.list(map); 
    }

    // 2. 글쓰기 
    public void write(QnaDto dto) { 
        qnaDao.write(dto); 
    }

    // 3. 상세 보기 
    // Controller에서 content(qId)를 호출하므로 메서드 이름을 content로 유지
    public QnaDto content(int qId) {
        return qnaDao.view(qId); // DAO에는 view라는 이름으로 되어있음
    }

    // 4. 조회수 증가
    public void upHit(int qId) {
        qnaDao.upHit(qId);
    }
    
    // 5. 수정 (BoardDto -> QnaDto 로 변경)
    public void modify(QnaDto dto) {
        qnaDao.modify(dto);
    }

    // 6. 삭제
    public void delete(int qId) {
        qnaDao.delete(qId);
    }

    // 7. 게시글 총 개수 (페이징용)
    public int count(HashMap<String, String> map) {
        return qnaDao.count(map);
    }
    //8. 답변 등록
    public void reply(QnaDto dto) {
    	qnaDao.replyShape(dto);
    	qnaDao.reply(dto);
    }
    // [삭제됨] 댓글(reply) 기능은 QnA 구조상 제외했으므로 삭제했습니다.
}