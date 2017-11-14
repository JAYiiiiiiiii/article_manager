package serviceImpl;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.ConnectionManager;
import model.Article;
import service.ShowService;

public class ShowServiceImpl implements ShowService{

	public List listAllArticle() throws SQLException  {
		List articlelist=new ArrayList();
		Connection cm = null;	
		PreparedStatement ps = null;
		cm = ConnectionManager.getConnection();
		String sql = "select * from  article";
		// TODO Auto-generated method stub
	//	HttpSession session = request.getSession();
	//	session.setAttribute("option", option);		
		ps =  cm.prepareStatement(sql);
		ResultSet rs =  ps.executeQuery();	
	//		String sql = "select * from user where ? = ?";
	//		pStatement =  con.prepareStatement(sql);
	//		pStatement.setString(1,option);
	//		pStatement.setString(2,key);
		try{		
			while(rs.next())
			{
				Article article = new Article();
			
//			res.getString("title");
//			res.getString("author");
//			res.getString("uploadtime");						
						
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

