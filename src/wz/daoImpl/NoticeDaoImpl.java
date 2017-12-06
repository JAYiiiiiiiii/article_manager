package wz.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import wz.dao.NoticeDao;
import wz.hibernate.factory.BaseHibernateDAO;
import wz.model.Notice;

public class NoticeDaoImpl extends BaseHibernateDAO implements NoticeDao{
	
	/* (non-Javadoc)
	 * @see wz.daoImpl.NoticeDao#getNotice(int, int)
	 */
	@Override
	public List<Notice> getNotice(int pageIndex,int pageSize){
		Session session = getSession();
		String sql = "from Notice notice order by notice.noticeDate desc ";
		Query query = session.createQuery(sql);
		int startIndex = (pageIndex -1) * pageSize;
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List list = query.list();
		session.flush();
		session.close();
		return list;
	}
	
	/* (non-Javadoc)
	 * @see wz.daoImpl.NoticeDao#publish(wz.model.Notice)
	 */
	@Override
	public void publish(Notice notice){
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.save(notice);
		transaction.commit();	
		session.flush();
		session.close();

	}

	@Override
	public Notice getNoticeById(int noticeId) {
		Session session = getSession();
		String sql = "from Notice notice where notice.id=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, noticeId);
		List<Notice> list = query.list();
		session.flush();
		session.close();
		if (list.size()>0)
		return list.get(0);
		else return null;
	}

	
	

}
