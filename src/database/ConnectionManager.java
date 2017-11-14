package database;

import java.sql.*;
import com.mysql.jdbc.Statement;

public class ConnectionManager {

	private static final String DRIVER_CLASS = "org.gjt.mm.mysql.Driver";
	private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/project1";
	private static final String DATABASE_USRE = "root";
	private static final String DATABASE_PASSWORD = "wzdgws";
	private Statement stmt;
	private ResultSet res;

	public static Connection getConnection() {
		Connection dbcon = null;
		try {
			Class.forName(DRIVER_CLASS);
			dbcon = DriverManager.getConnection(DATABASE_URL,
					DATABASE_USRE, DATABASE_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dbcon;
	}


	public static void closeConnection(Connection dbcon) {
		try {
			if (dbcon != null && (!dbcon.isClosed())) {
				dbcon.close();
			}
		} catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		}

	}

	 public ResultSet executeQuery(String sql)
	    {
	    	//System.out.println("executeQuery!");
			try
			{
			res = (ResultSet) stmt.executeQuery(sql);
			System.out.println("executeQuery!");
			}
			catch(SQLException e)
			{
				e.printStackTrace();	
			}
			//System.out.println("executeQuery!");
			return res;
		}
	    
	public static void closeResultSet(ResultSet res) {
		try {
			if (res != null) {
				res.close();
				res = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public static void closeStatement(PreparedStatement pStatement) {
		try {
			if (pStatement != null) {
				pStatement.close();
				pStatement = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
//	public void test(){
//		Connection conn = null;
//		Statement stmt = null;
//		try {
//			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//			conn = DriverManager.getConnection("jdbc:odbc:news","sa","sa");
//			stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery("SELECT * FROM authors");
//			while(rs.next()){ 
//				System.out.println(rs.getInt(1));
//				String firstName = rs.getString(2);
//				String lastName = rs.getString(3); 
//			} 
//		} catch (Exception e) {
//			System.out.println("��ѯʱ���ִ���"+e.getMessage());
//		}finally{
//			try{
//			if(stmt!=null) stmt.close();
//			if(conn!=null) conn.close();
//			}catch(SQLException e) {
//				System.out.println("û����ȷ�ر����ӣ�");
//			}
//		}
//	}
//	public static void main(String[] args){
//		new ConnectionManager().test();
//	}
}
