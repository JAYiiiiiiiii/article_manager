package wz.model;

import java.util.HashSet;
import java.util.Set;

/**
 * SubForum entity. @author MyEclipse Persistence Tools
 */

public class SubForum implements java.io.Serializable {

	// Fields

	private Integer id;
	private MainForum mainForum;
	private String title;
	private String info;
	private Set subSubForums = new HashSet(0);

	// Constructors

	/** default constructor */
	public SubForum() {
	}

	

	/** minimal constructor */
	public SubForum(MainForum mainForum, String title) {
		this.mainForum = mainForum;
		this.title = title;
	}

	/** full constructor */
	public SubForum(MainForum mainForum, String title, String info, Set subSubForums) {
		this.mainForum = mainForum;
		this.title = title;
		this.info = info;
		this.subSubForums = subSubForums;
	}

	
	/**
	 * @return subSubForums
	 */
	public Set getSubSubForums() {
		return subSubForums;
	}

	/**
	 * @param subSubForums 要设置的 subSubForums
	 */
	public void setSubSubForums(Set subSubForums) {
		this.subSubForums = subSubForums;
	}
	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public MainForum getMainForum() {
		return this.mainForum;
	}

	public void setMainForum(MainForum mainForum) {
		this.mainForum = mainForum;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}


}