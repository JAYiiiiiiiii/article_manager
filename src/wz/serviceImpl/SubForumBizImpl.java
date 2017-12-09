package wz.serviceImpl;

import java.util.List;

import wz.dao.SubForumDao;
import wz.model.MainForum;
import wz.model.SubForum;
import wz.service.SubForumBiz;

public class SubForumBizImpl implements SubForumBiz{
	private SubForumDao subDao;
	
	

	public void setSubDao(SubForumDao subDao) {
		this.subDao = subDao;
	}


	@Override
	public List<SubForum> getAllSubForums() {
		return subDao.findAll();
	}
	


	@Override
	public void add(SubForum transientInstance) {
		subDao.save(transientInstance);
		
	}
	

}
