package com.ynq.base.dao;

import java.util.List;


public interface BaseDao<T> {
	

	void add(T t);

	void update(T t);
	

	void deleteById(Object object);
    

    void deleteByIds(Object... ids);

    void deleteByCondition(Object obj);
    
    
    //Long getAvailableId();

    T queryById(Object object);
    

    List<T> queryByIds(Object... ids);
    

    List<T> queryByCondition(Object object);

    public Integer queryCountByCondition(T t);
	

}
