<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;   
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"1C"); 
	//연간생산계획등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("모재코드,모재명,포장,단위,1월,2월,3월,4월,5월,6월,"+
			           "7월,8월,9월,10월,11월,12월,합계",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			               "100,100,100,100,100,100,100");
	gridMain.setColAlign("left,left,left,left,right,right,right,right,right,right,"+
			             "right,right,right,right,right,right,right");
	gridMain.setColTypes("ro,ro,ro,ro,ron,ron,ron,ron,ron,ron,"+
			             "ron,ron,ron,ron,ron,ron,ron");
	gridMain.setColSorting("str,str,str,str,int,int,int,int,int,int,"+
			               "int,int,int,int,int,int,int");
	gridMain.init();	
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
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
			  연도
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
				 설비코드
				 </label>
				<div class="col-sm-2 col-md-2">
				   <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('설비코드','common/equiCodePOP')">
				</div>
			  </div>
		  </div>
	  </div>           
  </form>
 </div> 
</div>