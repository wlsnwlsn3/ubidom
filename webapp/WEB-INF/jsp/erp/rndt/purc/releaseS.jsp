<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"2E"); 
	//출고등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,의뢰일자,의뢰자,재료코드,재료명,단위,의뢰수량,사용일자,용도,선택",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,center,left,left,left,right,right,center,left,center");
	gridMst.setColTypes("ron,dhxCalendarA,ed,ed,ed,ed,edn,dhxCalendarA,ed,ra");
	gridMst.setColSorting("int,date,str,str,str,int,int,date,str,na");
	gridMst.init();	
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("재료출고의뢰내역");
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,재료코드,재료명,단위,의뢰수량,출고수량",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,right,right,right");
	gridDtl.setColTypes("ron,ro,ro,ro,ron,ron");
	gridDtl.setColSorting("int,str,str,str,int,int");
	gridDtl.init();
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("출고내역");
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			  일자 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                         <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
             <div class="col-sm-1 col-md-1">
                  <div class="col-sm-11 col-md-11 col-sm-offset-1 col-md-offset-1">
                      <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                  </div>
             </div>
		 </div>
	    </div>
      </div>      
      <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 등록자
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="register" id="register" type="text" value="" placeholder="" class="form-control input-xs">
			</div>
		  </div>
	  </div>
	</div>
  </form>
  </div>
</div>