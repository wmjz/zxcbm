package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DaoAndDbUtils.UserDao;
import com.Entity.User;

public class loginServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String psd=request.getParameter("psd");
		User user=UserDao.getUser(name);
		HttpSession session=request.getSession();
		
		PrintWriter out=response.getWriter();
		if (user.getPassword().equals(psd)){
			
			session.setAttribute("user", user);
			out.print(1);
		}else {
			out.print(0);
		}
	}

}
