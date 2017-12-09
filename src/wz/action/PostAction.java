package wz.action;

import wz.model.BestPost;
import wz.model.Post;
import wz.model.PrivatePost;
import wz.model.User;
import wz.service.BestPostBiz;
import wz.service.PostBiz;
import wz.service.PrivatePostBiz;

public class PostAction extends BaseAction{
	private Integer postId;
	private Integer privatePostId;
	private int state;
	private BestPostBiz bestPostBiz;
	
	public void setState(int state) {
		this.state = state;
	}
	public void setBestPostBiz(BestPostBiz bestPostBiz) {
		this.bestPostBiz = bestPostBiz;
	}


	public Integer getPostId() {
		return postId;
	}


	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	private PostBiz postBiz;
	private PrivatePostBiz privatePostBiz;
	
	
	/**
	 * @return privatePostId
	 */
	public Integer getPrivatePostId() {
		return privatePostId;
	}
	/**
	 * @param privatePostId 要设置的 privatePostId
	 */
	public void setPrivatePostId(Integer privatePostId) {
		this.privatePostId = privatePostId;
	}
	/**
	 * @param privatePostBiz 要设置的 privatePostBiz
	 */
	public void setPrivatePostBiz(PrivatePostBiz privatePostBiz) {
		this.privatePostBiz = privatePostBiz;
	}
	public void setPostBiz(PostBiz postBiz) {
		this.postBiz = postBiz;
	}


	@Override
	public String execute() throws Exception {
		if (postId != null){
			System.out.println("id"+postId);
			Post post = postBiz.getPostById(postId);
			if (post == null)
				return ERROR;
			getRequest().put("post", post);
			return SUCCESS;
		}
		return ERROR;
	}
	
	/**
	 * 申请精品文章
	 * @return
	 */
	public String applyBestPost(){
		if (postId >0 && getSession().get("username") !=null){
			BestPost bestPost = new BestPost();
			Post post = new Post();
			post.setId(postId);
			bestPost.setPost(post);
			User user = new User();
			user.setId((Integer)getSession().get("userId"));
			bestPost.setUser(user);
			bestPost.setState(1);//1表示请求正在等待处理
			bestPostBiz.insert(bestPost);
			
		}
		return SUCCESS;
	}
	
	
	/**
	 * 管理员回复新华请求
	 */
	
	public String replyapply(){
		if (postId >0 && getSession().get("adminname") !=null){
			
			bestPostBiz.updateState(postId,state);
			if (state == 2)//同意
				postBiz.updateType(postId);
			return SUCCESS;
		}
		return ERROR;
		
	}
	
	
	
	
	public String delete(){
		if (postId >0){
			postBiz.delete(postId);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String deletePrivate(){
		if (privatePostId >0){
			privatePostBiz.delete(privatePostId);
			return SUCCESS;
		}
		return ERROR;
	}
	
	/**
	 * 编辑文章
	 */
	
	public String editPost(){
		if (postId>0){
			Post post = postBiz.getPostById(postId);
			getRequest().put("post", post);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String editPrivatePost(){
		if (privatePostId>0){
			PrivatePost privatePost = privatePostBiz.getPrivatePostById(privatePostId);
			getRequest().put("privatePost", privatePost);
			return SUCCESS;
		}
		return ERROR;
	}
	
	/**
	 * 设置文章为私密文章
	 * @return
	 */
	public String setPrivate(){
		
		return SUCCESS;
	}

}
