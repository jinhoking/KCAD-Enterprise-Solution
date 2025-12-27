package cad.home.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import cad.home.dto.MemberDto;

@Repository
public class MemberDao {
	
	@Autowired
	JdbcTemplate template;

	public MemberDao() {}
	
	// 회원가입: DTO를 받아서 추가된 모든 컬럼(USEREMAIL, USERPHONE 등)을 저장
	public void join(MemberDto member) throws Exception {
		String query = "INSERT INTO MEMBER (USERID, USERPW, USERNAME, USEREMAIL, USERPHONE, USERADDR, USERJOB, USERDEPT, COMP_ID, REGDATE) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
   
   template.update(query, 
           member.getUserId(), 
           member.getUserPw(), 
           member.getUserName(),
           member.getUserEmail(),
           member.getUserPhone(),
           member.getUserAddr(),
           member.getUserJob(),
           member.getUserDept(),
           member.getCompId() // [추가] 사용자의 회사 코드 저장
   );
}
	// 정보 가져오기: BeanPropertyRowMapper가 새로 추가된 컬럼들도 DTO에 자동으로 담아줍니다.
	public MemberDto getMember(String id) {
		String query = "SELECT * FROM MEMBER WHERE userId = ?";
		
		try {
			List<MemberDto> members = template.query(query, 
					new Object[] {id}, 
					new BeanPropertyRowMapper<MemberDto>(MemberDto.class));
			
			if (members != null && !members.isEmpty()) {
				return members.get(0); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 비밀번호 변경 및 사용자 확인 로직은 기존과 동일하게 유지
	public int checkUser(String id, String name) {
		String query = "SELECT COUNT(*) FROM MEMBER WHERE userId = ? AND userName = ?";
		return template.queryForObject(query, Integer.class, id, name);
	}

	public void updatePw(String id, String newPw) {
		String query = "UPDATE MEMBER SET userPw = ? WHERE userId = ?";
		template.update(query, newPw, id);
	}
	//개인 상세정보 쿼리
	public MemberDto getMemberById(String userId) {
		String sql = "SELECT * FROM MEMBER WHERE USERID = ? ";
		try {
			return template.queryForObject(sql, new BeanPropertyRowMapper<>(MemberDto.class), userId);
		} catch (DataAccessException e) {
			
			return null;
		}
	}
		//개인정보 수정 쿼리
		public int updateMember(MemberDto dto) {
			String sql = "UPDATE MEMBER SET USERNAME=?, USEREMAIL=?, USERPHONE=?, USERADDR=?, USERJOB=?, USERDEPT=? WHERE USERID=?";
	         return template.update(sql,
	        		 dto.getUserName(),
	        		 dto.getUserEmail(),
	        		 dto.getUserPhone(),
	        		 dto.getUserAddr(),
	        		 dto.getUserJob(),
	        		 dto.getUserDept(),
	        		 dto.getUserId()
	        		 );	
		}
}
	

