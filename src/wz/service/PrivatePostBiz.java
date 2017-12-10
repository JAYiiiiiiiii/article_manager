package wz.service;

import java.util.List;
import java.util.Set;

import wz.dao.PrivatePostDao;
import wz.model.PrivatePost;

public interface PrivatePostBiz {

	public abstract void setPrivatePostDao(PrivatePostDao privatePostDao);

	/**
	 * 向文章表中增加一条记录
	 * @param post 文章
	 */
	public abstract void pushlish(PrivatePost privatePost);

	public PrivatePost getPrivatePostById(int privatePostId);
	
	public List<PrivatePost> searchPrivatePosts(String keyword);
	public List<PrivatePost> getPrivatePostByUserId(int userId,int pageIndex,int pageSize);

	public void delete(int privatePostId);

	public abstract void updatePrivatePost(int privatePostId, String title, String content,
			int mainForum, int subForum, int subSubForum);

	void autoIncreaseViewNum(int privatePostId);

	/**
	 * @param keywords
	 * @return
	 */
	public abstract List<PrivatePost> searchPrivatePostsByContent(String keywords);

	
	

}