package wz.service;

import java.util.List;

import wz.model.Notice;

public interface NoticeBiz {

	public abstract List<Notice> getNotice(int pageIndex, int pageSize);

	public abstract void publish(Notice notice);
	public Notice getNoticeById(int noticeId);

}