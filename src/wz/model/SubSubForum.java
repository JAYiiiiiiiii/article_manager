package wz.model;

import java.util.HashSet;
import java.util.Set;

/**
 * SubForum entity. @author MyEclipse Persistence Tools
 */

public class SubSubForum implements java.io.Serializable {

	// Fields

	private Integer id;
	private SubForum subForum;
	private String title;
	private String info;
	private Set posts = new HashSet(0);

	// Constructors

	/** default constructor */
	public SubSubForum() {
	}

	/** minimal constructor */
	public SubSubForum(SubForum subForum, String title) {
		this.subForum = subForum;
		this.title = title;
	}

	/** full constructor */
	public SubSubForum(SubForum subForum, String title, String info, Set posts) {
		this.subForum = subForum;
		this.title = title;
		this.info = info;
		this.posts = posts;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return subForum
	 */
	public SubForum getSubForum() {
		return subForum;
	}

	/**
	 * @param subForum 要设置的 subForum
	 */
	public void setSubForum(SubForum subForum) {
		this.subForum = subForum;
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

	public Set getPosts() {
		return this.posts;
	}

	public void setPosts(Set posts) {
		this.posts = posts;
	}

}