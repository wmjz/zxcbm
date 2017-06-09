package com.Entity;

public class Order {
	private String id;
	private float total;
	private int userId;
	private String userName;
	
	public Order(String id, float total, int userId) {
		super();
		this.id = id;
		this.total = total;
		this.userId = userId;
	}

	public Order(String id, float total, int userId, String userName) {
		super();
		this.id = id;
		this.total = total;
		this.userId = userId;
		this.userName = userName;
	}
	
	public Order(String id, float total, String name) {
		super();
		this.id = id;
		this.total = total;
		this.userName = name;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(float total, int userId) {
		super();
		this.total = total;
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
