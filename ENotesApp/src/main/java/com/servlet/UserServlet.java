package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String name = request.getParameter("fname");
		String email = request.getParameter("uemail");
		String password = request.getParameter("pwd");
		UserDAO dao = null;
		UserDetails us = new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		boolean f = false;
		try {
			dao = new UserDAO(DBConnect.getConn());
			 f = dao.addUser(us);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		 
		 PrintWriter out = response.getWriter();
		 HttpSession session;
		if(f) {
			
			 session = request.getSession();
			session.setAttribute("reg-sucess", "Registration Successfull");
			response.sendRedirect("./register.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("failed-msg", "Something went wrong on server");
			response.sendRedirect("./register.jsp");
		}
		
		
		
	}
}
