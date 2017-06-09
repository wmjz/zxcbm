package com.Servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DaoAndDbUtils.BookTingDao;
import com.Entity.BookTing;
import com.Entity.Card;

public class cardServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String num=request.getParameter("num");
		String id=request.getParameter("id");
		String method=request.getParameter("method");
		BookTing bt=BookTingDao.getBook(Integer.parseInt(id));
		if (num!=null) {
			bt.setNum(Integer.parseInt(num));
		}
		
		switch (method) {
		case "add":
			Card.addBookTing(bt);
			Map<Integer,BookTing> cardbkt=Card.findAllBookTing();
			session.setAttribute("cardbkt", cardbkt);
			break;
		case "del":
			System.out.println(method);
			Card.delBookTing(Integer.parseInt(id));
			break;
		default:
			break;
		}
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String method=request.getParameter("method");
		BookTing bt=BookTingDao.getBook(Integer.parseInt(id));
		switch (method) {
		case "subtractionNum":
			if (Integer.parseInt(request.getParameter("num"))>1) {
				bt.setNum(Integer.parseInt(request.getParameter("num"))-1);
				Card.addBookTing(bt);
			}
			break;
		case "addNum":
			bt.setNum(Integer.parseInt(request.getParameter("num"))+1);
			Card.addBookTing(bt);
			break;
		case "updateNum":
			if (Integer.parseInt(request.getParameter("num"))>1) {
				bt.setNum(Integer.parseInt(request.getParameter("num")));
				Card.addBookTing(bt);
			}
			break;
		default:
			break;
		}
	}
	

}
