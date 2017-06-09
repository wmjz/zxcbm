package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DaoAndDbUtils.BookTingDao;
import com.Entity.BookTing;

public class detailsServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int numdetalis=1;
		//获取商品详情的书籍
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		BookTing btdetalis=BookTingDao.getBook(Integer.parseInt(id));
		session.setAttribute("btdetalis", btdetalis);
		//第一次填充书籍数量
		session.setAttribute("numdetalis", numdetalis);
		response.sendRedirect("detalis.jsp");
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String method=request.getParameter("method");
		
		int numdetalis=0;
		switch (method) {
		case "subtractionNum":
			if (Integer.parseInt(request.getParameter("num"))>0) {
				numdetalis=Integer.parseInt(request.getParameter("num"))-1;
			}
			
			break;
		case "addNum":
			numdetalis=Integer.parseInt(request.getParameter("num"))+1;
			break;
		case "updateNum":
			if (Integer.parseInt(request.getParameter("num"))>0) {
				numdetalis=Integer.parseInt(request.getParameter("num"));
			}
			
			break;
		default:
			break;
		}
		session.setAttribute("numdetalis",numdetalis);
		
	}

}
