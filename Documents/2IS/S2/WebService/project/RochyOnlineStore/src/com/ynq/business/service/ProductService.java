package com.ynq.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynq.base.dao.BaseDao;
import com.ynq.base.service.BaseService;
import com.ynq.business.dao.ProductDao;
import com.ynq.business.entity.Product;


@Service("productService")
public class ProductService extends BaseService<Product>{
	
	@Autowired
	private ProductDao productDao;

	@Override
	public BaseDao<Product> getDao() {
		return this.productDao;
	}

}
