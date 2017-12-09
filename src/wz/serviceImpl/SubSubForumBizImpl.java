package wz.serviceImpl;

import wz.dao.SubSubForumDao;
import wz.model.SubSubForum;
import wz.service.SubSubForumBiz;

public class SubSubForumBizImpl implements SubSubForumBiz{
	private SubSubForumDao subSubDao;
	
	

	public void setSubSubDao(SubSubForumDao subSubDao) {
		this.subSubDao = subSubDao;
	}



	


	@Override
	public void add(SubSubForum transientInstance) {
		subSubDao.save(transientInstance);
		
	}
	

}
