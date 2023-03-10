package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.PostDAO;
import com.db.DBConnect;
import com.user.Posting;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("notes");
		
		PostDAO postDAO;
		
		try {
			
			postDAO = new PostDAO(DBConnect.getConn());
			boolean f = postDAO.addNotes(title, content, uid);
			
			if(f==true) {
				System.out.println("Data inserted succesfully");
				response.sendRedirect("./shownotes.jsp");
			}
			else {
				System.out.println("data not inserted");
				
			}
			
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
