package cad.home.dao;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import cad.home.dto.BoardDto;
import cad.home.dto.ReplyDto;


@Repository
public class BoardDao {

    @Autowired
    private SqlSession sqlSession; // MyBatis 자동 주입

    // Mapper XML의 namespace="cad.home.dao.BoardDao"
    private static final String NAMESPACE = "cad.home.dao.BoardDao";

    // 1. 목록
    public List<BoardDto> list(HashMap<String, String> map) {
        return sqlSession.selectList(NAMESPACE + ".list", map);
    }
    public int count(HashMap<String, String> map) {
    	return sqlSession.selectOne(NAMESPACE+".count", map);
    }

    // 2. 글쓰기
    public void write(BoardDto dto) {
        sqlSession.insert(NAMESPACE + ".write", dto);
    }

    // 3. 상세보기
    public BoardDto view(int bId) {
        return sqlSession.selectOne(NAMESPACE + ".view", bId);
    }
    
    // 4. 댓글 목록
    public List<ReplyDto> replyList(int bId) {
        return sqlSession.selectList(NAMESPACE + ".replyList", bId);
    }
    
    // 5. 댓글 쓰기
    public void replyWrite(ReplyDto dto) {
        sqlSession.insert(NAMESPACE + ".replyWrite", dto);
    }
 // BoardDao.java 안쪽에 추가

 // 6. 조회수 증가 ()
 public void upHit(int bId) {
     sqlSession.update(NAMESPACE + ".upHit", bId);
 }
//7. 글 수정 (Mapper의 id="modify" 실행)
 public void modify(BoardDto dto) {
     sqlSession.update(NAMESPACE + ".modify", dto);
 }

 // 8. 글 삭제 (Mapper의 id="delete" 실행)
 public void delete(int bId) {
     sqlSession.delete(NAMESPACE + ".delete", bId);
 }
 


   
}