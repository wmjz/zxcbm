package com.Entity;



public class BookTing {
	private int id;
	private String title;
	private float price;
	private int type;
	private String imgPath;
	private String typeName;
	private String content;
	private int num;
	
	public BookTing(int id, String title, float price, int type, String imgPath, String typeName, String content,
			int num) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.type = type;
		this.imgPath = imgPath;
		this.typeName = typeName;
		this.content = content;
		this.num = num;
	}

	public BookTing(int id, String title, float price, String imgPath, String typeName, String content) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.imgPath = imgPath;
		this.typeName = typeName;
		this.content = content;
	}

	public BookTing() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookTing(String title, float price, int type, String imgPath, String typeName, String content) {
		super();
		this.title = title;
		this.price = price;
		this.type = type;
		this.imgPath = imgPath;
		this.typeName = typeName;
		this.content = content;
	}
	
	
	public BookTing(int id, String title, float price, int type, String imgPath, String typeName, String content) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.type = type;
		this.imgPath = imgPath;
		this.typeName = typeName;
		this.content = content;
	}
	
	public BookTing(int id, String title, float price, int type, String imgPath, String content) {
		super();
		this.id = id;
		this.title = title;
		this.price = price;
		this.type = type;
		this.imgPath = imgPath;
		this.content = content;
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
}
