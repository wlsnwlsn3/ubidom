<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 32px;
height: 28px;
}
</style>
<script type="text/javascript">
var o;
var gridMain;
var calMain;
$(document).ready(function(){
	ubi.init(2,[1,8,9],"1C");
	o = ubi.getDataSet(); 
	//불량원일별현황
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,생산일자,품목코드,품명,포장,단위,정량,함침,조립,크램핑,세척,무게선별,실링",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;"]);
    gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMain.setColAlign("center,center,left,left,left,left,right,right,right,right,right,right,right");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ron,ron,ron,ron,ron,ron,ron");
	gridMain.setColSorting("int,date,str,str,str,str,int,int,int,int,int,int,int");
	gridMain.attachFooter(",일계,,,,,0,0,0,0,0,0,0");
	gridMain.attachFooter(",합계,,,,,0,0,0,0,0,0,0");
	gridMain.init();		

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
function fn_search(){
	
}
function fn_excel(){
	
}
function fn_print(){
	
}
function fn_popupItemCode(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">  
       <div class="row">
		 <div class="form-group form-group-sm">
			<div class="col-sm-12 col-md-7">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				  기간 
				</label>
				<div class="col-sm-5 col-md-5">
					<div class="col-sm-5 col-md-5">
					   <div class="input-group date" id="date1">
						  <div class="col-sm-9 col-md-9">
							 <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="" >
						  </div>
						  <div class="col-sm-3 col-md-3">
							 <span>
						       <img id="calpicker1" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0" onclick="setSens(1,'edDate', 'max')">
						      </span>
						  </div>
					  </div>
					 </div>
				 <label class="col-sm-1 col-md-1 control-label" for="textinput"  style="margin-right: 15px;">~</label>
				 <div class="col-sm-5 col-md-5">
					 <div class="input-group date" id="date2">
						 <div class="col-sm-9 col-md-9">
							<input type="text" class="form-control input-xs" name="edDate" id="edDate" value="" >
						 </div>
						  <div class="col-sm-3 col-md-3">
						    <span>
						       <img id="calpicker2" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0" onclick="setSens(1,'stDate', 'min')">
						     </span>
						   </div>
					   </div>
				  </div>
				</div>
			</div>
		</div>
	  </div>      
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 품목코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>   
  </form>
</div>