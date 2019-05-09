package com.ynq.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynq.base.dao.BaseDao;
import com.ynq.base.service.BaseService;
import com.ynq.business.dao.OrderDao;
import com.ynq.business.entity.Order;


@Service("orderService")
public class OrderService extends BaseService<Order>{
	
	@Autowired
	private OrderDao dao;

	@Override
	public BaseDao<Order> getDao() {
		return this.dao;
	}
	
	
	public Long getMaxId(){
		return this.dao.getMaxId();
	}
	
	
	public List<Order> getOrderByUserId(Long userId){
		return this.dao.getOrderByUserId(userId);
	}

}
