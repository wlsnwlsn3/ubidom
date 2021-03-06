<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst,gridDtl;   
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"2E");
	//개선결과등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("NO,배정일자,관리번호,고객,요청자,품목코드,품명,사용설비,상태,담당자,"+
			          "납기일자,완료일자,선택",null,			
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100,100");
	gridMst.setColAlign("center,center,right,left,left,left,left,left,left,left,"+
			            "center,center,center");
	gridMst.setColTypes("ron,ro,ron,ro,ro,ro,ro,ro,ro,ro,"+
			            "ro,ro,ra");
	gridMst.setColSorting("int,date,int,str,str,str,str,str,str,str,"+
			              "date,date,na");
	gridMst.init();	
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("배정내역");
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("NO,품목코드,품명,사용설비,개선전상태,개선후상태,특이사항",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,left,left,left,left");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,ed,ed");
	gridDtl.setColSorting("int,str,str,str,str,str,str");
	gridDtl.init();	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("개선결과");

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