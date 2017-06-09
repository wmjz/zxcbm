package com.Filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebFilter({"*.jsp","*.do"})
public class AccessControl implements Filter {
	private	List<String> urls=null;
	public void init(FilterConfig fConfig) throws ServletException {
		urls=new ArrayList<String>();
		urls.add("/bookmall1/login.jsp");
		urls.add("/bookmall1/login.do");
		urls.add("/bookmall1/register.jsp");
		urls.add("/bookmall1/register.do");
		urls.add("/bookmall1/classification.jsp");
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		HttpSession session= req.getSession();
		String target=req.getRequestURI();
		
		if (urls.contains(target)) {
			chain.doFilter(request, response);
		}else {
			Object user=session.getAttribute("user");
			if (user!=null) {
				chain.doFilter(request, response);
			}else {
				resp.sendRedirect("login.jsp");
			}
		}
	}
	public void destroy() {
		
	}
	

}
