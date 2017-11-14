package serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import service.RegisterService;

import database.ConnectionManager;
import model.User;
import service.*;

public class RegisterServiceImpl implements RegisterService{

	public int register(User register) {
		// TODO Auto-generated method stub
		int result = 0;
		Connection con=null;
	    PreparedStatement pStatement = null;	    
		try
		{
			con = ConnectionManager.getConnection();
			String strSql =	"insert into user(username,password,sex,birthday,email) values(?,?,?,?,?)";
			pStatement = con.prepareStatement(strSql);
			pStatement.setString(1, register.getUsername());
			pStatement.setString(2, register.getPassword());
			pStatement.setString(3, register.getSex());
			pStatement.setString(4, register.getBirthday());
			pStatement.setString(5, register.getEmail());
			result = pStatement.executeUpdate();
		}  catch (SQLException sqlE) {
			sqlE.printStackTrace();
		}  finally {
			ConnectionManager.closeStatement(pStatement);
			ConnectionManager.closeConnection(con);
		}
		return result;    
}
}