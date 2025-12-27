package cad.home.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service; // 필수 임포트
import cad.home.dto.CompanyDto;
import cad.home.dao.CompanyDao;

@Service // [중요] 스프링이 이 클래스를 서비스로 인식하게 합니다.
public class CompanyService {

    @Autowired
    private CompanyDao companyDao; // DAO 연결

    public CompanyDto getCompanyInfo(String compId) {
        // DAO를 호출해서 실제 DB 데이터를 가져옵니다.
        return companyDao.getCompanyInfo(compId);
    }
}