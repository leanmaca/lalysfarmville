package com.ics.bean;

public class ProductsBean {
	int productId;
	String productName;
	String productDesc;
	String image;
	public ProductsBean(int productId, String productName, String productDesc, String image) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDesc = productDesc;
		this.image = image;
	}
	public ProductsBean() {
		super();
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
