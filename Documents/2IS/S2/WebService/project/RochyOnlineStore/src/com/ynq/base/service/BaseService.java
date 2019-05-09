package com.ynq.base.service;

import java.util.List;

import com.ynq.base.dao.BaseDao;

public abstract class BaseService<T> {
	
	public abstract BaseDao<T> getDao();
	

	public void add(T t){
		getDao().add(t);
	}

	public void update(T t){
		getDao().update(t);
	}
	

	public void deleteById(Object object){
		getDao().deleteById(object);
	}
    

	public void deleteByIds(Object... ids){
		getDao().deleteByIds(ids);
	}
    

	public void deleteByCondition(Object obj){
		getDao().deleteByCondition(obj);
	}
    
	

	public T queryById(Object object){
		return getDao().queryById(object);
	}
	

    public List<T> queryByIds(Object... ids){
    	return getDao().queryByCondition(ids);
    }
    

	public List<T> queryByCondition(Object object){
		return getDao().queryByCondition(object);
	}

    public Integer queryCountByCondition(T t){
    	return getDao().queryCountByCondition(t);
    }


}
