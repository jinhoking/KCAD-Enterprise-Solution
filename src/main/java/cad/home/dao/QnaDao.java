package cad.home.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cad.home.dto.QnaDto;


@Repository
public class QnaDao {
	@Autowired
    private SqlSession sqlSession; // MyBatis 자동 주입

    // Mapper XML의 namespace="cad.home.dao.BoardDao"
    private static final String NAMESPACE = "cad.home.dao.QnaDao";

    // 1. 목록
    public List<QnaDto> list(HashMap<String, String> map) {
        return sqlSession.selectList(NAMESPACE + ".list", map);
    }
    public int count(HashMap<String, String> map) {
    	return sqlSession.selectOne(NAMESPACE+".count", map);
    }

    // 2. 글쓰기
    public void write(QnaDto dto) {
        sqlSession.insert(NAMESPACE + ".write", dto);
    }

    // 3. 상세보기
    public QnaDto view(int qId) {
        return sqlSession.selectOne(NAMESPACE + ".view", qId);
    }
    
    // 4. 댓글 목록
//    public List<ReplyDto> replyList(int qId) {
//        return sqlSession.selectList(NAMESPACE + ".replyList", qId);
//    }
//    
//    // 5. 댓글 쓰기
//    public void replyWrite(ReplyDto dto) {
//        sqlSession.insert(NAMESPACE + ".replyWrite", dto);
//    }
 // BoardDao.java 안쪽에 추가

 // 6. 조회수 증가 ()
 public void upHit(int qid) {
     sqlSession.update(NAMESPACE + ".upHit", qid);
 }
//7. 글 수정 (Mapper의 id="modify" 실행)
 public void modify(QnaDto dto) {
     sqlSession.update(NAMESPACE + ".modify", dto);
 }

 // 8. 글 삭제 (Mapper의 id="delete" 실행)
 public void delete(int qId) {
     sqlSession.delete(NAMESPACE + ".delete", qId);
 }
 
//9. 답글 순서 정렬
 public void replyShape(QnaDto dto) {
     sqlSession.update(NAMESPACE + ".replyShape", dto);
 }
 // 10. 답글 등록
 public void reply(QnaDto dto) {
     sqlSession.insert(NAMESPACE + ".reply", dto);
 }
 


   
}