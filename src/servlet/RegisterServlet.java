package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.ConnectionManager;
import model.User;
import serviceImpl.RegisterServiceImpl;
public class RegisterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
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
doPost(request, response);
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
		String username= request.getParameter("username");
	    String password= request.getParameter("password");
	  //  String repassword= request.getParameter("repassword");
	    String sex= request.getParameter("sex");
	    String birthday= request.getParameter("birthday");
	    String email= request.getParameter("email");
	    User user = new User();
	    user.setUsername(username);
	    user.setPassword(password);
	    user.setSex(sex);
	    user.setBirthday(birthday);
	    user.setEmail(email);
	    Connection con=null;
	    PreparedStatement pStatement = null;
	    ResultSet rs = null; 
	    try{
	    	con = ConnectionManager.getConnection();
	        username = request.getParameter("username");
	        String sql="select * from user where username = ?";	        
	        pStatement = con.prepareStatement(sql);	             
	 	    pStatement.setString(1,username);
	        rs=pStatement.executeQuery();
	        System.out.println("Now in registerServlet");
	        if(rs.next()){
	        	System.out.println("用户已存在");
	            response.sendRedirect("register_fail.jsp");
	             }
	         else
	           {  
	        	 RegisterServiceImpl rsi = new RegisterServiceImpl();  
	        	 int result = rsi.register(user);
	              response.sendRedirect("register_success.jsp");
	              }
	         con.close();
	            }
	         catch(SQLException e1){
	        	 out.println("Something wrong " + e1.getMessage());
	        	 }
	         finally{
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
