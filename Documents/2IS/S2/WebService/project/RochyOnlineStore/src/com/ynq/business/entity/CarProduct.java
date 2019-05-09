
package com.ynq.business.entity;

import java.util.Date;


public class CarProduct {
	
	private Long id;
	
	private Long userId;
	
	private Long productId;
	
	private Integer productCount;
	
	private Date addDate;
	
	private String addDateStr;
	
	private String productName;
	
	private double productPrice;
	
	private double allThisProductPrice;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getProductCount() {
		return productCount;
	}

	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getAddDateStr() {
		return addDateStr;
	}

	public void setAddDateStr(String addDateStr) {
		this.addDateStr = addDateStr;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public double getAllThisProductPrice() {
		return allThisProductPrice;
	}

	public void setAllThisProductPrice(double allThisProductPrice) {
		this.allThisProductPrice = allThisProductPrice;
	}
	
	
}
