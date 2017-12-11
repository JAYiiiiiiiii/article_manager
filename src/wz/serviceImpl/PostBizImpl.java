package wz.serviceImpl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import wz.dao.MainForumDao;
import wz.dao.PostDao;
import wz.model.Followcard;
import wz.model.MainForum;
import wz.model.Post;
import wz.model.SubForum;
import wz.model.SubSubForum;
import wz.service.PostBiz;

public class PostBizImpl implements PostBiz {
	private PostDao postDao;
	



	/* (non-Javadoc)
	 * @see wz.bizImpl.PostBiz#setPostDao(wz.dao.PostDao)
	 */
	@Override
	public void setPostDao(PostDao postDao) {
		this.postDao = postDao;
	}
	
	/* (non-Javadoc)
	 * @see wz.bizImpl.PostBiz#pushlish(wz.model.Post)
	 */
	@Override
	public void pushlish(Post post){
		postDao.pushlish(post);
	}
	
	
	
	/* (non-Javadoc)
	 * @see wz.bizImpl.PostBiz#getBestPosts(int, int)
	 */
	@Override
	public List<Post> getBestPosts(int pageIndex,int pageSize){
		return postDao.getBestPosts(pageIndex, pageSize);
	}
	
	/* (non-Javadoc)
	 * @see wz.bizImpl.PostBiz#getLatestPosts(int, int)
	 */
	@Override
	public List<Post> getLatestPosts(int pageIndex,int pageSize ){
		return postDao.getLatestPosts(pageIndex, pageSize);
	}
	
	public Post getPostById(int postId){
		return postDao.getPostById(postId);
	}

	@Override
	public List<Followcard> getFollowCards(int postId, int pageIndex,
			int pageSize) {
		return postDao.getFollowCards(postId, pageIndex, pageSize);
	}
	
	public List<Post> searchPosts(String keyword){
		return postDao.search(keyword);
		
	}
	
	/**
	 * @param keywords
	 * @return
	 */
	public List<Post> searchPostsByContent(String keyword){
		return postDao.searchByContent(keyword);
	}
	public List<Post> searchPostsByTime(String startTime, String endTime){
		return postDao.searchByByTime(startTime, endTime);
	}
	public List<Post> getPostByType(int type,int pageIndex,int pageSize){
		return postDao.getPostByType(type, pageIndex, pageSize);
	}

	@Override
	public List<Post> getPostByUserId(int userId,int pageIndex,int pageSize){
		return postDao.getPostByUserId(userId,pageIndex,pageSize);
	}

	@Override
	public void autoIncreaseReply(int postId) {
		postDao.autoIncreaseReply(postId);
		
	}

	@Override
	public void delete(int postId) {
		postDao.delete(postId);
		
	}

	@Override
	public void updateType(Integer postId) {
		postDao.updateType(postId);
		
	}

	@Override
	public void updatePost(int postId, String title, String content,
			int mainForum, int subForum, int subSubForum) {
		
		Post post = postDao.getPostById(postId);
		post.setTitle(title);
		post.setCardContent(content);
		post.setSendDate(new Timestamp(System.currentTimeMillis()));
		MainForum mainForum2 = new MainForum();
		mainForum2.setId(mainForum);
		SubForum sub = new SubForum();
		sub.setMainForum(mainForum2);
		sub.setId(subForum);
		SubSubForum subSub = new SubSubForum();
		subSub.setSubForum(sub);
		subSub.setId(subSubForum);
		post.setSubSubForum(subSub);
		postDao.updatePost(post);
		
		
	}
	@Override
	public void autoIncreaseViewNum(int postId){
		postDao.autoIncreaseViewNum(postId);
	}

	@Override
	public List<Post> getHotPosts(int pageIndex, int pageSize) {
		return postDao.getHotPosts(pageIndex, pageSize);
	}

	
	
	
	

}
