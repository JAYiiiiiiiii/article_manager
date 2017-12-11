package wz.serviceImpl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import wz.dao.MainForumDao;
import wz.dao.PrivatePostDao;
import wz.model.MainForum;
import wz.model.PrivatePost;
import wz.model.SubForum;
import wz.model.SubSubForum;
import wz.service.PrivatePostBiz;

public class PrivatePostBizImpl implements PrivatePostBiz {
	private PrivatePostDao privatePostDao;
	



	/* (non-Javadoc)
	 * @see wz.bizImpl.PostBiz#setPostDao(wz.dao.PostDao)
	 */
	@Override
	public void setPrivatePostDao(PrivatePostDao privatePostDao) {
		this.privatePostDao = privatePostDao;
	}
	
	/* (non-Javadoc)
	 * @see wz.bizImpl.PostBiz#pushlish(wz.model.Post)
	 */
	@Override
	public void pushlish(PrivatePost privatePost){
		privatePostDao.pushlish(privatePost);
	}
	
	public PrivatePost getPrivatePostById(int privatePostId){
		return privatePostDao.getPrivatePostById(privatePostId);
	}

	public List<PrivatePost> searchPrivatePosts(String keyword){
		return privatePostDao.search(keyword);
		
	}
	
	/**
	 * @param keywords
	 * @return
	 */
	public List<PrivatePost> searchPrivatePostsByContent(String keyword){
		return privatePostDao.searchByContent(keyword);
	}
	public List<PrivatePost> searchPrivatePostsByTime(String startTime, String endTime){
		return privatePostDao.searchByTime(startTime, endTime);
	}
	@Override
	public List<PrivatePost> getPrivatePostByUserId(int userId,int pageIndex,int pageSize){
		return privatePostDao.getPrivatePostByUserId(userId,pageIndex,pageSize);
	}

	@Override
	public void delete(int privatePostId) {
		privatePostDao.delete(privatePostId);
		
	}

	@Override
	public void updatePrivatePost(int privatePostId, String title, String content,
			int mainForum, int subForum, int subSubForum) {
		
		PrivatePost privatePost = privatePostDao.getPrivatePostById(privatePostId);
		privatePost.setTitle(title);
		privatePost.setCardContent(content);
		privatePost.setSendDate(new Timestamp(System.currentTimeMillis()));
		MainForum mainForum2 = new MainForum();
		mainForum2.setId(mainForum);
		SubForum sub = new SubForum();
		sub.setMainForum(mainForum2);
		sub.setId(subForum);
		SubSubForum subSub = new SubSubForum();
		subSub.setSubForum(sub);
		subSub.setId(subSubForum);
		privatePost.setSubSubForum(subSub);
		privatePostDao.updatePrivatePost(privatePost);
		
		
	}
	@Override
	public void autoIncreaseViewNum(int privatePostId){
		privatePostDao.autoIncreaseViewNum(privatePostId);
	}

}
