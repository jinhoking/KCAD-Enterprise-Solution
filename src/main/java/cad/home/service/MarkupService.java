package cad.home.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cad.home.dto.MarkupDto;
import cad.home.mapper.MarkupMapper;

@Service
public class MarkupService {
    
	@Autowired
	private MarkupMapper markupMapper;
	
	public boolean registerMarkup(MarkupDto dto) {
		//성공시 1번 반환(MyBatis)
		return markupMapper.insertMarkup(dto)==1;
	}
	public List<MarkupDto> getmarkupList() {
		return markupMapper.selectMarkupList();
	}
	//마크업 디테일
		public MarkupDto getMarkupDetail(int b_no) {
			return markupMapper.selectMarkupDetail(b_no);
		}
		//삭제 디테일
		public boolean removeMarkup(int b_no) {
			return markupMapper.deleteMarkup(b_no)==1;
		}
		//수정 디테일
		public boolean modifyMarkup(MarkupDto dto) {
			return markupMapper.updateMarkup(dto)==1;
		}
		//검색 디테일
		public List<MarkupDto> getmarkupList(Map<String, Object> map) {
		    return markupMapper.selectMarkupListSearch(map);
		}
		// 전체 게시글 개수 조회 (페이징 계산용)
	    public int getTotalCount(Map<String, Object> map) {
	        return markupMapper.selectMarkupTotalCount(map);
	    }
		
}
