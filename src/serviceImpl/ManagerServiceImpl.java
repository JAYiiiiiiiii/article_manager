package serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.ConnectionManager;
import model.Article;
import service.ManagerService;

public class ManagerServiceImpl implements ManagerService{

	public List listAllArticle() throws SQLException  {
		List articlelist=new ArrayList();
		Connection cc = null;	
		PreparedStatement ps = null;
		cc = ConnectionManager.getConnection();
		String sql = "select id,category,title,author,filepath,uploadtime from  article";
		// TODO Auto-generated method stub	
		ps =  cc.prepareStatement(sql);
		ResultSet rs =  ps.executeQuery();	
		try{		
			while(rs.next())
			{
				Article article = new Article();						
				article.setId(rs.getInt("id"));
				article.setCategory(rs.getString("category"));
				article.setTitle(rs.getString("title"));
				article.setAuthor(rs.getString("author"));
				article.setFilepath(rs.getString("filepath"));			   
				article.setUploadtime(rs.getString("uploadtime"));	
				articlelist.add(article);
		}
		}
			catch(SQLException ex){
				ex.printStackTrace();
				}	
	 return articlelist;
	}

}
