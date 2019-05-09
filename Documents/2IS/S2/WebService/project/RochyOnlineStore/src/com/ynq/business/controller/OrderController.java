package com.ynq.business.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ynq.business.entity.Order;
import com.ynq.business.entity.ProductOrder;
import com.ynq.business.entity.User;
import com.ynq.business.service.OrderService;
import com.ynq.business.service.ProductOrderService;
import com.ynq.business.service.ProductService;
import com.ynq.business.service.StatisticsCategoryService;
import com.ynq.business.service.UserService;

/**
 * order
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService; 
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private ProductService productService;
	
	@Autowired
	private ProductOrderService productOrderService;  
	
	@Autowired
	private StatisticsCategoryService statisticsCategoryService;  
	
	@Autowired
	private ShopCarDao shopCarDao;
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/getOrderListByUsers")
	@ResponseBody
	public void getOrderListByUsers(HttpServletRequest request,HttpServletResponse response){
		List<User> userList=userService.queryByCondition(null);
		Map<String, List<Order>> map=new HashMap<String, List<Order>>();
		
		for (User user : userList) {
			List<Order> ord=orderService.getOrderByUserId(user.getId());
			map.put(user.getId().toString(), ord);
		}
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String orderList="";
			orderList=gson.toJson(map);
			writer.write(orderList);
			writer.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally{
			if(writer!=null){
				writer.close();
			}
		}
		
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/orderList")
	@ResponseBody
	public void getOrderListByCondition(HttpServletRequest request,HttpServletResponse response){
	
		String suserId=request.getParameter("userId");
		Long userId=-1L;
		if(null!=suserId && !"".equals(suserId)){
			userId=Long.parseLong(suserId);
		}
		String address=request.getParameter("address");
		String phoneNumber=request.getParameter("phoneNumber");
		String sproductId=request.getParameter("productId");
		Long productId=-1L;
		if(null!=sproductId && !"".equals(sproductId)){
			productId=Long.parseLong(sproductId);
		}
		String scategoryId=request.getParameter("categoryId");
		int categoryId=-1;
		if(null!=scategoryId && !"".equals(scategoryId)){
			categoryId=Integer.parseInt(scategoryId);
		}
		String sproductPrice=request.getParameter("productPrice");
		double productPrice=-1;
		if(null!=sproductPrice && !"".equals(sproductPrice)){
			productPrice=Double.parseDouble(sproductPrice);
		}
		String sstate=request.getParameter("state");
		int state=-1;
		if(null!=sstate && !"".equals(sstate)){
			state=Integer.parseInt(sstate);
		}
		
		Order order=new Order();
		order.setUserId(userId);
		order.setAddress(address);
		order.setPhoneNumber(phoneNumber);
		order.setProductId(productId);
		order.setCategoryId(categoryId);
		order.setProductPrice(productPrice);
		order.setState(state);
		
		List<Order> list=orderService.queryByCondition(order);
		
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String productList="";
			productList=gson.toJson(list);
			writer.write(productList);
			writer.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally{
			if(writer!=null){
				writer.close();
			}
		}				
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="getOrderByUserId")
	@ResponseBody
	public void getOrderByUserId(HttpServletRequest request,HttpServletResponse response){
		String suserId=request.getParameter("userId");
		Long userId=-1L;
		if(null!=suserId && !"".equals(suserId)){
			userId=Long.parseLong(suserId);
		}
		
		List<Order> list=orderService.getOrderByUserId(userId);
		
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String productList="";
			productList=gson.toJson(list);
			writer.write(productList);
			writer.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally{
			if(writer!=null){
				writer.close();
			}
		}
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
//	@RequestMapping("/getOrderById")
//	public void getOrderById(HttpServletRequest request,HttpServletResponse response){
//		//id
//		String sid=request.getParameter("id");
//		Long id=-1L;
//		PrintWriter writer=null;	
//		Order order=null;
//		if(null!=sid && !"".equals(sid)){
//			id=Long.parseLong(sid);
//			order=orderService.queryById(id);
//		}
//		try {
//			writer=response.getWriter();
//			Gson gson=new Gson();	
//			String sproduct="";
//			sproduct=gson.toJson(order);
//			writer.write(sproduct);
//			writer.flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally{
//			writer.close();
//		}	
//	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/add")
	@ResponseBody
	public void add(HttpServletRequest request,HttpServletResponse response){
		
		String suserId=request.getParameter("userId");
		Long userId=-1L;
		if(null!=suserId && !"".equals(suserId)){
			userId=Long.parseLong(suserId);
		}

		String sproductId=request.getParameter("productId");
		Long productId=-1L;
		if(null!=sproductId && !"".equals(sproductId)){
			productId=Long.parseLong(sproductId);
		}
		
		String snumber=request.getParameter("number");
		Long number=-1L;
		if(null!=snumber && !"".equals(snumber)){
			number=Long.parseLong(snumber);
		}

		String sstate=request.getParameter("state");
		int state=-1;
		if(null!=sstate && !"".equals(sstate)){
			state=Integer.parseInt(sstate);
		}
		
		String memo=request.getParameter("memo");
		
		Order order=new Order();
		order.setUserId(userId);
		order.setProductId(productId);
		order.setNumber(number);
		order.setState(state);
		order.setMemo(memo);
		
		ProductOrder productOrder=new ProductOrder();
		Long orderId=orderService.getMaxId()+1;
		productOrder.setOrderId(orderId);
		productOrder.setProductId(productId);
		productOrder.setNumber(number);
		productOrder.setUserId(userId);
		
		String msg="";
		
		try {
			
			productOrderService.add(productOrder);
			orderService.add(order);
			int categoryId=productService.queryById(productId).getCategoryId();
			statisticsCategoryService.updateAddOne(categoryId);
			
			msg="done";
		} catch (Exception e) {
			msg="failed";
		}
		
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
			writer.write(msg);
			writer.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally{
			if(writer!=null){
				writer.close();
			}
		}	
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/addFromCar")
	@ResponseBody
	public void addFromCar(HttpServletRequest request,HttpServletResponse response){
		
		String msg="";
		
		String suserId=request.getParameter("userId");
		Long userId=-1L;
		if(null!=suserId && !"".equals(suserId)){
			userId=Long.parseLong(suserId);
		}
		
		String sstate=request.getParameter("state");
		int state=-1;
		if(null!=sstate && !"".equals(sstate)){
			state=Integer.parseInt(sstate);
		}
		
		String info=request.getParameter("info");
		if(null!=info && !info.equals("")){
			String[] orders=info.split(";");
			for (String o : orders) {
				String[] strs=o.split(",");
				String sproductId=strs[0]; 
				String snumber=strs[1]; 
				
				Long productId=-1L;
				if(null!=sproductId && !"".equals(sproductId)){
					productId=Long.parseLong(sproductId);
				}
				
				Long number=-1L;
				if(null!=snumber && !"".equals(snumber)){
					number=Long.parseLong(snumber);
				}
				
				Order order=new Order();
				order.setUserId(userId);
				order.setProductId(productId);
				order.setNumber(number);
				order.setState(state);
				
				ProductOrder productOrder=new ProductOrder();
				Long orderId=orderService.getMaxId()+1;
				productOrder.setOrderId(orderId);
				productOrder.setProductId(productId);
				productOrder.setNumber(number);
				productOrder.setUserId(userId);
								
				
				try {
					
					productOrderService.add(productOrder);
					orderService.add(order);
					int categoryId=productService.queryById(productId).getCategoryId();
					statisticsCategoryService.updateAddOne(categoryId);
					
					CarProduct carProduct=new CarProduct();
					carProduct.setProductId(productId);
					carProduct.setUserId(userId);
					shopCarDao.delProductByProductId(carProduct);

				} catch (Exception e) {
					msg="failed";
				}
				
			}
		}
		
		PrintWriter writer=null;
		if(msg.equals("")){
			msg="done";
		}
		try {
			writer=response.getWriter();
			writer.write(msg);
			writer.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally{
			if(writer!=null){
				writer.close();
			}
		}	
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/update")
	@ResponseBody
	public void update(HttpServletRequest request,HttpServletResponse response){
		String sstate=request.getParameter("state");
		int state=-1;
		if(null!=sstate && !"".equals(sstate)){
			state=Integer.parseInt(sstate);
		}
		
		String sid=request.getParameter("id");
		Long id=-1L;
		if(null!=sid && !"".equals(sid)){
			id=Long.parseLong(sid);
		}
		
		String memo=request.getParameter("memo");
		if(null==memo ||"".equals(memo)){
			memo="";
		}
		
		Order order=new Order();
		order.setState(state);
		order.setMemo(memo);
		order.setId(id);
		
		String msg="";
		
		try {
			orderService.update(order);
			msg="done";
		} catch (Exception e) {
			msg="failed";
		}
		
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
			writer.write(msg);
			writer.flush();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally{
			if(writer!=null){
				writer.close();
			}
		}
		
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public void delete(HttpServletRequest request,HttpServletResponse response){
		String img="";	
		
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String sid=request.getParameter("id");
		Long id=-1L;
		if(null!=sid && !"".equals(sid)){
			id=Long.parseLong(sid);
		}
		
		ProductOrder productOrder=new ProductOrder();
		productOrder.setOrderId(id);
		
		if(null!=orderService.queryById(id)){
			try{
				orderService.deleteById(id);
				productOrderService.deleteByCondition(productOrder);
				img="done";
			}catch (Exception e) {
				img="failed";
			}
		}else{
			img="not exist";
		}
		
		writer.write(img);
		writer.flush();
		if(writer!=null){
			writer.close();
		}	
	}

}
