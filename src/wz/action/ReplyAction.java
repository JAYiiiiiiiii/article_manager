package wz.action;

import java.sql.Timestamp;

import wz.model.Followcard;
import wz.model.Post;
import wz.model.User;
import wz.service.BlackListBiz;
import wz.service.FollowcardBiz;
import wz.service.PostBiz;

public class ReplyAction extends BaseAction{
	private int postId;
	private int pageNum;
	private String content;
	private FollowcardBiz followcardBiz;
	private PostBiz postBiz;
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public void setPostBiz(PostBiz postBiz) {
		this.postBiz = postBiz;
	}
	public int getPostId() {
		return postId;
	}
	public void setFollowcardBiz(FollowcardBiz followcardBiz) {
		this.followcardBiz = followcardBiz;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String execute() throws Exception {
		if (content != null){
			int userId = (Integer) getSession().get("userId");
			Followcard followcard = new Followcard();
			followcard.setFollowContent(content);
			Post post = new Post();
			post.setId(postId);
			followcard.setPost(post);
			followcard.setFollowDate(new Timestamp(System.currentTimeMillis()));
			User user = new User();
			user.setId(userId);
			System.out.println("user id:"+userId+user.getUsername());
			user.setUsername((String) getSession().get("username"));
			followcard.setUser(user);
			followcardBiz.addReply(followcard);
			postBiz.autoIncreaseReply(postId);
			getRequest().put("postId", postId);
			getRequest().put("page", pageNum);
			return SUCCESS;
		}
		return ERROR;
	}
	

}
