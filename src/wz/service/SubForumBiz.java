package wz.service;

import java.util.List;

import wz.model.MainForum;
import wz.model.SubForum;

public interface SubForumBiz {
	public  void add(SubForum transientInstance);
	public List<SubForum> getAllSubForums();
}
