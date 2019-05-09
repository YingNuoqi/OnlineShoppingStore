package com.ynq.business.entity;


public class Product {
	
	//id
	private Long id;
	//product model
	private String model;
	//name
	private String name;
	//categoryId
	private int categoryId;
	//product description
	private String description;
	//product price
	private double price;
	//product total amount
	private Long number;
	//the urls of product images. (It's a string, like "http://myspace/a.png;http://myspace/b.jpg")  multiple urls are divided by ";"
	private String imgUrls;
	//product brand
	private String brand;
	//product cost price  （ profit = price- costPrice)
	private double cost;
	
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {	
		return price;
	}
	public void setPrice(double price) {	
		this.price = price;
	}
	public Long getNumber() {
		return number;
	}
	public void setNumber(Long number) {
		this.number = number;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getImgUrls() {
		return imgUrls;
	}
	public void setImgUrls(String imgUrls) {
		this.imgUrls = imgUrls;
	}


}
