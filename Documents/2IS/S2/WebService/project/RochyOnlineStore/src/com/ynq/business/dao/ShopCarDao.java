
package com.ynq.business.dao;


import java.util.List;

import com.ynq.base.dao.BaseDao;
import com.ynq.business.entity.CarProduct;
import com.ynq.business.entity.ShopCar;


public interface ShopCarDao extends BaseDao<ShopCar>{
	
	void addProductToShopCar(CarProduct carProduct);
	

	void delProductByProductId(CarProduct carProduct);

	void updateProductCount(CarProduct carProduct);
	

	void clearShopCarByUserId(Long currectUserid);
	

	List<CarProduct> getCarProductsByUserId(Long currectUserid);
	
	List<CarProduct> getListByCondition(CarProduct carProduct);
}
