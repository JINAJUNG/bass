package com.bass.test.vo;

import org.apache.ibatis.type.Alias;

@Alias("ui")
public class UserInfo {

	private Integer uiNum;
	private String uiName;
	private String uiId;
	private String uiPwd;
	private String uiDesc;
	
	public UserInfo() {
		
	}
	public UserInfo(Integer uiNum, String uiName, String uiId, String uiPwd, String uiDesc) {
		super();
		this.uiNum = uiNum;
		this.uiName = uiName;
		this.uiId = uiId;
		this.uiPwd = uiPwd;
		this.uiDesc = uiDesc;
	}
	public Integer getUiNum() {
		return uiNum;
	}
	public void setUiNum(Integer uiNum) {
		this.uiNum = uiNum;
	}
	public String getUiName() {
		return uiName;
	}
	public void setUiName(String uiName) {
		this.uiName = uiName;
	}
	public String getUiId() {
		return uiId;
	}
	public void setUiId(String uiId) {
		this.uiId = uiId;
	}
	public String getUiPwd() {
		return uiPwd;
	}
	public void setUiPwd(String uiPwd) {
		this.uiPwd = uiPwd;
	}
	public String getUiDesc() {
		return uiDesc;
	}
	public void setUiDesc(String uiDesc) {
		this.uiDesc = uiDesc;
	}
	@Override
	public String toString() {
		return "UserInfo [uiNum=" + uiNum + ", uiName=" + uiName + ", uiId=" + uiId + ", uiPwd=" + uiPwd + ", uiDesc="
				+ uiDesc + "]";
	}
}
