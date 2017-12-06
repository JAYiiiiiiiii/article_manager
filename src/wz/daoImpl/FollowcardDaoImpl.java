package wz.daoImpl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import wz.dao.FollowcardDao;
import wz.hibernate.factory.BaseHibernateDAO;
import wz.model.Followcard;

public class FollowcardDaoImpl extends BaseHibernateDAO implements FollowcardDao{
	
	/* (non-Javadoc)
	 * @see wz.daoImpl.FollowcardDao#save(wz.model.Followcard)
	 */
	@Override
	public void save(Followcard followcard){
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.save(followcard);
		transaction.commit();
		session.flush();
		session.close();
	}
	
	

}
