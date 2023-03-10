package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	private static Connection conn = null;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private DBConnect() {

	}

	public static Connection getConn() throws ClassNotFoundException, SQLException {

		if (conn == null)

			conn = DriverManager.getConnection("jdbc:mysql:///enotes", "root", "root123");

		return conn;
	}

}
