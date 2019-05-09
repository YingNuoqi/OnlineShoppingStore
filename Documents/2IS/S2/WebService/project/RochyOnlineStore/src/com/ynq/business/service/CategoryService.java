package com.ynq.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynq.base.dao.BaseDao;
import com.ynq.base.service.BaseService;
import com.ynq.business.dao.CategoryDao;
import com.ynq.business.entity.Category;


@Service("categoryService")
public class CategoryService extends BaseService<Category>{

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public BaseDao<Category> getDao() {
		return this.categoryDao;
	}

}
