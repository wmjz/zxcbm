package com.Entity;

public class OrderDetail {
	private int id;
	private int bookId;
	private int num;
	private String orderId;
	
	public OrderDetail(int id, int bookId, int num, String orderId) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.num = num;
		this.orderId = orderId;
	}
	public OrderDetail(int bookId, int num, String orderId) {
		super();
		this.bookId = bookId;
		this.num = num;
		this.orderId = orderId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	
}
