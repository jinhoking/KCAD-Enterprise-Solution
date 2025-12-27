package cad.home.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cad.home.dao.MemberDao;
import cad.home.dto.MemberDto;
import cad.home.util.SecurityUtil;

@Service
public class LoginService {
	
	@Autowired
	MemberDao memberDao;
	
	// 로그인 접속 서비스 
		public MemberDto loginService(String id, String pw) {
			
			// 1. 아이디로 일단 DB에서 사람을 찾아옴
			MemberDto member = memberDao.getMember(id);
			
			if (member == null) {
				System.out.println("❌ [로그인 실패] 존재하지 않는 아이디입니다: " + id);
				return null;
			}
			
			// 2. 사용자가 입력한 비밀번호 암호화  << 추가
			String inputPw = SecurityUtil.encryptSHA256(pw);
			// 3. DB에 있던 비밀번호 가져오기
			String dbPw = member.getUserPw();
			
			// 4. 자바로 직접 비교(비밀번호 일치여부)
			System.out.println("============== 비밀번호 검증 ==============");
			System.out.println("DB 비번: [" + dbPw + "]");
			System.out.println("입력 비번: [" + inputPw + "]");
			
			if (inputPw.equals(dbPw)) {
				System.out.println("✅ [로그인 성공] 비밀번호 일치!");
				return member; // 로그인 성공 시 회원정보 반환
			} else {
				System.out.println("❌ [로그인 실패] 비밀번호 불일치!");
				return null;
			}
		}
		//비밀변호 변경 서비스
		public boolean userCheckService(String id, String name) {
			int count = memberDao.checkUser(id, name);
			return count > 0; // 0보다 크면 true(사람 있음)
		}
		public void updatePwService(String id, String newPw) {
			String securePw = SecurityUtil.encryptSHA256(newPw);
			memberDao.updatePw(id, securePw);
		}
		//비밀번호 암호화
		public void joinService(MemberDto member) throws Exception {
		    // 1. 비밀번호 암호화
		    String securePw = SecurityUtil.encryptSHA256(member.getUserPw()); 
		    member.setUserPw(securePw); // 암호화된 비번으로 덮어쓰기
		    
		    // 2. DAO 호출 (member 객체 통째로 전달)
		    memberDao.join(member);
		}
	

}
