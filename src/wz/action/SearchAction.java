package wz.action;

import java.util.List;

import wz.model.Post;
import wz.model.PrivatePost;
import wz.service.PostBiz;
import wz.service.PrivatePostBiz;

public class SearchAction extends BaseAction{
	private String keywords;
	private PostBiz postBiz;
	private PrivatePostBiz privatePostBiz;
	

	/**
	 * @param privatePostBiz 要设置的 privatePostBiz
	 */
	public void setPrivatePostBiz(PrivatePostBiz privatePostBiz) {
		this.privatePostBiz = privatePostBiz;
	}
	public void setPostBiz(PostBiz postBiz) {
		this.postBiz = postBiz;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	@Override
	public String execute() throws Exception {
		//keywords = new String(keywords.getBytes("iso8859-1"),"utf-8");
		System.out.println(keywords);
		List<Post> posts = postBiz.searchPosts(keywords);
		getRequest().put("posts", posts);
		return SUCCESS;
	}
	
	public String searchTitle() throws Exception {
		//keywords = new String(keywords.getBytes("iso8859-1"),"utf-8");
		System.out.println(keywords);
		List<Post> posts = postBiz.searchPosts(keywords);
		List<PrivatePost> privatePosts = privatePostBiz.searchPrivatePosts(keywords);
		getRequest().put("posts", posts);
		getRequest().put("privatePosts", privatePosts);
		return SUCCESS;
	}
	
	public String searchContent() throws Exception {
		//keywords = new String(keywords.getBytes("iso8859-1"),"utf-8");
		System.out.println(keywords);
		List<Post> posts = postBiz.searchPostsByContent(keywords);
		List<PrivatePost> privatePosts = privatePostBiz.searchPrivatePostsByContent(keywords);
		getRequest().put("posts", posts);
		getRequest().put("privatePosts", privatePosts);
		return SUCCESS;
	}
	
	public String searchTime() {
		try {
			//keywords = new String(keywords.getBytes("iso8859-1"),"utf-8");
			System.out.println(keywords);
			String [] times = keywords.split(";");
			String startTime = times[0];
			String endTime = times[1];
			List<Post> posts = postBiz.searchPostsByTime(startTime, endTime);
			List<PrivatePost> privatePosts = privatePostBiz.searchPrivatePostsByTime(startTime, endTime);
			getRequest().put("posts", posts);
			getRequest().put("privatePosts", privatePosts);
			return SUCCESS;
		}
		catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}

}
