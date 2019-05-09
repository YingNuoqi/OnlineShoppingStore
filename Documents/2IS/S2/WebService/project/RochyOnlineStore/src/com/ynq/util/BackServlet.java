package com.ynq.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payback")
public class BackServlet extends HttpServlet{
	
	@RequestMapping("/getback")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String r1_Code=request.getParameter("r1_Code");
		PrintWriter pw=response.getWriter();
		if("1".equals(r1_Code))
		{
			String p1_MerId=request.getParameter("p1_MerId");
			String r3_Amt=request.getParameter("r3_Amt");
			String r6_Order=request.getParameter("r6_Order");
			String rp_PayDate=request.getParameter("rp_PayDate");
			pw.println("payment done! <br/>"
					+ "merchant id："+p1_MerId+"<br/>"
					+ "amount："+r3_Amt+"<br/>"
					+"merchant order number："+r6_Order+"<br/>"
					+"pay time："+rp_PayDate);
		}
		else
		{
			pw.println("pay failed");
		}
	}
}
