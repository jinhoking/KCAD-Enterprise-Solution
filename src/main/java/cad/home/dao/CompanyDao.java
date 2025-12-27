package cad.home.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import cad.home.dto.CompanyDto;

@Repository // [중요] 스프링이 이 클래스를 데이터 접근용 객체로 인식하게 합니다.
public class CompanyDao {

    @Autowired
    private SqlSession sqlSession;

    public CompanyDto getCompanyInfo(String compId) {
        // Mapper XML의 namespace와 id가 "CompanyMapper.getCompanyInfo"여야 합니다.
        return sqlSession.selectOne("CompanyMapper.getCompanyInfo", compId);
    }
}