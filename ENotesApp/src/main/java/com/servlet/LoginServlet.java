package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.user.UserDetails;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("uemail");
		String password = request.getParameter("pwd");
		
		UserDetails us = new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		UserDAO dao = null;
		
		try {
			 dao = new UserDAO(DBConnect.getConn());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		UserDetails user = null;
		
		try {
			
			 user = dao.loginUser(us);
			 
			 if(user != null) {
					HttpSession session = request.getSession();
					session.setAttribute("userD", user);
					response.sendRedirect("./home.jsp");
				} else {
				    HttpSession session = request.getSession();
				    session.setAttribute("login-failed", "Invalid email and password");
				    response.sendRedirect("./login.jsp");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
