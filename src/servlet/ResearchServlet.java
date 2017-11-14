package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.jspsmart.upload.*;

import database.ConnectionManager;
import model.Article;
import serviceImpl.ResearchServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class ResearchServlet extends HttpServlet {
	private ServletConfig config;
	final public void init(ServletConfig config) throws ServletException {
		this.config = config;
		}


	/**
	 * Constructor of the object.
	 */
	public ResearchServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        String option = request.getParameter("option");
        String key = request.getParameter("key");
	//	HttpSession session = request.getSession();
	//	session.setAttribute("option", option);
		PreparedStatement pStatement = null;
		Connection con = null;
		con = ConnectionManager.getConnection();
		try{					
			/*String sql = "select * from article where ? = ?";
			pStatement =  con.prepareStatement(sql);
			System.out.println(option + key);
			pStatement.setString(1, option);
			pStatement.setString(2, key);*/
			String sql = "select * from article where " + option + "= '" + key + "'";
			pStatement =  con.prepareStatement(sql);
			ResearchServiceImpl rsi = new ResearchServiceImpl();
			List rearticleList = rsi.listReArticle();				
			// TODO Auto-generated method stub
			System.out.println(sql);
			ResultSet res =  pStatement.executeQuery(sql);	
			while(res.next()){
				Article article = new Article();
				/*article.setId(res.getInt("id"));*/
				article.setCategory(res.getString("category"));
				article.setTitle(res.getString("title"));
				article.setAuthor(res.getString("author"));
				article.setFilepath(res.getString("filepath"));
				article.setUploadtime(res.getString("uploadtime"));
				rearticleList.add(article);
			
			}
			
			/*response.sendRedirect("research_result.jsp");*/
			request.setAttribute("rearticleList", rearticleList); 
			request.getRequestDispatcher("research_result.jsp").forward(request, response); 
		}
		catch(Exception ex){
			ex.printStackTrace();
		out.println("sorry..."+ex.getMessage());
		}
		finally{
			ConnectionManager.closeStatement(pStatement);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
