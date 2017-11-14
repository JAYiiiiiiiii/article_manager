package dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import com.cn.dao.SecondLevelTitle;

import database.ConnectionManager;

public class SecondLevelTitleDbOperation {
	//ɾ��
	public   static int PAGE_NUM=10;
	public int delete(SecondLevelTitle f)throws Exception{
	   	  int result=0;
	   	Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionManager cond=new ConnectionManager();
	   	  String sql="delete from SecondLevelTitle where +id=?";
	   	  con=cond.getConnection();
	     	  ps=con.prepareStatement(sql);
			 ps.setInt(1,f.getId());
			
			result=ps.executeUpdate();
	   	  return result;
	     }
	//��ҳ
	 public List showPage1 (int page){
    	 List<SecondLevelTitle> list=new ArrayList();
    	 int  num=0;
 		Connection dbConnection = null;
		PreparedStatement pStatement = null;
		ResultSet res = null;

    	 if(page>1){
    		 num=PAGE_NUM*(page-1);
    	 }
    	 String sql="select * from SecondLevelTitle order by  id desc limit "+num+","+PAGE_NUM;
    	try{
    		dbConnection = ConnectionManager.getConnection();
    		pStatement = dbConnection.prepareStatement(sql);
			res = pStatement.executeQuery();
			while(res.next()){
				SecondLevelTitle f=new SecondLevelTitle();
				f.setId(res.getInt("id"));
				f.setTitleName(res.getString("TitleName"));
				f.setCreator(res.getString("Creator"));
				f.setCreateTime(res.getDate("CreateTime"));
				f.setParentTitleId(res.getInt("ParentTitleId"));
				f.setFilePath(res.getString("FilePath"));
				list.add(f);
			}
    		
    	}catch (SQLException e) {
			e.printStackTrace();}
		return list;
     }
	public List getSecondLevelTitleListByFirstLevelTitle(int parentTitleId) {
		List list = new ArrayList();
		Connection dbConnection = null;
		PreparedStatement pStatement = null;
		ResultSet res = null;

		try {
			dbConnection = ConnectionManager.getConnection();
			
			String strSql = "select * from SecondLevelTitle "
					+ " where ParentTitleId=(?) order by CreateTime desc";
			if (dbConnection != null) {
				System.out.println(dbConnection != null);
			}

		
			pStatement = dbConnection.prepareStatement(strSql);
			pStatement.setInt(1, parentTitleId);
			res = pStatement.executeQuery();
			while (res.next()) {
				SecondLevelTitle sTitle = new SecondLevelTitle();
				sTitle.setId(res.getInt("id"));
				sTitle.setTitleName(res.getString("TitleName"));
				sTitle.setFilePath(res.getString("FilePath"));
				sTitle.setCreator(res.getString("Creator"));
				sTitle.setCreateTime(res.getDate("CreateTime"));
				sTitle.setParentTitleId(res.getInt("ParentTitleId"));
				list.add(sTitle);
			}
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
		} finally {
			ConnectionManager.closeResultSet(res);
			ConnectionManager.closeStatement(pStatement);
			ConnectionManager.closeConnection(dbConnection);
		}

		return list;
	}


	public int insertOneRecord(SecondLevelTitle sTitle) {
		int result = 0;
		Connection con = null;
		PreparedStatement pStatement = null;
		try {
			Date currentTime = new Date();
			SimpleDateFormat HMFromat = new SimpleDateFormat(
					"yyyy-MM-dd hh:mm:ss");
			String strCurrentTime = HMFromat.format(currentTime);

			con = ConnectionManager.getConnection();
			String strSql = "insert into SecondLevelTitle(TitleName,FilePath,Creator,"
					+ "CreateTime,ParentTitleId) values(?,?,?,?,?)";
			pStatement = con.prepareStatement(strSql);
			//pStatement.setInt(1, getNewId());
			pStatement.setString(1, sTitle.getTitleName());
			pStatement.setString(2, sTitle.getFilePath());
			pStatement.setString(3, sTitle.getCreator());
			pStatement.setString(4, strCurrentTime);
			pStatement.setInt(5, sTitle.getParentTitleId());
			result = pStatement.executeUpdate();
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
		} finally {
			ConnectionManager.closeStatement(pStatement);
			ConnectionManager.closeConnection(con);
		}
		return result;
	}

}
