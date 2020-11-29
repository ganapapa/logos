package com.logos.coffee.vo;

import javax.servlet.http.HttpServletRequest;


import org.apache.commons.lang.StringUtils;

public class UserVO extends CommonInfo {
	private static final long serialVersionUID = 1L;
 
	private String adStaffNo       ;  	//회원번호
	private String adStaffId       ;    //사용자ID
	private String adStaffNm       ;    //성명    
	private String adStaffPwd      ;    //비밀번호
	private String adStaffDept	   ;	//부서
	private String adStaffJobtitl  ;    //직위    
	private String adStaffTelNo    ;    //        
	private String adStaffEmail    ;    //이메일  
	private String adStaffDuty     ;    //업무    
	private String adOpenYn        ;    //오픈여부
	private String adStaffOdr      ;    //순서    
	private String adStaffLevel    ;    //      
	private String adStaffAuth     ;    //권한
	private String adRegId         ;    //등록자  
	private String adRegTm         ;    //등록일시
	private String adUpdId         ;    //변경자  
	private String adUpdTm         ;    //변경일시

	public UserVO() {
		super();
	}
	
	/*
	public UserVO(HttpServletRequest req, UploadInfo uploadInfo) {
		load(req);
		load(uploadInfo);
		fix(uploadInfo.getStr("__SESSION_USER_ID"));
	}
	
	
	public void fix() {
		setAdStaffPwd(Security.SHA1encrypt(StringUtils.defaultString(getAdStaffPwd(),""))); //비밀번호 암호화
	}
	*/
	
	public String getAdStaffNo() {
		return adStaffNo;
	}
	public void setAdStaffNo(String adStaffNo) {
		this.adStaffNo = adStaffNo;
	}
	public String getAdStaffId() {
		return adStaffId;
	}
	public void setAdStaffId(String adStaffId) {
		this.adStaffId = adStaffId;
	}
	public String getAdStaffNm() {
		return adStaffNm;
	}
	public void setAdStaffNm(String adStaffNm) {
		this.adStaffNm = adStaffNm;
	}
	public String getAdStaffPwd() {
		return adStaffPwd;
	}
	public void setAdStaffPwd (String adStaffPwd) {
		this.adStaffPwd = adStaffPwd;
	}
	
	public String getAdStaffDept() {
		return adStaffDept;
	}
	public void setAdStaffDept (String adStaffDept) {
		this.adStaffDept = adStaffDept;
	}
	
	public String getAdStaffJobtitl() {
		return adStaffJobtitl;
	}
	public void setAdStaffJobtitl(String adStaffJobtitl) {
		this.adStaffJobtitl = adStaffJobtitl;
	}
	public String getAdStaffTelNo() {
		return adStaffTelNo;
	}
	public void setAdStaffTelNo(String adStaffTelNo) {
		this.adStaffTelNo = adStaffTelNo;
	}
	public String getAdStaffEmail() {
		return adStaffEmail;
	}
	public void setAdStaffEmail(String adStaffEmail) {
		this.adStaffEmail = adStaffEmail;
	}
	public String getAdStaffDuty() {
		return adStaffDuty;
	}
	public void setAdStaffDuty(String adStaffDuty) {
		this.adStaffDuty = adStaffDuty;
	}
	public String getAdOpenYn() {
		return adOpenYn;
	}
	public void setAdOpenYn(String adOpenYn) {
		this.adOpenYn = adOpenYn;
	}
	public String getAdStaffOdr() {
		return adStaffOdr;
	}
	public void setAdStaffOdr(String adStaffOdr) {
		this.adStaffOdr = adStaffOdr;
	}
	public String getAdStaffLevel() {
		return adStaffLevel;
	}
	public void setAdStaffLevel(String adStaffLevel) {
		this.adStaffLevel = adStaffLevel;
	}
	public String getAdRegId() {
		return adRegId;
	}
	public void setAdRegId(String adRegId) {
		this.adRegId = adRegId;
	}
	public String getAdRegTm() {
		return adRegTm;
	}
	public void setAdRegTm(String adRegTm) {
		this.adRegTm = adRegTm;
	}
	public String getAdUpdId() {
		return adUpdId;
	}
	public void setAdUpdId(String adUpdId) {
		this.adUpdId = adUpdId;
	}
	public String getAdUpdTm() {
		return adUpdTm;
	}
	public void setAdUpdTm(String adUpdTm) {
		this.adUpdTm = adUpdTm;
	}
	
	//권한 추가
	public String getAdStaffAuth() {
		return adStaffAuth;
	}
	public void setAdStaffAuth(String adStaffAuth) {
		this.adStaffAuth = adStaffAuth;
	}
}