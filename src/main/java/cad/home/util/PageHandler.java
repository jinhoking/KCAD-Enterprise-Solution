package cad.home.util;

public class PageHandler {
	
	private int total;      // 전체 게시글 수
    private int nowPage;    // 현재 페이지
    private int pageSize;   // 한 페이지당 보여줄 글 갯수 (보통 10개)
    
    private int totalPage;  // 전체 페이지 수
    private int beginPage;  // 네비게이션 시작 번호 (1, 11, 21...)
    private int endPage;    // 네비게이션 끝 번호 (10, 20, 30...)
    private boolean showPrev; // [이전] 버튼 보이기 여부
    private boolean showNext; // [다음] 버튼 보이기 여부
    
    private int naviSize = 2; // 페이지 네비게이션 크기 (1~10페이지씩 보여줌)

	public PageHandler(int total, int nowPage, int pageSize) {
		super();
		this.total = total;
		this.nowPage = nowPage;
		this.pageSize = pageSize;
		
		doPaging(); //생성자 주입
	}
	//목록 페이지 계산 
	public void doPaging() {
        // 1. 전체 페이지 수 계산
        totalPage = (int) Math.ceil((double)total / pageSize);
        
        // 2. 현재 페이지에 따른 네비게이션 시작/끝 번호 계산
        // 예: 현재 3페이지 -> endPage=10, beginPage=1
        // 예: 현재 15페이지 -> endPage=20, beginPage=11
        endPage = (int) (Math.ceil((double)nowPage / naviSize)) * naviSize;
        beginPage = endPage - (naviSize - 1);
        
        if (totalPage == 0) {
            totalPage = 1;
        }
        
        
        // 3. 실제 끝 페이지보다 계산된 endPage가 더 크면 보정
        if(endPage > totalPage) {
            endPage = totalPage;
        }
        
        // 4. 이전/다음 버튼 보이기 여부
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public int getNaviSize() {
		return naviSize;
	}

	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}
	
	

    
}
