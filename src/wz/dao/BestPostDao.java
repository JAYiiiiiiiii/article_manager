package wz.dao;

import java.util.List;

import wz.model.BestPost;
import wz.model.Post;

public interface BestPostDao {
	public void insert(BestPost post);
	public List<BestPost> getBestPosts(int pageInde,int pageSize);
	public void delete(int postId);
	public void updateState(Integer postId, int state);
	public List<BestPost> getRecordsByUserId(int userId,int pageIndex,int pageSize);
	public boolean isExist(int postId);

}
