package com.ynq.business.dao;

import com.ynq.base.dao.BaseDao;
import com.ynq.business.entity.ProductOrder;


public interface ProductOrderDao extends BaseDao<ProductOrder> {
	

	public Long getMaxId();

}
