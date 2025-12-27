package cad.home.dto;

import java.sql.Timestamp;

public class MarkupDto {
	
	private int b_no;
	private String b_title;
	private String b_writer;
	private String b_filepath;
	private Timestamp b_regdate;
	private String b_category;
	private String b_status;   // 검토중, 승인완료 등 상태 구분 (선택사항)
	private String b_job;
	private String b_dept;
	private String b_comment;
	
	
	public MarkupDto() {
		// TODO Auto-generated constructor stub
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public MarkupDto(int b_no, String b_title, String b_writer, String b_filepath, Timestamp b_regdate) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_filepath = b_filepath;
		this.b_regdate = b_regdate;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public String getB_filepath() {
		return b_filepath;
	}

	public void setB_filepath(String b_filepath) {
		this.b_filepath = b_filepath;
	}

	public Timestamp getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}

	public String getB_job() {
		return b_job;
	}

	public void setB_job(String b_job) {
		this.b_job = b_job;
	}

	public String getB_dept() {
		return b_dept;
	}

	public void setB_dept(String b_dept) {
		this.b_dept = b_dept;
	}

	public String getB_comment() {
		return b_comment;
	}

	public void setB_comment(String b_comment) {
		this.b_comment = b_comment;
	}
	
	
	

}
