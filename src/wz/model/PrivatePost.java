package wz.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class PrivatePost implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private SubSubForum subSubForum;
	private String title;
	private String cardContent;
	private Timestamp sendDate;
	private Integer postType; //是否精品文章 0不是精品文章 1精品文章
	private Integer replyNum = 0;
	private Integer viewNum = 0;

	// Constructors

	/** default constructor */
	public PrivatePost() {
	}

	/** minimal constructor */
	public PrivatePost(User user, SubSubForum subSubForum, String title, String cardContent,
			Timestamp sendDate) {
		this.user = user;
		this.subSubForum = subSubForum;
		this.title = title;
		this.cardContent = cardContent;
		this.sendDate = sendDate;
	}

	/** full constructor */
	public PrivatePost(User user, SubSubForum subSubForum, String title, String cardContent,
			Timestamp sendDate, Integer postType, Integer replyNum,
			Integer viewNum) {
		this.user = user;
		this.subSubForum = subSubForum;
		this.title = title;
		this.cardContent = cardContent;
		this.sendDate = sendDate;
		this.postType = postType;
		this.replyNum = replyNum;
		this.viewNum = viewNum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCardContent() {
		return this.cardContent;
	}

	public void setCardContent(String cardContent) {
		this.cardContent = cardContent;
	}

	public Timestamp getSendDate() {
		return this.sendDate;
	}

	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}

	public Integer getPostType() {
		return this.postType;
	}

	public void setPostType(Integer postType) {
		this.postType = postType;
	}

	public Integer getReplyNum() {
		return this.replyNum;
	}

	public void setReplyNum(Integer replyNum) {
		this.replyNum = replyNum;
	}

	public Integer getViewNum() {
		return this.viewNum;
	}

	public void setViewNum(Integer viewNum) {
		this.viewNum = viewNum;
	}
	
	public String getTime(){
		String time = getSendDate().toString();
		int index = time.indexOf('.');
		if (index != -1)
			return time.substring(0, index);
		else return time;
	}

	/**
	 * @return subSubForum
	 */
	public SubSubForum getSubSubForum() {
		return subSubForum;
	}

	/**
	 * @param subSubForum 要设置的 subSubForum
	 */
	public void setSubSubForum(SubSubForum subSubForum) {
		this.subSubForum = subSubForum;
	}

}