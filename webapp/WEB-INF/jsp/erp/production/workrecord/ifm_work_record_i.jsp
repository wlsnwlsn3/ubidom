<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.calicon{
width: 28px;
height: 28px;
}
</style>
<script type="text/javascript">
var o;
var gridMain;   
var calMain;
$(document).ready(function(){
	ubi.init(2,[1,2,3,4,5,6],"1C");
	o = ubi.getDataSet(); 
	//업무일지등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMain = o.slayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("NO,내용,첨부",null,
			["text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100");
	gridMain.setColAlign("center,left,center");
	gridMain.setColTypes("ron,ed,ed");
	gridMain.setColSorting("int,str,na");
	gridMain.init();	
	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
});
function fn_new(){
	
}
function fn_search(){
	
}
function fn_save(){
	
}
function fn_delete(){
	
}
function fn_row_intsert(){
	
}
function fn_row_delete(){
	
}
</script>
<div id="container" style="position: relative; width: 100%; height: 100%; overflow:auto;"></div>
<div id="bootContainer" style="position: relative;">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  일자 
			</label>
			  <div class="col-sm-5 col-md-5">
				 <div class="col-sm-5 col-md-5">
				  <div class="input-group date" id="date">
						<div class="col-sm-9 col-md-9">
						<input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
						</div>
						<div class="col-sm-3 col-md-3">
						  <span>
						    <img id="calpicker" class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						  </span>
						</div>
					</div>
				 </div>
				 <div class="col-sm-2 col-md-2" style="margin-left: 10px;">
                <input  name="snum" id="snum" type="text" value="0001" readonly="readonly" class="form-control input-xs">
                </div>
			 </div> 
		 </div>
	    </div>
      </div>      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-12 col-md-7">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 담당
			 </label>
			 <div class="col-sm-5 col-md-5">
				 <div class="col-sm-5 col-md-5">
				  <div class="input-group date" id="date">
						<div class="col-sm-12 col-md-12">
						<input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
						</div>
					</div>
				 </div>
				 <div class="col-sm-2 col-md-2" style="margin-left: 10px;">
                <input  name="empNum" id="empNum" type="text" value="0001" readonly="readonly" class="form-control input-xs">
                </div>
			 </div>
		  </div>
	  </div>
	</div>      
  </form>
</div>