package com.DaoAndDbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbcp2.BasicDataSource;

public class DbUtils {
	static BasicDataSource ds;
    //创建连接?
	static {
		ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/bookmall");
		ds.setUsername("root");
		ds.setPassword("root");
		//创建5个连?
		ds.setInitialSize(5);
		ds.setMaxTotal(50);
	};
	//关闭
	public static void close(Connection con,ResultSet resultSet,PreparedStatement pst){
		try {
			if (con!=null) {
				con.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			if (resultSet!=null) {
				resultSet.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			if (pst!=null) {
				pst.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static Connection getCon(){
		try {
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static int updata(Object[] obj,String sql){
		Connection connection=getCon();
		PreparedStatement pst = null;
		int result=0;
		try {
			pst=connection.prepareStatement(sql);
			for (int i = 0; i < obj.length; i++) {
				pst.setObject(i+1, obj[i]);
			}
			result=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(connection, null, pst);
			return result;
		}
		
	}
}
