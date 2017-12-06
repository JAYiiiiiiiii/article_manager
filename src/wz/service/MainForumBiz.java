package wz.service;

import java.util.List;

import wz.model.MainForum;

public interface MainForumBiz {
	public List<MainForum> getAllMainForums();

	public MainForum getMainForumById(int type);

	public boolean add(MainForum main);

}
