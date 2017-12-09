package wz.service;

import java.util.List;
import java.util.Set;

import wz.dao.PostDao;
import wz.model.Followcard;
import wz.model.Post;

public interface PostBiz {

	public abstract void setPostDao(PostDao postDao);

	/**
	 * 向文章表中增加一条记录
	 * @param post 文章
	 */
	public abstract void pushlish(Post post);

	/**
	 * 获取指定文章的回复贴
	 * @param postId 文章id
	 * @return 回复贴列表
	 */
	public abstract List<Followcard> getFollowCards(int postId,int pageIndex,int pageSize);

	/**
	 * 获取论坛精华帖
	 * @return
	 */
	public abstract List<Post> getBestPosts(int pageIndex, int pageSize);

	/**
	 * 分页查找最新发表的文章
	 * @param pageIndex	页码，从1开始
	 * @param pageSize 页面大小
	 * @return
	 */
	public abstract List<Post> getLatestPosts(int pageIndex, int pageSize);
	public Post getPostById(int postId);
	
	public List<Post> searchPosts(String keyword);
	public List<Post> getPostByType(int type,int pageIndex,int pageSize);
	public List<Post> getPostByUserId(int userId,int pageIndex,int pageSize);

	public  void autoIncreaseReply(int postId);  
	public void delete(int postId);

	public abstract void updateType(Integer postId);

	public abstract void updatePost(int postId, String title, String content,
			int mainForum, int subForum, int subSubForum);

	void autoIncreaseViewNum(int postId);
	List<Post> getHotPosts(int pageIndex, int pageSize); 
	

}