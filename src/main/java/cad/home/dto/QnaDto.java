package cad.home.dto;

import java.sql.Date;

public class QnaDto {
	
	private Integer qId;
	private String qName;
    private String qTitle; 
    private String qContent;
    private Date qDate; 
    private Integer qHit;
    private Integer qGroup;        
    private Integer qStep;
    private Integer qIndent;
    private String qSecret; // 비밀글 여부 (Y/N)
    private String qNotice; // 공지사항
    private String qParentName; // 원글 작성자 ID
    private String qJob;
    private String qDept;

    public QnaDto() {
}

public QnaDto(Integer qId, String qName, String qTitle, String qContent, Date qDate, Integer qHit, Integer qGroup,
		Integer qStep, Integer qIndent) {
	super();
	this.qId = qId;
	this.qName = qName;
	this.qTitle = qTitle;
	this.qContent = qContent;
	this.qDate = qDate;
	this.qHit = qHit;
	this.qGroup = qGroup;
	this.qStep = qStep;
	this.qIndent = qIndent;
}


public String getqParentName() {
	return qParentName;
}

public void setqParentName(String qParentName) {
	this.qParentName = qParentName;
}

public String getqNotice() { return qNotice; }

public void setqNotice(String qNotice) { this.qNotice = qNotice; }

public String getqSecret() {
	return qSecret;
}

public void setqSecret(String qSecret) {
	this.qSecret = qSecret;
}

public Integer getqId() {
	return qId;
}

public void setqId(Integer qId) {
	this.qId = qId;
}

public String getqName() {
	return qName;
}

public void setqName(String qName) {
	this.qName = qName;
}

public String getqTitle() {
	return qTitle;
}

public void setqTitle(String qTitle) {
	this.qTitle = qTitle;
}

public String getqContent() {
	return qContent;
}

public void setqContent(String qContent) {
	this.qContent = qContent;
}

public Date getqDate() {
	return qDate;
}

public void setqDate(Date qDate) {
	this.qDate = qDate;
}

public Integer getqHit() {
	return qHit;
}

public void setqHit(Integer qHit) {
	this.qHit = qHit;
}

public Integer getqGroup() {
	return qGroup;
}

public void setqGroup(Integer qGroup) {
	this.qGroup = qGroup;
}

public Integer getqStep() {
	return qStep;
}

public void setqStep(Integer qStep) {
	this.qStep = qStep;
}

public Integer getqIndent() {
	return qIndent;
}

public void setqIndent(Integer qIndent) {
	this.qIndent = qIndent;
}

public String getqJob() {
	return qJob;
}

public void setqJob(String qJob) {
	this.qJob = qJob;
}

public String getqDept() {
	return qDept;
}

public void setqDept(String qDept) {
	this.qDept = qDept;
}



}
