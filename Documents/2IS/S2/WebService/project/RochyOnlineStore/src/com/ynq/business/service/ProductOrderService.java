package com.ynq.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynq.base.dao.BaseDao;
import com.ynq.base.service.BaseService;
import com.ynq.business.dao.ProductOrderDao;
import com.ynq.business.entity.ProductOrder;


@Service("productOrderService")
public class ProductOrderService extends BaseService<ProductOrder>{
	
	@Autowired
	private ProductOrderDao dao;

	@Override
	public BaseDao<ProductOrder> getDao() {
		
		return this.dao;
	}

}
