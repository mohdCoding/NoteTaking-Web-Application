package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.UserDetails;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	
	public UserDAO(Connection conn) {
		this.conn = conn;
	}
	
	public boolean addUser(UserDetails userDetails) {
		
	    boolean f = false;
	    
	    try {
	    	String query = "insert into user(fullname, email, password) values(?, ?, ?)";
	    	
	    	pstmt = conn.prepareStatement(query);
	    	String name = userDetails.getName();
	    	String email = userDetails.getEmail();
	    	String password = userDetails.getPassword();
	    	
	    	pstmt.setString(1, name);
	    	pstmt.setString(2, email);
	    	pstmt.setString(3, password);
	    	int rowsAff = pstmt.executeUpdate();
	    	
	    	if(rowsAff == 1) 
	    		f = true;
	    	
	    } catch(SQLException e) {
	    	e.printStackTrace();
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
		return f;
	}
	
	public UserDetails loginUser(UserDetails us) throws SQLException {
		
		UserDetails user = null;
		String query = "select * from user where email=?  and password=?";
		
		PreparedStatement pstmt = conn.prepareStatement(query);
		String email = us.getEmail();
		String password = us.getPassword();
		pstmt.setString(1, email);
		pstmt.setString(2, password);
	
		ResultSet resultSet = pstmt.executeQuery();
		
		if(resultSet.next()) {
			user = new UserDetails();
			user.setId(resultSet.getInt("id"));
			user.setName(resultSet.getString("fullname"));
			user.setEmail(resultSet.getString("email"));
			user.setPassword(resultSet.getString("password"));
		}
		
		
		return user;
	}
	
	
}
	
