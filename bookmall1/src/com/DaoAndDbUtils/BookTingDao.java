package com.DaoAndDbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Entity.BookTing;


public class BookTingDao {
	public static int addbook(BookTing bt){
		String sql="insert into book(title,price,type,imgPath,content) values(?,?,?,?,?)";
		Object[] obj={bt.getTitle(),bt.getPrice(),bt.getType(),bt.getImgPath(),bt.getContent()};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int del(String id){
		int id1=Integer.parseInt(id);
		String sql="delete from book where id=?";
		Object[] obj={id1};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int updata(BookTing bt){
		String sql="update book set title=?,price=?,type=?,imgPath=?,content=? where id=?";
		Object[] obj={bt.getTitle(),bt.getPrice(),bt.getType(),bt.getImgPath(),bt.getContent(),bt.getId()};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static List<BookTing> select(){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		List<BookTing> bts=new ArrayList<>();
		try {
			pst=connection.prepareStatement("select a.id,a.title,a.price,a.imgpath,a.content,b.name from book a left join books b on a.type=b.id");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				int id=resultSet.getInt(1);
				String title=resultSet.getString(2);
				float price=resultSet.getFloat(3);
				String imgPath=resultSet.getString(4);
				String content=resultSet.getString(5);
				String  typename=resultSet.getString(6);
				BookTing bt=new BookTing(id, title, price,imgPath, typename, content);
				bts.add(bt);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return bts;
		}
	}
	public static List<BookTing> findClassBookTings(int type){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		List<BookTing> bts=new ArrayList<>();
		try {
			pst=connection.prepareStatement("select * from book where type=?");
			pst.setInt(1, type);
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				
				int id=resultSet.getInt(1);
				String title=resultSet.getString(2);
				float price=resultSet.getFloat(3);
				int type1=resultSet.getInt(4);
				String imgPath=resultSet.getString(5);
				String content=resultSet.getString(6);
				BookTing bt=new BookTing(id, title, price, type1, imgPath,content);
				bts.add(bt);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return bts;
		}
	}
	public static BookTing getBook(int id){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		BookTing bt=null;
		try {
			pst=connection.prepareStatement("select * from book where id=?");
			pst.setInt(1, id);
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				int id1=resultSet.getInt(1);
				String title=resultSet.getString(2);
				float price=resultSet.getFloat(3);
				int type=resultSet.getInt(4);
				String imgPath=resultSet.getString(5);
				String content=resultSet.getString(6);
				bt=new BookTing(id1, title, price, type, imgPath,content,content);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return bt;
		}
	}
}
