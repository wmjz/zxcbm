package com.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.DaoAndDbUtils.BookTingDao;
import com.Entity.BookTing;
import com.sun.mail.handlers.image_gif;

public class bookServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		int result=BookTingDao.del(id);
		PrintWriter outPrintWriter=response.getWriter();
		outPrintWriter.print(result);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		BookTing bt=new BookTing();
		BookTing bt1=new BookTing();
		String root=request.getRealPath("/uplaod");
		int result=0;
		PrintWriter out=response.getWriter();
		String id=null;
		
		try {
			List<FileItem> datas=upload.parseRequest(request);
			for (FileItem fileItem : datas) {
				if (fileItem.isFormField()) {
					String name=fileItem.getFieldName();
					
					String va=fileItem.getString();
					String v=new String(va.getBytes("iso-8859-1"),"utf-8");
					switch (name) {
					case "id":
						if (v.equals("add")) {
							id=v;
						}else {
							id="a";
							bt1.setId(Integer.parseInt(v));
						}
						break;
					case "book_name":
						bt.setTitle(v);
						bt1.setTitle(v);
						break;
					case "book_price": 
						float price=Float.parseFloat(v);
						bt.setPrice(price);
						bt1.setPrice(price);
						break;
					case "book_type2": 
						int type=Integer.parseInt(v);
						bt.setType(type);
						bt1.setType(type);
						break;
					case "content1": 
						bt.setContent(v);
						bt1.setContent(v);
						break;
					default:
						break;
					}
				}else {
					String name=fileItem.getName();
					fileItem.write(new File(root+"/"+name));
					bt.setImgPath(name);
					bt1.setImgPath(name);
				}	
			}
			if (id.equals("add")) {
				result=BookTingDao.addbook(bt);
			}else {
				result=BookTingDao.updata(bt1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			out.print(result);
		}
	}

}
