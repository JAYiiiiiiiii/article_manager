package wz.dao;

import java.util.List;

import wz.model.SubForum;

public interface SubForumDao {

	public abstract void save(SubForum transientInstance);

	/**
	 * @return
	 */
	public abstract List<SubForum> findAll();

}