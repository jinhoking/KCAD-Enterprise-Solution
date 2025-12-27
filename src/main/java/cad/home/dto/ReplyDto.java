package cad.home.dto;

import java.sql.Timestamp;

public class ReplyDto {
	   
	   private Integer rId; 
	   private Integer bId; 
	   private String rName; 
	   private String rContent; 
	   private Timestamp rDate;
	   private String r_Job;
	   private String r_Dept;
	   
	   public ReplyDto() {
	}

	   public ReplyDto(Integer rId, Integer bId, String rName, String rContent, Timestamp rDate) {
		super();
		this.rId = rId;
		this.bId = bId;
		this.rName = rName;
		this.rContent = rContent;
		this.rDate = rDate;
	   }

	   public Integer getrId() {
		   return rId;
	   }

	   public void setrId(Integer rId) {
		   this.rId = rId;
	   }

	   public Integer getbId() {
		   return bId;
	   }

	   public void setbId(Integer bId) {
		   this.bId = bId;
	   }

	   public String getrName() {
		   return rName;
	   }

	   public void setrName(String rName) {
		   this.rName = rName;
	   }

	   public String getrContent() {
		   return rContent;
	   }

	   public void setrContent(String rContent) {
		   this.rContent = rContent;
	   }

	   public Timestamp getrDate() {
		   return rDate;
	   }

	   public void setrDate(Timestamp rDate) {
		   this.rDate = rDate;
	   }

	   public String getR_Job() {
		   return r_Job;
	   }

	   public void setR_Job(String r_Job) {
		   this.r_Job = r_Job;
	   }

	   public String getR_Dept() {
		   return r_Dept;
	   }

	   public void setR_Dept(String r_Dept) {
		   this.r_Dept = r_Dept;
	   }
	   
	   
}
