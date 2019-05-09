package com.ynq.business.entity;
/**
 * 商品类别
 *
 * @author   Nuoqi.Ying
 * @version  1.0
 * @since    1.0
 * @date     2016-3-15
 */
public class Category {
	
	//type: monitor, alarm, transport, security check, anti-fake, entrance
	
	private int id;
	private String name;
	private String description;
	//
	private String imgUrls;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgUrls() {
		return imgUrls;
	}
	public void setImgUrls(String imgUrls) {
		this.imgUrls = imgUrls;
	}

}
