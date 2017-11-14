package dao;

import java.util.Date;

public class SecondLevelTitle {
	
	private int id;           
	private String titleName; 
	private String creator;   
	private Date createTime;  
	private int parentTitleId; 
	private String filePath;  

	public SecondLevelTitle() {	}

	public SecondLevelTitle(int id,String titleName, String creator,Date createTime,String filePath,int parentTitleId) {
		this.id = id;
		this.titleName = titleName;
		this.creator = creator;
		this.createTime = createTime;
		this.filePath=filePath;
		this.parentTitleId = parentTitleId;
	}
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getParentTitleId() {
		return parentTitleId;
	}

	public void setParentTitleId(int parentTitleId) {
		this.parentTitleId = parentTitleId;
	}

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}
}
