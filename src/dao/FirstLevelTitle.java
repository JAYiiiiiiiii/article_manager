package dao;

import java.util.Date;

public class FirstLevelTitle {
	private int id;           
	private String titleName; 
	private String creator;    
	private Date createTime;  
	
	public FirstLevelTitle(int id,String titleName, String creator,Date createTime) {
		this.id = id;
		this.titleName = titleName;
		this.creator = creator;
		this.createTime = createTime;
	}
	public FirstLevelTitle() {
	}
	
	public int getId() {
		return id;
	}


	public String getTitleName() {
		return this.titleName;
	}


	public String getCreator() {
		return this.creator;
	}


	public Date getCreateTime() {
		return this.createTime;
	}


	public void setId(int paramId) {
		this.id = paramId;
	}


	public void setTitleName(String paramTitleName) {
		this.titleName = paramTitleName;
	}


	public void setCreator(String paramCreator) {
		this.creator = paramCreator;
	}


	public void setCreateTime(Date paramCreateTime) {
		this.createTime = paramCreateTime;
	}

}

