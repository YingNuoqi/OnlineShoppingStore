package com.ynq.business.dao;

import com.ynq.base.dao.BaseDao;
import com.ynq.business.entity.StatisticsCategory;

public interface StatisticsCategoryDao extends BaseDao<StatisticsCategory>{
	

	  public void updateAddOne(int categoryId);
}
