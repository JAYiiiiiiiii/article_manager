package wz.action;

import java.sql.Timestamp;

import wz.model.MainForum;
import wz.model.Post;
import wz.model.SubForum;
import wz.model.User;
import wz.service.BlackListBiz;
import wz.service.PostBiz;

public class PublishPostAction extends BaseAction{
	private String title;
	private String content;
	private int mainForum;
	private int subForum;
	private int postId;
	
	private PostBiz postBiz;

	public int getPostId() {
		return postId;
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
		SubForum subFrom = new SubForum();
		subFrom.setId(subForum);
		MainForum main = new MainForum();
		main.setId(mainForum);
		subFrom.setMainForum(main);
		post.setSubForum(subFrom);
		User user  = new User();
		user.setId((Integer)getSession().get("userId"));
		post.setUser(user);
		post.setPostType(0);
		post.setReplyNum(0);
		post.setSendDate(new Timestamp(System.currentTimeMillis()));
		postBiz.pushlish(post);
		return SUCCESS;
	}
	
	public String commitEditor(){
		if (postId>0){
			postBiz.updatePost(postId,title,content,mainForum,subForum);
			//向文章显示页面传递参数
			getRequest().put("postId", postId);
			getRequest().put("page", 1);
		}
		return SUCCESS;
	}
	
	
	

}
