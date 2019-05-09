package com.ynq.business.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.ynq.business.entity.User;
import com.ynq.business.entity.UserJson;
import com.ynq.business.service.UserService;

/**
 * user
 *
 */

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/login")
	public void login(HttpServletRequest request,HttpServletResponse response){
		String loginName=request.getParameter("loginName");
		String loginPass=request.getParameter("loginPass");
		
		String stype=request.getParameter("type");
		int type=-1;
		if(null!=stype && !"".equals(stype)){
			type=Integer.parseInt(stype);
		}
		
		User user=new User();
		user.setLoginName(loginName);
		user.setLoginPass(loginPass);
		user.setType(type);           //type=-1
		
		List<User> list=userService.queryByCondition(user);
		
		PrintWriter writer=null;
		
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String msg="";
			
			if(list.size()==1){
				User u=list.get(0); 
				String userPass=u.getLoginPass();
				if(userPass.equals(loginPass)){					
					request.getSession().setAttribute("logUserName", u.getName());
					request.getSession().setAttribute("logUserId", u.getId().toString());
					request.getSession().setAttribute("User", u);
					System.out.println("logUserName"+request.getSession().getAttribute("logUserName")+"================");
					System.out.println("login successfully");
					UserJson userJson = new UserJson();
					userJson.setMsg("login successfully");
					userJson.setUser(u);
					msg=gson.toJson(userJson);				

				}else{
					msg=gson.toJson("wrong password");									
				}
				
			}else{ 
				msg=gson.toJson("wrong username");											
			}
			writer.write(msg);
			writer.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			writer.close();
		}		
	}
	
	/**
	 * when register, check whether this username is already exist
	 * @param request
	 * @param response
	 */
	@RequestMapping("valiLoginName")
	public void valiLoginName(HttpServletRequest request,HttpServletResponse response){
		String loginName=request.getParameter("loginName");
		String stype=request.getParameter("type");
		int type=-1;
		
		if(null!=stype && !"".equals(stype)){
			type=Integer.parseInt(stype);
		}
		
		User user=new User();
		user.setLoginName(loginName);
		user.setType(type);
		
		List<User> list=userService.queryByCondition(user);
		
		String msg="";
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		if(list.size()!=0){
			msg="0";
		}else{
			msg="1";
		}
		
		request.setAttribute("isLogNameExist", msg);
		
		writer.write(msg);
		writer.flush();
		writer.close();
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/register")
	@ResponseBody
	public void register(HttpServletRequest request,HttpServletResponse response){    
		
		String isLogNameExist="1";
		String sid=request.getParameter("id");
		Long id=-1L;
		if(null!=sid && !"".equals(sid)){
			id=Long.parseLong(sid);
			User user=userService.queryById(id);
			if(null!=user){
				isLogNameExist="0"; 
			}			
		}
		
		Integer userCount0=userService.queryCountByCondition(null);
		//Integer userCount0=null;
		if(null==userCount0){
			userCount0=0;
		}
		
		String msg="";
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String name=request.getParameter("name");
		String loginName=request.getParameter("loginName");
		String loginPass=request.getParameter("loginPass");
		String address=request.getParameter("address");
		String number=request.getParameter("number");
		String stype=request.getParameter("type");   //int
		//personal
		String sex=request.getParameter("sex");
		String birthStr=request.getParameter("birthday");//Date
		Date birthday=new Date();
		//enterprise id
		String companyType=request.getParameter("companyType");
		
		String scompanySize=request.getParameter("companySize");
		int companySize=-1;
		if(null!=scompanySize && !"".equals(scompanySize)){
			companySize=Integer.parseInt(scompanySize);
		}
		
		String companyOwner=request.getParameter("companyOwner");
		String companyNumber=request.getParameter("companyNumber");
		
		int type=-1;
		
		if(null!=stype && !"".equals(stype)){
			type=Integer.parseInt(stype);
		}
		
		
		//add register 册-------------------------------------------------------------------
		if("1".equals(isLogNameExist)){
			User user=new User();
			
			user.setName(name);
			user.setLoginName(loginName);
			user.setLoginPass(loginPass);
			user.setAddress(address);
			user.setNumber(number);
			user.setType(type);
			//personal type
			if(type==1){				
				try {
					SimpleDateFormat formater=new SimpleDateFormat();
					formater.applyPattern("yyyy-MM-dd");
					if(null!=birthStr && !"".equals(birthStr)){
						birthday=formater.parse(birthStr);
					}										
					user.setSex(sex);
					user.setBirthday(birthday);

				} catch (ParseException e) {
					e.printStackTrace();
				}
			}else if(type==0){  					
					user.setCompanyType(companyType);
					user.setCompanySize(companySize);
					user.setCompanyOwner(companyOwner);
					user.setCompanyNumber(companyNumber);				
			}else{
				msg="type wrong";
				writer.write(msg);			
			}
			
			userService.add(user);
			Integer userCount1=userService.queryCountByCondition(null);
			
			System.out.println("/register 注册后userCount:"+userCount1);

			if(userCount1==userCount0+1){
				msg="Done, please login";		
			}else{
				msg="failed";
			}
		}
		//user update------------------------------------------------------------------------------------
		else if("0".equals(isLogNameExist)){  
			
			User user=userService.queryById(id); 
			
			if(null!=name && !"".equals(name)){
				user.setName(name);
			}
			if(null!=loginName && !"".equals(loginName)){
				user.setLoginName(loginName);
			}
			if(null!=loginPass && !"".equals(loginPass)){
				user.setLoginPass(loginPass);
			}
			if(null!=address && !"".equals(address)){
				user.setAddress(address);
			}
			if(null!=number && !"".equals(number)){
				user.setNumber(number);
			}
			if(null!=stype && !"".equals(stype)){
				user.setType(type);
			}
			if(null!=birthStr && !"".equals(birthStr)){
				SimpleDateFormat formater=new SimpleDateFormat();
				formater.applyPattern("yyyy-MM-dd");
				try {
					birthday=formater.parse(birthStr);
				} catch (ParseException e) {
					e.printStackTrace();
				}	
				user.setBirthday(birthday);
			}
			if(null!=companyType && !"".equals(companyType)){
				user.setCompanyType(companyType);
			}
			if(null!=scompanySize && !"".equals(scompanySize)){
				user.setCompanySize(companySize);
			}
			if(null!=companyOwner && !"".equals(companyOwner)){
				user.setCompanyOwner(companyOwner);
			}
			if(null!=companyNumber && !"".equals(companyNumber)){
				user.setCompanyNumber(companyNumber);
			}
			
			try{
				userService.update(user);
				msg="done";
			}catch (Exception e) {
				msg="failed";
			}
		}else{         
			msg="error";
		}
				
		writer.write(msg);
		writer.flush();
		
		if(null!=writer){
			writer.close();
		}				
	}
	
	/**
	 *
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/userList")
	public void getUserList(HttpServletRequest request,HttpServletResponse response){
		String stype=request.getParameter("type");
		int type=-1;
		if(null!=stype && !"".equals(stype)){
			type=Integer.parseInt(stype);
		}
				
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String loginName=request.getParameter("loginName");
		
		User user=new User();
				
		if(null!=id && ""!=id){
			user.setId(Long.parseLong(id));
		}		
		user.setName(name);
		user.setLoginName(loginName);
		
		if(type==0 || type==3){
			String companyType=request.getParameter("companyType");
			String companySize=request.getParameter("companySize");
			String companyOwner=request.getParameter("companyOwner");
			
			user.setType(type);
			user.setCompanyType(companyType);
			if(null!=companySize && ""!=companySize){
				user.setCompanySize(Integer.parseInt(companySize));
			}			
			user.setCompanyOwner(companyOwner);			
		}else if(type==1){
			user.setType(1);  
		}else{
			
		}
		
		List<User> list=userService.queryByCondition(user);
	
		PrintWriter writer=null;
		
		try {
			writer=response.getWriter();
			Gson gson=new Gson();	
			String userList="";
			userList=gson.toJson(list);
			writer.write(userList);
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
	@RequestMapping(value="/delete")
	@ResponseBody
	public void delete(HttpServletRequest request,HttpServletResponse response){
		String sid=request.getParameter("id");
		Long id=-1L;
		if(null!=sid && !"".equals(sid)){
			id=Long.parseLong(sid);
		}
		
		String msg="";
		PrintWriter writer=null;
		try {
			writer=response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try{
			userService.deleteById(id);
			msg="done";
		}catch (Exception e) {
			msg="failed";
		}
		
		writer.write(msg);
		writer.flush();
		
		if(null!=writer){
			writer.close();
		}		
	}
	
}
