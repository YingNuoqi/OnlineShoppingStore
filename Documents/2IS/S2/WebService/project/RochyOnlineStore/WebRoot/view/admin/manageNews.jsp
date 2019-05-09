<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


				<div>
		    		<a href="#" class="easyui-linkbutton" onclick="addNewsBtn();">Add</a>
		    	</div>
		    	<div id="addNewsWin" style="width: 600px;">
		    		<form id="addNewsForm" name="addNewsForm">
		    			<div>   
					        <label for="name">News Title：</label>   
					        <input class="easyui-validatebox" type="text" name="newsTitle" id="newsTitle" data-options="required:true" />*   
					    </div>
					    <div>   
					        <label for="name">News Content：</label>   
					        <textarea rows="25" cols="100" id="newsContent" name="newsContent" style="width: 550px;"></textarea>  
					    </div>
					    <div>
					    	<a href="#" onclick="addNews();">Add</a>
					    </div>
		    		</form>
		    	</div>  

		        <table id="newsList" class="table table-striped">   
				</table> 
		    
