package wz.action;

import java.sql.Timestamp;

import wz.model.MainForum;
import wz.model.Post;
import wz.model.PrivatePost;
import wz.model.SubForum;
import wz.model.SubSubForum;
import wz.model.User;
import wz.service.PostBiz;
import wz.service.PrivatePostBiz;

public class PublishPostAction extends BaseAction{
	private String title;
	private String content;
	private int mainForum;
	private int subForum;
	private int subSubForum;
	private int postId;
	private int privatePostId;
	
	private PrivatePostBiz privatePostBiz;
	private PostBiz postBiz;

	/**
	 * @param privatePostId 要设置的 privatePostId
	 */
	public void setPrivatePostId(int privatePostId) {
		this.privatePostId = privatePostId;
	}

	/**
	 * @param privatePostBiz 要设置的 privatePostBiz
	 */
	public void setPrivatePostBiz(PrivatePostBiz privatePostBiz) {
		this.privatePostBiz = privatePostBiz;
	}

	
	/**
	 * @param subSubForum 要设置的 subSubForum
	 */
	public void setSubSubForum(int subSubForum) {
		this.subSubForum = subSubForum;
	}

	public int getPostId() {
		return postId;
	}
	
	public int getPrivatePostId() {
		return privatePostId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public void setPostBiz(PostBiz postBiz) {
		this.postBiz = postBiz;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	public void setMainForum(int mainForum) {
		this.mainForum = mainForum;
	}

	public void setSubForum(int subForum) {
		this.subForum = subForum;
	}

	@Override
	public String execute() throws Exception {
		
		int userId = (Integer) getSession().get("userId");
		Post post = new Post();
		post.setTitle(title);
		post.setCardContent(content);
		SubForum sub = new SubForum();
		sub.setId(subForum);
		MainForum main = new MainForum();
		main.setId(mainForum);
		sub.setMainForum(main);
		SubSubForum subSub = new SubSubForum();
		subSub.setId(subSubForum);
		subSub.setSubForum(sub);
		post.setSubSubForum(subSub);
		User user  = new User();
		user.setId((Integer)getSession().get("userId"));
		post.setUser(user);
		post.setPostType(0);
		post.setReplyNum(0);
		post.setSendDate(new Timestamp(System.currentTimeMillis()));
		postBiz.pushlish(post);
		return SUCCESS;
	}
	
public String publishPrivate() throws Exception {
		
		int userId = (Integer) getSession().get("userId");
		PrivatePost privatePost = new PrivatePost();
		privatePost.setTitle(title);
		privatePost.setCardContent(content);
		SubForum sub = new SubForum();
		sub.setId(subForum);
		MainForum main = new MainForum();
		main.setId(mainForum);
		sub.setMainForum(main);
		SubSubForum subSub = new SubSubForum();
		subSub.setId(subSubForum);
		subSub.setSubForum(sub);
		privatePost.setSubSubForum(subSub);
		User user  = new User();
		user.setId((Integer)getSession().get("userId"));
		privatePost.setUser(user);
		privatePost.setPostType(0);
		privatePost.setReplyNum(0);
		privatePost.setSendDate(new Timestamp(System.currentTimeMillis()));
		privatePostBiz.pushlish(privatePost);
		return SUCCESS;
	}
	
	public String commitEditor(){
		if (postId>0){
			postBiz.updatePost(postId,title,content,mainForum,subForum,subSubForum);
			//向文章显示页面传递参数
			getRequest().put("postId", postId);
			getRequest().put("page", 1);
		}
		return SUCCESS;
	}
	
	public String privateCommitEditor(){
		if (privatePostId>0){
			privatePostBiz.updatePrivatePost(privatePostId,title,content,mainForum,subForum,subSubForum);
			//向文章显示页面传递参数
			getRequest().put("privatePostId", privatePostId);
			getRequest().put("page", 1);
		}
		return SUCCESS;
	}
	
public String pubToPri() throws Exception {		
		if (postId >0){
			
			int userId = (Integer) getSession().get("userId");
			Post post = postBiz.getPostById(postId);
			PrivatePost privatePost = new PrivatePost();
			privatePost.setTitle(post.getTitle());
			privatePost.setCardContent(post.getCardContent());
			SubSubForum subSub = post.getSubSubForum();
			privatePost.setSubSubForum(subSub);
			User user  = new User();
			user.setId((Integer)getSession().get("userId"));
			privatePost.setUser(user);
			privatePost.setPostType(0);
			privatePost.setReplyNum(0);
			privatePost.setSendDate(post.getSendDate());
			privatePostBiz.pushlish(privatePost);
			
			postBiz.delete(postId);
			return SUCCESS;
		}
		return ERROR;
	}

public String priToPub() throws Exception {		
	if (privatePostId >0){
		
		int userId = (Integer) getSession().get("userId");
		Post post = new Post();
		PrivatePost privatePost = privatePostBiz.getPrivatePostById(privatePostId);
		post.setTitle(privatePost.getTitle());
		post.setCardContent(privatePost.getCardContent());
		SubSubForum subSub = privatePost.getSubSubForum();
		post.setSubSubForum(subSub);
		User user  = new User();
		user.setId((Integer)getSession().get("userId"));
		post.setUser(user);
		post.setPostType(0);
		post.setReplyNum(0);
		post.setSendDate(privatePost.getSendDate());
		postBiz.pushlish(post);
		
		privatePostBiz.delete(privatePostId);
		return SUCCESS;
	}
	return ERROR;
}
}
