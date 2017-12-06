package wz.serviceImpl;

import java.util.List;

import wz.dao.AdminDao;
import wz.model.Admin;
import wz.model.User;
import wz.service.AdminBiz;

public class AdminBizImpl implements AdminBiz {
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}



	
	@Override
	public int login(String username,String password){
		List<Admin> admins = adminDao.login(username);
		if (admins != null && admins.size() > 0){
			if (admins.get(0).getPassword().equals(password))
				return admins.get(0).getId();
			return -1;
		}else 
			return 0;
	}
	
	
	
	@Override
	public void updateAdmin(Admin admin){
		adminDao.updateAdmin(admin);
	}




	@Override
	public Admin getAdminById(Integer adminId) {
		return adminDao.getAdminById(adminId);
	}




	@Override
	public int getAdminIdByUsername(String username) {
		return adminDao.getAdminIdByUsername(username);
	}




	@Override
	public int getAdminIdByEmail(String email) {
		return adminDao.getAdminIdByEmail(email);
	}




	@Override
	public int isExist(Admin admin) {
		return adminDao.isExist(admin);
	}
}
