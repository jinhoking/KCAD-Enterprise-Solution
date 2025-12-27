package cad.home.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cad.home.dto.MarkupDto;

@Mapper
public interface MarkupMapper {
	
	int insertMarkup(MarkupDto dto);
	int deleteMarkup(int b_no);
	int updateMarkup(MarkupDto dto); 
	
	List<MarkupDto> selectMarkupList();
	// 검색/필터용 리스트 (이름 변경)
    List<MarkupDto> selectMarkupListSearch(Map<String, Object> map);
	MarkupDto selectMarkupDetail(int b_no);
	int selectMarkupTotalCount(Map<String, Object> map);
	

	

}
