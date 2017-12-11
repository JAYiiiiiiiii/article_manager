/**
 * 
 */
package wz.dao;

import java.util.List;
import java.util.Set;

import wz.model.Followcard;
import wz.model.Post;


public interface PostDao {
	
	/**
	 * 向文章表中增加一条记录
	 * @param post 文章
	 */
	public void pushlish(Post post);
	
	/**
	 * 获取指定文章的回复贴
	 * @param postId 文章id
	 * @return 回复贴列表
	 */
//	public Set<Followcard> getFollowCards(int postId);
	
	/**
	 * 获取论坛精华帖
	 * @return
	 */
	public List<Post> getBestPosts(int pageIndex,int pageSize);
	
	/**
	 * 分页查找最新发表的文章
	 * @param pageIndex	页码，从1开始
	 * @param pageSize 页面大小
	 * @return
	 */
	public List<Post> getLatestPosts(int pageIndex,int pageSize );
	
	public Post getPostById(int postId);

	/**
	 * 获取指定文章的回复贴
	 * @param postId 文章id,页数，页面大小
	 * @return 回复贴列表
	 */
	List<Followcard> getFollowCards(int postId, int pageIndex, int pageSize);
	
	public List<Post> search(String keyword);
	public List<Post> getPostByType(int type,int pageIndex,int pageSize);
	
	public List<Post> getPostByUserId(int userId,int pageIndex,int pageSize);

	public void autoIncreaseReply(int postId);

	public void delete(int postId);

	public void updateType(Integer postId);

	public void updatePost(Post post);

	void autoIncreaseViewNum(int postId);

	List<Post> getHotPosts(int pageIndex, int pageSize);

	/**
	 * @param keyword
	 * @return
	 */
	public List<Post> searchByContent(String keyword);

	/**
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<Post> searchByByTime(String startTime, String endTime); 

}
