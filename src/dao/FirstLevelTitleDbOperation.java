package dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cn.dao.FirstLevelTitle;

import dao.*;
import database.ConnectionManager;
import model.User;

public class FirstLevelTitleDbOperation {
	Connection con=null;
	 PreparedStatement ps=null;
	ConnectionManager cond=new ConnectionManager();
	public   static int PAGE_NUM=10;
	//ɾ��
     public int delete(FirstLevelTitle f)throws Exception{
   	  int result=0;
   	  String sql="delete from FirstLevelTitle where +id=?";
   	  con=cond.getConnection();
     	  ps=con.prepareStatement(sql);
		 ps.setInt(1,f.getId());
		
		result=ps.executeUpdate();
   	  return result;
     }
     //��ҳ
     public List showPage (int page){
    	 List<FirstLevelTitle> list=new ArrayList();
    	 int  num=0;
 		Connection dbConnection = null;
		PreparedStatement pStatement = null;
		ResultSet res = null;

    	 if(page>1){
    		 num=PAGE_NUM*(page-1);
    	 }
    	 String sql="select * from FirstLevelTitle order by  id desc limit "+num+","+PAGE_NUM;
    	try{
    		dbConnection = ConnectionManager.getConnection();
    		pStatement = dbConnection.prepareStatement(sql);
			res = pStatement.executeQuery();
			while(res.next()){
				FirstLevelTitle f=new FirstLevelTitle();
				f.setId(res.getInt("id"));
				f.setTitleName(res.getString("TitleName"));
				f.setCreator(res.getString("Creator"));
				f.setCreateTime(res.getDate("CreateTime"));
				list.add(f);
			}
    		
    	}catch (SQLException e) {
			e.printStackTrace();}
		return list;
     }
     public  List getAllFirstLevelTitleList() {
 		ArrayList list = new ArrayList();
 		Connection dbConnection = null;
 		PreparedStatement pStatement = null;
 		ResultSet res = null;

 		try {
 			dbConnection = ConnectionManager.getConnection();
 			String strSql = "select * from FirstLevelTitle order by CreateTime desc";
 			pStatement = dbConnection.prepareStatement(strSql);
 			res = pStatement.executeQuery();
 			while (res.next()) {
 				int id = res.getInt("id");
 				String title = res.getString("TitleName");
 				String creater = res.getString("Creator");
 				Date time = res.getDate("CreateTime");
 				FirstLevelTitle fTitle = new FirstLevelTitle(id,title,creater, time);
 				list.add(fTitle);
 			}
 		} catch (SQLException sqle) {
 			sqle.printStackTrace();
 		} finally {
 			ConnectionManager.closeResultSet(res);
 			ConnectionManager.closeStatement(pStatement);
 			ConnectionManager.closeConnection(dbConnection);
 		}
 		return list;
 	}

	public int insertOneRecord(FirstLevelTitle fTitle) {
		int result = 0;
		Connection con = null;
		PreparedStatement pStatement = null;

		try {
			SimpleDateFormat HMFromat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String strCurrentTime = HMFromat.format( new Date());

			con = ConnectionManager.getConnection();
			String strSql =
				"insert into FirstLevelTitle(TitleName,Creator,CreateTime) values(?,?,?)";
			pStatement = con.prepareStatement(strSql);
			pStatement.setString(1, fTitle.getTitleName());
			pStatement.setString(2, fTitle.getCreator());
			pStatement.setString(3, strCurrentTime);
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

