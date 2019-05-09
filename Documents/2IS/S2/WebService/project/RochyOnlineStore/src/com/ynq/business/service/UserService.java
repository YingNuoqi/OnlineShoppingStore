package com.ynq.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ynq.base.dao.BaseDao;
import com.ynq.base.service.BaseService;
import com.ynq.business.dao.UserDao;
import com.ynq.business.entity.User;



@Service("userService")
public class UserService extends BaseService<User>{
	
	@Autowired
	private UserDao userDao;

	@Override
	public BaseDao<User> getDao() {
		return userDao;
	}
	

}
