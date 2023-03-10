package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;
import com.user.Posting;

public class PostDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	public PostDAO(Connection conn) {
		this.conn = conn;
	}
	
	public boolean addNotes(String title, String content, int uid) throws SQLException {
		boolean f = false;
		
		String query = "insert into post(title, content, uid) values(?, ?, ?)";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, uid);
		
		int rowsAff = pstmt.executeUpdate();
		
		if(rowsAff == 1) {
			f = true;
		}
		return f;
	}
	
	
	public ArrayList<Posting> getData(int id)  {
		
		ArrayList<Posting> list = new ArrayList<Posting>();
		
		
		String query = "select * from post where uid = ? order by id desc";
		PreparedStatement pstmt;
		
			try {

				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, id);

				ResultSet resultSet = pstmt.executeQuery();
				
				if(resultSet != null) {
				while(resultSet.next()) {
					Posting po = new Posting();
					po.setId(resultSet.getInt(1));
					po.setTitle(resultSet.getString(2));
					po.setContent(resultSet.getString(3));
					po.setPdate(resultSet.getTimestamp(4));
					list.add(po);
					System.out.println(po);
				}
				
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		
		return list;
	}
	
	
	
	
	
	public Posting getDataById(int id) {
		Posting p = null;
		
		try {
			
			String query = "select * from post where id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				p = new Posting();
				p.setId(resultSet.getInt(1));
				p.setTitle(resultSet.getString(2));
				p.setContent(resultSet.getString(3));
			}
		} catch(Exception  e) {
			e.printStackTrace();
		}
		
		return p;
	}
	
	
	public boolean postUpdate(int nid, String title, String content) {
		boolean f = false;
		
	    try {
	    	
	    	String query = "update post set title = ?, content = ? where id = ?";
	    	
	    	
	    	PreparedStatement pstmt = conn.prepareStatement(query);
	    	
	    	pstmt.setString(1, title);
	    	pstmt.setString(2, content);
	    	pstmt.setInt(3, nid);
	    	
	    	int rowsAff = pstmt.executeUpdate();
	    	
	    	if(rowsAff == 1) {
	    		f = true;
	    	}
	    	
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
		return f;
	}
	
	
	public boolean deleteNotes(int id) {
		boolean f = false;
		
		String query ="delete from post where id = ?";
		
		 try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			
			int rowsAff  = pstmt.executeUpdate();
			
			if(rowsAff == 1) {
				f = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
