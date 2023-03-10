package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDAO;
import com.db.DBConnect;

@WebServlet("/NotesEditServlet")
public class NotesEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		
		try {

			Integer noteId = Integer.parseInt(request.getParameter("note_id"));
			String title  = request.getParameter("title");
			String content = request.getParameter("notes");
			
			PostDAO post = new PostDAO(DBConnect.getConn());
			boolean f = post.postUpdate(noteId, title, content);
			
			if(f == true) {
				HttpSession session = request.getSession();
				session.setAttribute("updateMSg", "Data Updated Succesfully");
				response.sendRedirect("./shownotes.jsp");
			} 
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
