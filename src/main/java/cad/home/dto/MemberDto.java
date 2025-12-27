package cad.home.dto;

import java.sql.Timestamp;

public class MemberDto {
      private String userId;
      private String userPw;
      private String userName;
      private Timestamp regDate;
      
      private String userEmail;
      private String userPhone;
      private String userAddr;
      private String userJob;
      private String userDept;
      private String userRole;
      
      private String compId;
      
      public MemberDto() {
	}

	  public MemberDto(String userId, String userPw, String userName) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
	  }

	  public Timestamp getRegDate() {
		return regDate;
	}

	  public void setRegDate(Timestamp regDate) {
		  this.regDate = regDate;
	  }

	  public String getUserId() {
		  return userId;
	  }

	  public void setUserId(String userId) {
		  this.userId = userId;
	  }

	  public String getUserPw() {
		  return userPw;
	  }

	  public void setUserPw(String userPw) {
		  this.userPw = userPw;
	  }

	  public String getUserName() {
		  return userName;
	  }

	  public void setUserName(String userName) {
		  this.userName = userName;
	  }

	  public String getUserEmail() {
		  return userEmail;
	  }

	  public void setUserEmail(String userEmail) {
		  this.userEmail = userEmail;
	  }

	  public String getUserPhone() {
		  return userPhone;
	  }

	  public void setUserPhone(String userPhone) {
		  this.userPhone = userPhone;
	  }

	  public String getUserAddr() {
		  return userAddr;
	  }

	  public void setUserAddr(String userAddr) {
		  this.userAddr = userAddr;
	  }

	  public String getUserJob() {
		  return userJob;
	  }

	  public void setUserJob(String userJob) {
		  this.userJob = userJob;
	  }

	  public String getUserDept() {
		  return userDept;
	  }

	  public void setUserDept(String userDept) {
		  this.userDept = userDept;
	  }

	  public String getUserRole() {
		  return userRole;
	  }

	  public void setUserRole(String userRole) {
		  this.userRole = userRole;
	  }

	  public String getCompId() {
		  return compId;
	  }

	  public void setCompId(String compId) {
		  this.compId = compId;
	  }
	  
	}

	

	  
     
      
      

