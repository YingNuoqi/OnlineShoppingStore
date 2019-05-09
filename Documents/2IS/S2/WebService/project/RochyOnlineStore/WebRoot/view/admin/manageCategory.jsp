<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


				<div>
		    		<a href="#" class="easyui-linkbutton" onclick="addCategory();">Add</a>
		    	</div>
		    	<div id="addCatWin">
		    		<form id="addCatForm" name="addCatForm">
		    			<div>   
					        <label for="name">Category Name：</label>   
					        <input class="easyui-validatebox" type="text" name="catName" id="catName" data-options="required:true" />*   
					    </div>
					    <div>   
					        <label for="name">Category Description：</label>   
					        <textarea rows="2" cols="50" id="catDesciption" name="catDesciption"></textarea>  
					    </div>
					    <div>
					    	<a href="#" onclick="addCat();">Add</a>
					    </div>
		    		</form>
		    	</div>  

		        <table id="categoryList" class="table table-striped">   
				</table> 
		    
