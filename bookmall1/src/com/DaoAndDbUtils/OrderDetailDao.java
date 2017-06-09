package com.DaoAndDbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Order;
import com.Entity.OrderDetail;

public class OrderDetailDao {
	public static int addOrderdetail(OrderDetail orderDetail){
		String sql="insert into orderdetail(id,bookId,num,orderId) values(?,?,?,?)";
		Object[] obj={orderDetail.getId(),orderDetail.getBookId(),orderDetail.getNum(),orderDetail.getOrderId()};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int del(String id){
		String sql="delete from orderdetail where id=?";
		Object[] obj={id};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static List<OrderDetail> select(){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		List<OrderDetail> orderDetails =new ArrayList<>();
		try {
			pst=connection.prepareStatement("select * from orderdetail");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				String id=resultSet.getString(1);
				int bookId=resultSet.getInt(2);
				int num=resultSet.getInt(3);
				String orderId=resultSet.getString(4);
				OrderDetail orderDetail=new OrderDetail(bookId, num, orderId);
				orderDetails.add(orderDetail);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return orderDetails;
		}
	}
	public static OrderDetail getOrderDetail(String id){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		OrderDetail orderDetail=null;
		try {
			pst=connection.prepareStatement("select * from orderdetail where id=?");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				int id1=resultSet.getInt(1);
				int bookId=resultSet.getInt(2);
				int num=resultSet.getInt(3);
				String orderId=resultSet.getString(4);
				orderDetail=new OrderDetail(id1,bookId, num, orderId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return orderDetail;
		}
	}
}
