package cad.home.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cad.home.dao.BoardDao;
import cad.home.dto.BoardDto;
import cad.home.dto.ReplyDto;

@Service
public class BoardService {
    @Autowired
    BoardDao boardDao;
    
    //list , write, view 추가
    public List<BoardDto> list(HashMap<String, String> map) { return boardDao.list(map); }
    public void write(BoardDto dto) { boardDao.write(dto); }
    public BoardDto view(int bId) { return boardDao.view(bId); }
    
    // 댓글 기능도 추가
    public List<ReplyDto> replyList(int bId) { return boardDao.replyList(bId); }
    public void replyWrite(ReplyDto dto) { boardDao.replyWrite(dto); }
	
    public BoardDto content(int bId) {
		return boardDao.view(bId);
	}

 // 조회수 증가 기능 (이 메서드를 추가하세요)
 public void upHit(int bId) {
     boardDao.upHit(bId);
 }
 
//수정 ,삭제 컨트롤러
public void modify(BoardDto dto) {
  boardDao.modify(dto);
}
//삭제
public void delete(int bId) {
  boardDao.delete(bId);
}
//댓글 카운트
public int count(HashMap<String, String> map) {
	return boardDao.count(map);
	
}
    

    
    
}