package wz.daoImpl;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import wz.dao.PrivatePostDao;
import wz.hibernate.factory.BaseHibernateDAO;
import wz.model.PrivatePost;

public class PrivatePostDaoImpl extends BaseHibernateDAO implements PrivatePostDao{

	private static final Logger log = LoggerFactory.getLogger(PrivatePostDaoImpl.class);
	// property constants
	public static final String TITLE = "title";
	public static final String CARD_CONTENT = "cardContent";
	public static final String POST_TYPE = "postType";
	public static final String REPLY_NUM = "replyNum";

	public PrivatePost findById(java.lang.Integer id) {
		log.debug("getting PrivatePost instance with id: " + id);
		try {
			Session session = getSession();
			PrivatePost instance = (PrivatePost) session.get("wz.model.PrivatePost", id);
			session.flush();
			session.close();
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding PrivatePost instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from PrivatePost as model where model."
					+ propertyName + "= ?";
			Session session = getSession();
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			List list = queryObject.list();
			session.flush();
			session.close();
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByCardContent(Object cardContent) {
		return findByProperty(CARD_CONTENT, cardContent);
	}

	public List findByPostType(Object postType) {
		return findByProperty(POST_TYPE, postType);
	}

	public List findByReplyNum(Object replyNum) {
		return findByProperty(REPLY_NUM, replyNum);
	}

	
	@Override
	public void pushlish(PrivatePost privatePost) {
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.save(privatePost);
		transaction.commit();
		session.flush();
		session.close();
	}

	@Override
	public PrivatePost getPrivatePostById(int privatePostId){
		Session session = getSession();
		String sql = "from PrivatePost privatePost where privatePost.id=?";
		Query query = session.createQuery(sql);
		query.setInteger(0, privatePostId);
		List<PrivatePost> privatePosts = query.list();
		session.flush();
		session.close();
		if (privatePosts != null && privatePosts.size()>0)
			return privatePosts.get(0);
		return null;
	}
	
	public List<PrivatePost> search(String keyword){
		
		Session session = getSession();
		String sql = "from PrivatePost privatePost where privatePost.title like ?";
		Query query = session.createQuery(sql);
		query.setString(0, '%'+keyword+'%');
		List list = query.list();
		session.flush();
		session.close();
		return list;
//		Session session = getSession();
//		Criteria criteria = session.createCriteria(Post.class);
//		criteria.add(Restrictions.like("title",keyword,MatchMode.ANYWHERE));
//		List list = criteria.list();
//		session.close();
//		return list;
	}
	public List<PrivatePost> searchByContent(String keyword){
		Session session = getSession();
		String sql = "from PrivatePost privatePost where privatePost.cardContent like ?";
		Query query = session.createQuery(sql);
		query.setString(0, '%'+keyword+'%');
		List list = query.list();
		session.flush();
		session.close();
		return list;
	}

	@Override
	public List<PrivatePost> getPrivatePostByUserId(int userId,int pageIndex,int pageSize) {
		Session session = getSession();
		String sql = "from PrivatePost p where p.user.id = ?";
		Query query = session.createQuery(sql);
		query.setInteger(0, userId);
		int startIndex = (pageIndex -1) * pageSize;
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List list = query.list();
		session.flush();
		session.close();
		return list;
	}

	@Override
	public void autoIncreaseViewNum(int privatePostId) {

		PrivatePost privatePost = findById(privatePostId);
		System.out.println("view:"+privatePost.getViewNum());
		/*if(post.getViewNum() == null)
		{
			post.setViewNum(0);
		}*/
		privatePost.setViewNum(privatePost.getViewNum()+1);
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.update(privatePost);
		transaction.commit();
		session.flush();
		session.close();
	}
	
	public void delete(int privatePostId){
		PrivatePost privatePost = findById(privatePostId);
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.delete(privatePost);
		transaction.commit();
		session.flush();
		session.close();
	}


	@Override
	public void updatePrivatePost(PrivatePost privatePost) {
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.update(privatePost);
		transaction.commit();
		session.close();
		
	}
	
	


	


	

}
