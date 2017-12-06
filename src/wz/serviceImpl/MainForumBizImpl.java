package wz.serviceImpl;

import java.util.List;

import wz.dao.MainForumDao;
import wz.model.MainForum;
import wz.service.MainForumBiz;

public class MainForumBizImpl implements MainForumBiz {
	private MainForumDao mainDao;
	

	public void setMainDao(MainForumDao mainDao) {
		this.mainDao = mainDao;
	}


	@Override
	public List<MainForum> getAllMainForums() {
		return mainDao.findAll();
	}


	@Override
	public MainForum getMainForumById(int type) {
		return mainDao.findById(type);
	}


	@Override
	public boolean add(MainForum main) {
		List<MainForum> mains = mainDao.findByTitle(main.getTitle());
		if (mains.size() <1){
			mainDao.save(main);
			return true;
		}
		else 
			return false;
		
	}

}
