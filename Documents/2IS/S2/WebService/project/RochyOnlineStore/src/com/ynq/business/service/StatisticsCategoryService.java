package com.ynq.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynq.base.dao.BaseDao;
import com.ynq.base.service.BaseService;
import com.ynq.business.dao.StatisticsCategoryDao;
import com.ynq.business.entity.StatisticsCategory;

@Service("statisticsCategoryService")
public class StatisticsCategoryService extends BaseService<StatisticsCategory> {
	
	
	@Autowired
	private StatisticsCategoryDao statisticsCategoryDao;

	@Override
	public BaseDao<StatisticsCategory> getDao() {
		return this.statisticsCategoryDao;
	}
	

	public void updateAddOne(int categoryId){
		  statisticsCategoryDao.updateAddOne(categoryId);
	}
	

}
