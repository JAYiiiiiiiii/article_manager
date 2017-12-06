package wz.serviceImpl;

import wz.dao.FollowcardDao;
import wz.hibernate.factory.BaseHibernateDAO;
import wz.model.Followcard;
import wz.service.FollowcardBiz;

public class FollowcardBizImpl implements FollowcardBiz{
	
	private FollowcardDao followcardDao;
	
	public void setFollowcardDao(FollowcardDao followcardDao) {
		this.followcardDao = followcardDao;
	}

	/* (non-Javadoc)
	 * @see wz.bizImpl.FollowcardBiz#addReply(wz.model.Followcard)
	 */
	@Override
	public void addReply(Followcard followcard){
		followcardDao.save(followcard);
	}

}
