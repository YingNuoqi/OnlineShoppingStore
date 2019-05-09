<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

				<div>
		    		<a href="#" class="easyui-linkbutton" onclick="addPro();">Add</a>
		    	</div>   
		    	<div id="addProductWin">
		    		<form id="addProductForm" name="addProductForm">
		    			<div>   
					        <label for="name">Product Name：</label>   
					        <input class="easyui-validatebox" type="text" name="productName" id="productName" data-options="required:true" />*   
					    </div>
					    <div>
					    	<label for="name">Product Brand：</label>   
					        <input class="easyui-validatebox" type="text" name="productBrand" id="productBrand" data-options="required:true" />*
					    </div>
					     <div>
					    	<label for="name">Product Model：</label>   
					        <input class="easyui-validatebox" type="text" name="productModel" id="productModel" data-options="required:true" />*
					    </div>
					     <div>
					    	<label for="name">Category：</label>   					    	
					        <input type="text" name="productCategoryId" id="productCategoryId" data-options="required:true" />*
					    </div>
					    <div>
					    	<label for="name">Price：</label>   
					        <input class="easyui-validatebox" type="text" name="productPrice" id="productPrice" data-options="required:true" />Euros*
					    </div>
					     <div>
					    	<label for="name">Cost：</label>   
					        <input class="easyui-validatebox" type="text" name="productCost" id=""productCost"" data-options="required:true" />Euros*
					    </div>
					    <div>
					    	<label for="name">Product Amount：</label>   
					        <input class="easyui-validatebox" type="text" name="productNumber" id="productNumber" data-options="required:true" />*
					    </div>
					    <div>
					    	<label for="name">Product images：</label>   
					    	<input type="file" name="file1" id="file1"/>
					        <input type="file" name="file2" id="file2"/>
					        <input type="file" name="file3" id="file3"/>
					        <input type="file" name="file4" id="file4"/>
					    </div>
					    <div>   
					        <label for="name">Product Description：</label>   
					        <textarea rows="2" cols="50" id="productDesciption" name="productDesciption"></textarea>  
					    </div>
					    <div>
					    	<a href="#" onclick="addProduct();">Add</a>
					    	<input type="reset" />
					    </div>
		    		</form>
		    	</div>
		    	<table id="productList">   
				</table>

