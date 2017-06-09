package com.DaoAndDbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Entity.User;

public class UserDao {
	public static int addUser(User user){
		String sql="insert into users(password,name) values(?,?)";
		Object[] obj={user.getPassword(),user.getName()};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int delUser(String id){
		int id1=Integer.parseInt(id);
		String sql="delete from users where id=?";
		Object[] obj={id1};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	public static int updateUser(String name,int id){
		String sql="update users set name=? where id=?";
		Object[] obj={name,id};
		int result=DbUtils.updata(obj, sql);
		return result;
	}
	
	public static User getUser(String name){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		User user=null;
		try {
			pst=connection.prepareStatement("select id,password from users where name=?");
			pst.setString(1, name);
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				int id=resultSet.getInt(1);
				String password=resultSet.getString("password");
				user=new User(id, password, name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return user;
		}
	}
	
	public static boolean getnameYN(String name){
		Connection connection=DbUtils.getCon();
		ResultSet resultSet=null;
		PreparedStatement pst=null;
		User user=null;
		boolean flag=false;
		try {
			pst=connection.prepareStatement("select * from users");
			resultSet=pst.executeQuery();
			while (resultSet!=null&&resultSet.next()) {
				String name1=resultSet.getString("name");
				if (name1.equals(name)) {
					flag=true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.close(connection, resultSet, pst);
			return flag;
		}
	}
}
