package com.DaoAndDbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Order;


public class OrdersDao {
	public static int addOrder(Order order){
		String sql="insert into orders(id,total,consumerId) values(?,?,?)";
		Object[] obj={order.getId(),order.getTotal(),order.getUserId()};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int del(String id){
		int id1=Integer.parseInt(id);
		String sql="delete from orders where id=?";
		Object[] obj={id1};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static List<Order> select(){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		List<Order> orders=new ArrayList<>();
		try {
			pst=connection.prepareStatement("select a.id,a.total,b.name from orders a left join users b on a.consumerId=b.id");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				String id=resultSet.getString(1);
				float total=resultSet.getFloat(2);
				String name=resultSet.getString(3);
				Order order=new Order(id, total, name);
				orders.add(order);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return orders;
		}
	}
	public static Order getOrder(){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		Order order=null;
		try {
			pst=connection.prepareStatement("select * from orders");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				String id=resultSet.getString(1);
				float total=resultSet.getFloat(2);
				int consumerId=resultSet.getInt(3);
				order=new Order(id, total, consumerId, null);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return order;
		}
	}
}
