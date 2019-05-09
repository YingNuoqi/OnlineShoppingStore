<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


				<table>
		    		<tr>
		    			<td>Verify Company：</td>
		    			<td><select name="verify" id="verify" >
				    		<option value="0" >Not Verified</option>
				    		<option value="3">Verified</option>
				    		</select>
				    	</td>
		    			<td>&nbsp;Company ID：</td>
		    			<td><input type="text" id="companyId" name="companyId"/></td>
		    			<td>&nbsp;Company Name：</td>
		    			<td><input type="text" id="companyName" name="companyName"/></td>		    			
		    		</tr>
		    		<tr>
		    			<td>Login Name：</td>
		    			<td><input type="text" id="comLogName" name="comLogName"/></td>
		    			<td>&nbsp;Company Type：</td>
		    			<td>
		    				<select name="companyType" id="companyType" >
					    		<option></option>
					    		<option value="公安">Public Security</option>
					    		<option value="交通">Transport</option>
					    		<option value="金融">Finance</option>
					    		<option value="IT或互联网">IT</option>
					    		<option value="制造业">Manufacture</option>
					    		<option value="其他">Other</option>
				    		</select>
		    			</td>
		    			<td>&nbsp;Company Size：</td>
		    			<td>
		    				<select name="companySize" id="companySize">
					    		<option></option>
					    		<option value="0">Very Large（>1000）</option>
					    		<option value="1">Large（500-1000）</option>
					    		<option value="2">Middle（100-500）</option>
					    		<option value="3">Small（<100）</option>
				    		</select> 
		    			</td>
		    			<td>&nbsp;Company Owner：</td>
		    			<td><input type="text" id="companyOwner" name="companyOwner"/></td>
		    			<td>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="getCompanyList();">Search</a></td>
		    		</tr>
		    	</table>
		    	
	        	<table id="companyList">   
				</table>  	     
