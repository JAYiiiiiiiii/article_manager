/**
 * 
 */
package wz.dao;

import java.util.List;
import java.util.Set;

import wz.model.PrivatePost;


public interface PrivatePostDao {
	
	/**
	 * 向文章表中增加一条记录
	 * @param post 文章
	 */
	public void pushlish(PrivatePost privatePost);
	
	/**
	 * 获取指定文章的回复贴
	 * @param postId 文章id
	 * @return 回复贴列表
	 */
//	public Set<Followcard> getFollowCards(int postId);
	
	
	public PrivatePost getPrivatePostById(int privatePostId);

	
	
	public List<PrivatePost> search(String keyword);
	
	public List<PrivatePost> getPrivatePostByUserId(int userId,int pageIndex,int pageSize);

	public void delete(int privatePostId);

	public void updatePrivatePost(PrivatePost privatePost);

	void autoIncreaseViewNum(int privatePostId);

}
