package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DaoAndDbUtils.BookTingDao;
import com.Entity.BookTing;

public class findclassbookServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("id");
		 List<BookTing> classbts = BookTingDao.findClassBookTings(Integer.parseInt(type));
		HttpSession session = request.getSession();
		session.setAttribute("classbts", classbts);
		PrintWriter out=response.getWriter();
		out.print(1);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
