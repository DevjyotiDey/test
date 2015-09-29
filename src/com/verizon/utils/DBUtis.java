package com.verizon.utils;
import java.sql.*;

public class DBUtis {

   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net/ad_98df6a4d172d25e?user=b5ef6c1f05c429&password=056279a7";
    static{
    	try{
    	    Class.forName("com.mysql.jdbc.Driver");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
    
    public static Connection getConnection(){
	      System.out.println("Connecting to database...");
	      Connection conn=null;
	      try {
			   conn = DriverManager.getConnection(DB_URL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      return conn;
    }
    
    public static void closeConnection(Connection conn){
    	try {
    		if(conn!=null && conn instanceof Connection)
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
}
