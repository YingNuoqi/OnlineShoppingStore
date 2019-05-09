
package com.ynq.business.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ynq.business.dao.ShopCarDao;
import com.ynq.business.entity.CarProduct;

/**
 * shop car
 */
@Controller
@Scope("prototype")
@RequestMapping("/shopCar")
public class ShopCarController {
	
	@Autowired
	private ShopCarDao shopCarDao;
	
	/**
	 * 
	 * @param carProduct	
	 */
	@RequestMapping(value="/addProduct")
	@ResponseBody
	public void addProduct(HttpServletRequest request,HttpServletResponse response,CarProduct carProduct){
		//carProduct.setUserId(SessionUtils.getCurrectUserid(request));
		List<CarProduct> list=shopCarDao.getListByCondition(carProduct);
		if(list.size()>0){
			CarProduct p=list.get(0);
			Integer count=p.getProductCount();
			carProduct.setProductCount(count+carProduct.getProductCount());
			shopCarDao.updateProductCount(carProduct);
		}else{
			shopCarDao.addProductToShopCar(carProduct);
		}

	}
	

	@RequestMapping("/delProductByProductId")
	public void delProductByProductId(Long productId,HttpServletRequest request,HttpServletResponse response){
		CarProduct bean = new CarProduct();
		bean.setUserId(Long.parseLong(request.getParameter("userId")));
		bean.setProductId(productId);
		shopCarDao.delProductByProductId(bean);
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param carProduct
	 */
	@RequestMapping(value="updateProductCount")
	@ResponseBody
	public void updateProductCount(HttpServletRequest request,HttpServletResponse response,CarProduct carProduct){
		//carProduct.setUserId(SessionUtils.getCurrectUserid(request));
		shopCarDao.updateProductCount(carProduct);
	}
	
	/**
	 * 
	 */
	@RequestMapping(value="/clearShopCar")
	@ResponseBody
	public void clearShopCar(HttpServletRequest request,HttpServletResponse response){
		
		shopCarDao.clearShopCarByUserId(Long.parseLong(request.getParameter("userId")));
	}
	
	/**
	 * 
	 * @throws IOException 
	 */
	@RequestMapping(value="/getCarProductsByUserId")
	@ResponseBody
	public void getCarProductsByUserId(HttpServletRequest request,HttpServletResponse response){

		List<CarProduct> carProductList = shopCarDao.getCarProductsByUserId(Long.parseLong(request.getParameter("userId")));
		for(CarProduct carBean : carProductList){
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			carBean.setAddDateStr(format.format(carBean.getAddDate()));
			carBean.setAllThisProductPrice(carBean.getProductPrice()*carBean.getProductCount());
		}
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			Gson gson = new Gson();
			writer.write(gson.toJson(carProductList));
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			if(writer!=null){
				writer.close();
			}
		}
	}
}
