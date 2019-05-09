package com.ynq.business.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.ynq.business.entity.Order;
import com.ynq.business.entity.Product;
import com.ynq.business.entity.StatisticsCategory;
import com.ynq.business.service.OrderService;
import com.ynq.business.service.ProductService;
import com.ynq.business.service.StatisticsCategoryService;

@Controller
@Scope("prototype")
@RequestMapping("/statistics")
public class StatisticsCategoryController {
	
	@Autowired
	private StatisticsCategoryService statisticsCategoryService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;

	@RequestMapping(value="/data", method=RequestMethod.GET)
	@ResponseBody
	public void data(HttpServletRequest request,HttpServletResponse response){
		List<StatisticsCategory> list = new ArrayList<StatisticsCategory>();
		StatisticsCategory statisticsCategory = new StatisticsCategory();
		list=statisticsCategoryService.queryByCondition(statisticsCategory);
		List<Integer> countList = new ArrayList<Integer>();
		for(StatisticsCategory category : list){
			countList.add(category.getNum());
		}

		
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String productList="";
			productList=gson.toJson(countList);
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
	
	@RequestMapping(value="/price", method=RequestMethod.GET)
	@ResponseBody
	public void price(HttpServletRequest request,HttpServletResponse response){
		List<Order> memoryList = new ArrayList<Order>();
		//List<Double> countList = new ArrayList<Double>();
		Order order = new Order();
		memoryList = orderService.queryByCondition(order);
		List<Double> list1 = new ArrayList<Double>();
		list1.add(0.00);
		list1.add(0.00);
		list1.add(0.00);
		list1.add(0.00);
		list1.add(0.00);
		double num1=0;
		double num2=0;
		double num3=0;
		double num4=0;
		double num5=0;
		//List<Product> productList = new ArrayList<Product>();
		for(Order orderdata:memoryList){
			Product product = productService.queryById(orderdata.getProductId());
			Double num = (product.getPrice()*orderdata.getNumber());
			if(orderdata.getCategoryId()==1){
				num1 = num1+num;
			}
			if(orderdata.getCategoryId()==2){
				num2 = num2+num;
			}
			if(orderdata.getCategoryId()==3){
				num3 = num3+num;
			}
			if(orderdata.getCategoryId()==4){
				num4 = num4+num;
			}
			if(orderdata.getCategoryId()==5){
				num5 = num5+num;
			}
		}
			list1.set(0, num1);
			list1.set(1, num2);
			list1.set(2, num3);
			list1.set(3, num4);
			list1.set(4, num5);
			PrintWriter writer=null;
			try {
				writer=response.getWriter();
				Gson gson=new Gson();	
				String priceList="";
				priceList=gson.toJson(list1);
				writer.write(priceList);
				writer.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
			} finally{
				if(writer!=null){
					writer.close();
				}
			}
	
	}
}