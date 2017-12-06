package wz.serviceImpl;

import java.util.List;

import wz.dao.NoticeDao;
import wz.model.Notice;
import wz.service.NoticeBiz;

public class NoticeBizImpl implements NoticeBiz {
	private NoticeDao noticeDao;
	
	
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	/* (non-Javadoc)
	 * @see wz.bizImpl.NoticeBiz#getNotice(int, int)
	 */
	@Override
	public  List<Notice> getNotice(int pageIndex, int pageSize){
		return noticeDao.getNotice(pageIndex, pageSize);
	}

	/* (non-Javadoc)
	 * @see wz.bizImpl.NoticeBiz#publish(wz.model.Notice)
	 */
	@Override
	public  void publish(Notice notice){
		noticeDao.publish(notice);
		
	}
	
	public Notice getNoticeById(int noticeId){
		return noticeDao.getNoticeById(noticeId);
		
	}

}
