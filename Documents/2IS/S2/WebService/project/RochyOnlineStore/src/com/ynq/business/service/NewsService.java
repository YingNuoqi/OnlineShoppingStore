package com.ynq.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynq.base.dao.BaseDao;
import com.ynq.base.service.BaseService;
import com.ynq.business.dao.NewsDao;
import com.ynq.business.entity.News;



@Service("newsService")
public class NewsService extends BaseService<News>{
	
	@Autowired
	private NewsDao newsDao;

	@Override
	public BaseDao<News> getDao() {
		return this.newsDao;
	}

}
