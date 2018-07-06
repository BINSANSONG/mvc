package com.frame;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class Biz<T,V> {
	String user = "db";
	String password = "db";
	String url = "jdbc:oracle:thin:@70.12.110.172:1521:XE";
	
	public Biz() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		Connection con = null;
		try {
			con = 
			DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close(Connection con) {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public abstract void register(T obj) throws Exception;
	public abstract void remove(V id) throws Exception;
	public abstract void modify(T obj) throws Exception;
	public abstract T get(V id) throws Exception;
	public abstract ArrayList<T> get() throws Exception;
	
}













