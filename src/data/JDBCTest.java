package data;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCTest {  
 	private static final String url="jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_wzllibrary2"; 
 	private static final String username="544x2zkny1";
 	private static final String password="zh42h3lzy4k2m5k1hyz0yxh2hmhzk01lzy55km4y";

	
	private static Connection conn=null;
	
	//鍔犺浇鏁版嵁搴撻┍鍔�王
	static 
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	//鍗曚緥妯″紡杩斿洖
	public static Connection getConnection() throws Exception
	{
			conn = DriverManager.getConnection(url, username, password);
		    return conn;
	}
	
	public static void main(String[] args) {
		
		try
		{
		   Connection conn = JDBCTest.getConnection();
		   if(conn!=null)
		   {
			   System.out.println("11");
		   }
		   else
		   {
			   System.out.println("22");
		   }
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}

}  
