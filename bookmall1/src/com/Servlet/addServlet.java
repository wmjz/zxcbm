package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DaoAndDbUtils.bookDao;
import com.Entity.Book;

public class addServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		int id1=Integer.parseInt(id);
		HttpSession session=req.getSession();
		String flag=req.getParameter("flag");
		String name=req.getParameter("name");
		int result=0;
		switch (flag) {
		case "remove":
			result=bookDao.del(id);
			break;
		
		default:
			break;
		}
		PrintWriter out=resp.getWriter();
		out.print(result);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  name=request.getParameter("name");
		String id=request.getParameter("id");
		int result=0;
		if (id.equals("add")) {
			Book book=new Book(name);
			result=bookDao.addbook(book);
		}else {
			int id1=Integer.parseInt(id);
			result=bookDao.updata(name,id1);
		}
		
		PrintWriter out=response.getWriter();
		response.setCharacterEncoding("utf-8");
		
		out.print(result);
	}

}
