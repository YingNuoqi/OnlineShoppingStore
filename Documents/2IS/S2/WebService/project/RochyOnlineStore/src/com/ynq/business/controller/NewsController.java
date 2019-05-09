package com.ynq.business.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.ynq.business.entity.News;
import com.ynq.business.service.NewsService;

/**
 * News
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/newsList")
	@ResponseBody
	public void getNewsList(HttpServletRequest request,HttpServletResponse response){

		List<News> list=newsService.queryByCondition(null);
		
		PrintWriter writer=null;		
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String newsList="";
			newsList=gson.toJson(list);
			writer.write(newsList);
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
	@RequestMapping(value="/getNewsById")
	@ResponseBody
	public void getNewsById(HttpServletRequest request,HttpServletResponse response){
		String sid=request.getParameter("id");
		int id=-1;
		PrintWriter writer=null;	
		News news=null;
		if(null!=sid && !"".equals(sid)){
			id=Integer.parseInt(sid);			
			news=newsService.queryById(id);
		}
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String snews="";
			snews=gson.toJson(news);
			writer.write(snews);
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
		String title=request.getParameter("newsTitle");
		String content=request.getParameter("newsContent");
		
		News news=new News();
		news.setTitle(title);
		news.setContent(content);
		
		String msg="";
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try{
			newsService.add(news);
			msg="done";
		}catch (Exception e) {
			msg="failed";
		}
		writer.write(msg);
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
	@RequestMapping(value="/delete")
	@ResponseBody
	public void delete(HttpServletRequest request,HttpServletResponse response){
		String msg="";
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
		if(null!=newsService.queryById(id)){
			try{
				newsService.deleteById(id);
				msg="done";
			}catch (Exception e) {
				msg="failed";
			}
		}else{
			msg="not exist";
		}
		
		writer.write(msg);
		writer.flush();
		if(writer!=null){
			writer.close();
		}	
	}

}
