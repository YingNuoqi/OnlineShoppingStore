package com.ynq.business.entity;

import java.util.List;


public class ShopCar {
	
	private Long id;
	
	private Long userId;
	
	private List<CarProduct> productList;
	
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

	public List<CarProduct> getProductList() {
		return productList;
	}

	public void setProductList(List<CarProduct> productList) {
		this.productList = productList;
	}
	
}
