package com.ynq.business.dao;

import java.util.List;

import com.ynq.base.dao.BaseDao;
import com.ynq.business.entity.Order;


public interface OrderDao extends BaseDao<Order>{
	

	public Long getMaxId();

	public List<Order> getOrderByUserId(Long userId);

}
