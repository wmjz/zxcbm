package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DaoAndDbUtils.BookTingDao;
import com.DaoAndDbUtils.OrderDetailDao;
import com.DaoAndDbUtils.OrdersDao;
import com.Entity.BookTing;
import com.Entity.Card;
import com.Entity.Order;
import com.Entity.OrderDetail;
import com.Entity.User;

public class BuyServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//存入orders数据库
		HttpSession session=request.getSession();
		String bookid=request.getParameter("id");
		String num=request.getParameter("num");
		String price=request.getParameter("price");
		User user=(User) session.getAttribute("user");
		int userid=user.getId();
		String getid=UUID.randomUUID().toString().replace("-", "");
		Order order=new Order(getid,Float.parseFloat(price)*Integer.parseInt(num), userid);
		//存入orders数据库
		int result= OrdersDao.addOrder(order);
		PrintWriter out=response.getWriter();
		//存入orderdetail数据库
		
		OrderDetail orderDetail=new OrderDetail(Integer.parseInt(bookid), Integer.parseInt(num), getid);
		OrderDetailDao.addOrderdetail(orderDetail);
		//放入List集合，在客户订单页面用
		List<OrderDetail> orderDetails=new ArrayList<OrderDetail>();
		session.setAttribute("orderDetails", orderDetails);
		out.print(result);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Map<Integer, BookTing> booktings=Card.findAllBookTing();
		float a=Card.settleAccounts();
		String getid=UUID.randomUUID().toString().replace("-", "");
		User user=(User) session.getAttribute("user");
		Order order=new Order(getid, a, user.getId());
		OrdersDao.addOrder(order);
		List<OrderDetail> orderDetails=new ArrayList<OrderDetail>();
		for(Integer id:booktings.keySet()){
			BookTing bkt=booktings.get(id);
			OrderDetail orderDetail=new OrderDetail(bkt.getId(), bkt.getNum(),getid );
			OrderDetailDao.addOrderdetail(orderDetail);
			orderDetails.add(orderDetail);
		}
		session.setAttribute("orderDetails", orderDetails);
	}

}
