<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var o;
var gridMain;
$(document).ready(function(){
	ubi.init(1,[1,8,9],"1C");
	o = ubi.getDataSet(); 
	//포장BOM조회
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("Level,포장코드,포장명,규격,단위,수량,사용일지,사용유무,공정,순서,구분,비고",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("right,left,left,left,left,right,center,center,left,right,center,left");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ron,ro,ro,ro,ron,ro,ro");
	gridMain.setColSorting("int,str,str,str,str,int,date,str,str,int,str,str");
	gridMain.init();	
	
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
function fn_popupPackCode(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
		  <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
				포장코드
				</label>
			<div class="col-sm-2 col-md-2">
			    <input type="text" name="packCode" id="packCode" value="" placeholder="" class="form-control input-xs">		
			</div>
		 </div>
	    </div>
      </div>      
  </form>
</div>