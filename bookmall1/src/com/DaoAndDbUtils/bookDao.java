package com.DaoAndDbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Book;


public class bookDao {
	
	public static int addbook(Book book){
		String sql="insert into books(name) values(?)";
		Object[] obj={book.getName()};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int del(String id){
		int id1=Integer.parseInt(id);
		String sql="delete from books where id=?";
		Object[] obj={id1};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int updata(String name,int id){
		String sql="update books set name=? where id=?";
		Object[] obj={name,id};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static List<Book> select(){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		List<Book> books=new ArrayList<>();
		try {
			pst=connection.prepareStatement("select * from books");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				int id=resultSet.getInt(1);
				String name=resultSet.getString(2);
				Book book=new Book(id, name);
				books.add(book);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return books;
		}
	}
	public static Book getBook(){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		Book book=null;
		try {
			pst=connection.prepareStatement("select * from books");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				int id=resultSet.getInt(1);
				String name=resultSet.getString(2);
				book=new Book(id, name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return book;
		}
	}
}
