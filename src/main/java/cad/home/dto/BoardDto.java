package cad.home.dto;

import java.sql.Timestamp;

public class BoardDto {
	
	private Integer bId;
	private String bName;
	private String bTitle;
	private String bContent;
	private Timestamp bDate;
	private Integer bHit;
	private String fileName;
	private Integer replyCount;
	private String bNotice;
	private String bJob;
	private String bDept;
	
	
	public BoardDto() {
	}

	public BoardDto(Integer bId, String bName, String bTitle, String bContent, Timestamp bDate, Integer bHit,
			String fileName) {
		super();
		this.bId = bId;
		this.bName = bName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.fileName = fileName;
	}
	
	public String getbNotice() {
		return bNotice;
	}

	public void setbNotice(String bNotice) {
		this.bNotice = bNotice;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public Integer getbId() {
		return bId;
	}

	public void setbId(Integer bId) {
		this.bId = bId;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public Integer getbHit() {
		return bHit;
	}

	public void setbHit(Integer bHit) {
		this.bHit = bHit;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getbJob() {
		return bJob;
	}

	public void setbJob(String bJob) {
		this.bJob = bJob;
	}

	public String getbDept() {
		return bDept;
	}

	public void setbDept(String bDept) {
		this.bDept = bDept;
	}

	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}

	
	
	
	
}
