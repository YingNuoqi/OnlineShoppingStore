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
import com.ynq.business.entity.Product;
import com.ynq.business.service.ProductService;

/**
 * product
 */
@Controller
@Scope("prototype")
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/productList")
	@ResponseBody
	public void getProductListByCondition(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("productName");
		String model=request.getParameter("productModel");
		String scategoryId=request.getParameter("productCategoryId");
		int categoryId=-1;
		if(null!=scategoryId && !"".equals(scategoryId) && !"null".equals(scategoryId)){
			categoryId=Integer.parseInt(scategoryId);
		}
		String sprice=request.getParameter("productPrice");
		double price=0;
		if(null!=sprice && !"".equals(sprice)){
			price=Double.parseDouble(sprice);
		}
		
		String snumber=request.getParameter("productNumber");
		Long number=-1L;
		if(null!=snumber && !"".equals(snumber)){
			number=Long.parseLong(snumber);
		}
		String brand=request.getParameter("productBrand");
		
		Product product=new Product();
		product.setName(name);
		product.setModel(model);
		product.setCategoryId(categoryId);
		product.setPrice(price);
		product.setNumber(number);
		product.setBrand(brand);
		
		List<Product> list=productService.queryByCondition(product);
		
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
	@RequestMapping(value="/getProductById")
	@ResponseBody
	public void getProductById(HttpServletRequest request,HttpServletResponse response){
		String sid=request.getParameter("id");
		int id=-1;
		PrintWriter writer=null;	
		Product product=null;
		if(null!=sid && !"".equals(sid)){
			id=Integer.parseInt(sid);			
			product=productService.queryById(id);		
		}
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String sproduct="";
			sproduct=gson.toJson(product);
			writer.write(sproduct);
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			writer.close();
		}	
	}
	
	/**
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/add")
	@ResponseBody
	public void add(HttpServletRequest request,HttpServletResponse response){
		
		String msg="";
		
		Product product=new Product();
		
		String isProductExist="1";
		String sid=request.getParameter("id");
		Long id=-1L;
		if(null!=sid && !"".equals(sid)){
			id=Long.parseLong(sid);
			if(null!=productService.queryById(id)){
				isProductExist="0";  
			}			
		}
		
		String name=request.getParameter("productName");
		String model=request.getParameter("productModel");
		String scategoryId=request.getParameter("productCategoryId");
		int categoryId=-1;
		if(null!=scategoryId && !"".equals(scategoryId)){
			categoryId=Integer.parseInt(scategoryId);
		}
		String description=request.getParameter("productDesciption");
		String sprice=request.getParameter("productPrice");
		double price=0;
		if(null!=sprice && !"".equals(sprice)){
			price=Double.parseDouble(sprice);
		}
		String scost=request.getParameter("productCost");
		double cost=0;
		if(null!=scost && !"".equals(scost)){
			cost=Double.parseDouble(scost);
		}
		String snumber=request.getParameter("productNumber");
		Long number=-1L;
		if(null!=snumber && !"".equals(snumber)){
			number=Long.parseLong(snumber);
		}
		String img1=request.getParameter("file1");
		if(null!= img1 && !"".equals(img1)){
			img1="../images/product/jk/"+img1;
		}
		String img2=request.getParameter("file2");
		if(null!= img1 && !"".equals(img1)){
			img2="../images/product/jk/"+img2;
		}
		String img3=request.getParameter("file3");
		if(null!= img3 && !"".equals(img3)){
			img3="../images/product/jk/"+img3;
		}
		String img4=request.getParameter("file4");
		if(null!= img4 && !"".equals(img4)){
			img4="../images/product/jk/"+img4;
		}
		
		String img="";
		if(null!= img1 && !"".equals(img1)){
			img=img1+";";
		}
		if(null!= img2 && !"".equals(img2)){
			img=img+img2+";";
		}
		if(null!= img3 && !"".equals(img3)){
			img=img+img3+";";
		}
		if(null!= img4 && !"".equals(img4)){
			img=img+img4+";";
		}
		
		String brand=request.getParameter("productBrand");
		
		if(isProductExist.equals("1")){
			product.setName(name);
			product.setModel(model);
			product.setCategoryId(categoryId);
			product.setPrice(price);
			product.setCost(cost);
			product.setNumber(number);
			product.setImgUrls(img);
			product.setBrand(brand);
			product.setDescription(description);
			
			try {
				productService.add(product);
				msg="done";
			} catch (Exception e) {
				msg="failed";
			}						
		}else{       
			product=productService.queryById(id);
			if(null!=name && !"".equals(name)){
				product.setName(name);
			}
			if(null!=model && !"".equals(model)){
				product.setModel(model);		
			}
			if(null!=scategoryId && !"".equals(scategoryId)){
				product.setCategoryId(categoryId);
			}
			if(null!=sprice && !"".equals(sprice)){
				product.setPrice(price);
			}
			if(null!=scost && !"".equals(scost)){
				product.setCost(cost);
			}
			if(null!=snumber && !"".equals(snumber)){
				product.setNumber(number);
			}
			if(null!=brand && !"".equals(brand)){
				product.setBrand(brand);
			}
			if(null!=description && !"".equals(description)){
				product.setDescription(description);
			}
			try {
				productService.update(product);
				msg="done";
			} catch (Exception e) {
				msg="failed";
			}			
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
		if(null!=productService.queryById(id)){
			try{
				productService.deleteById(id);
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
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/deleteByIds")
	@ResponseBody
	public void deleteByIds(HttpServletRequest request,HttpServletResponse response){
		String sidList=request.getParameter("idList");
		String[] sids=sidList.split(",");
		List<Long> ids=new ArrayList<Long>();
		for (String s : sids) {
			Long id=Long.parseLong(s);
			ids.add(id);
		}
		String img="";
		try{
			productService.deleteByIds(ids);
			img="done";
		}catch (Exception e) {
			img="failed";
		}
		
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
			writer.write(img);
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
