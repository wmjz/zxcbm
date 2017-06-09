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

public class registerServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		boolean flag=UserDao.getnameYN(name);
		PrintWriter out=response.getWriter();
		if(flag) {
			out.print(1);
		}else {
			out.print(0);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String psd=request.getParameter("psd");
		String psd1=request.getParameter("psd1");
		boolean flag=UserDao.getnameYN(name);
		HttpSession session=request.getSession();
		
		PrintWriter out=response.getWriter();
		int result=0;
		if(psd.equals(psd1)&&!flag&&name!=null){
			User user=new User(psd, name);
			result=UserDao.addUser(user);
			User user2=UserDao.getUser(name);
			session.setAttribute("user", user2);
			out.print(result);
		}else if(name==null) {
			out.print(3);
		}else if(flag) {
			out.print(2);
		}else if (!psd.equals(psd1)) {
			out.print(result);
		}
	}

}
