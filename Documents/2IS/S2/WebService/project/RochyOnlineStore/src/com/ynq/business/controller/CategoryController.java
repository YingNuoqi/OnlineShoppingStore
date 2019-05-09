package com.ynq.business.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.Gson;
import com.ynq.business.entity.Category;
import com.ynq.business.service.CategoryService;

/**
 * product category  Controller
 *
 */

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/categoryList",method=RequestMethod.GET)
	@ResponseBody
	public void getCategoryList(HttpServletRequest request,HttpServletResponse response){
		List<Category> list=categoryService.queryByCondition(null);
		
		PrintWriter writer=null;		
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String categoryList="";
			categoryList=gson.toJson(list);
			writer.write(categoryList);
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
	@RequestMapping(value="/getCategoryById",method=RequestMethod.GET)
	@ResponseBody
	public void getCategoryById(HttpServletRequest request,HttpServletResponse response){
		String sid=request.getParameter("id");
		int id=-1;
		PrintWriter writer=null;	
		Category category=null;
		if(null!=sid && !"".equals(sid)){
			id=Integer.parseInt(sid);			
			category=categoryService.queryById(id);		
		}
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String categoryList="";
			categoryList=gson.toJson(category);
			writer.write(categoryList);
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
	@RequestMapping(value= "/add",method=RequestMethod.POST)
	public void add(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("catName");
		String description=request.getParameter("catDesciption");
		
		Category category=new Category();
		category.setName(name);
		category.setDescription(description);
		category.setImgUrls("");
		
		String img="";
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try{
			categoryService.add(category);
			img="add successfully";
		}catch (Exception e) {
			img="add failed";
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
	@RequestMapping(value="/delete",method=RequestMethod.DELETE)
	public void delete(HttpServletRequest request,HttpServletResponse response){
		String img="";
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String sid=request.getParameter("id");
		int id=-1;
		if(null!=sid && !"".equals(sid)){
			id=Integer.parseInt(sid);
		}
		if(null!=categoryService.queryById(id)){
			try{
				categoryService.deleteById(id);
				img="delete successfully";
			}catch (Exception e) {
				img="delete failed";
			}
		}else{
			img="this type doesn't exist";
		}
		
		writer.write(img);
		writer.flush();
		if(writer!=null){
			writer.close();
		}	
	}

}
