package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import database.ConnectionManager;
import model.Article;

public class UploadServlet extends HttpServlet {
	private ServletConfig config;
	final public void init(ServletConfig config) throws ServletException {
		this.config = config;
		}
	/**
	 * Constructor of the object.
	 */
	public UploadServlet() {
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
        
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
        String category = request.getParameter("category");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String filepath = request.getParameter("filepath");
        Calendar cd = Calendar.getInstance();
        String uploadtime =cd.getTime().toString();
        
       
       Article  article = new Article(); 
       article.setCategory(category);
       article.setTitle(title);
       article.setAuthor(author);
       article.setFilepath(filepath);
       article.setUploadtime(uploadtime);
       
       Connection con=null;
	    PreparedStatement pStatement = null;
	    int result = 0;
	try{    
	    
			con = ConnectionManager.getConnection();
			String sql =	"insert into article(category,title,author,filepath,uploadtime) values(?,?,?,?,?)";
			pStatement = con.prepareStatement(sql);
			pStatement.setString(1, article.getCategory());
			pStatement.setString(2, article.getTitle());
			pStatement.setString(3, article.getAuthor());
			pStatement.setString(4, article.getFilepath());
			pStatement.setString(5, article.getUploadtime());			
			result = pStatement.executeUpdate();
			response.sendRedirect("upload_success.jsp");
		}  catch (SQLException sqlE) {
			response.sendRedirect("upload_fail.jsp");
			out.println("出错了...或许您重复上传了文章");	
		}  finally {
			ConnectionManager.closeStatement(pStatement);
			ConnectionManager.closeConnection(con);
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
