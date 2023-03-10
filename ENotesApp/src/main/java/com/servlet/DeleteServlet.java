package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.PostDAO;
import com.db.DBConnect;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer noteId =Integer.parseInt(request.getParameter("note_id"));
		
		PostDAO post;
		try {
			post = new PostDAO(DBConnect.getConn());
			boolean f = post.deleteNotes(noteId);
			
			if(f) {
				HttpSession session = request.getSession();
				session.setAttribute("deleteMsg", "Notes Successfully Delted");
				response.sendRedirect("./shownotes.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		
	}

}
