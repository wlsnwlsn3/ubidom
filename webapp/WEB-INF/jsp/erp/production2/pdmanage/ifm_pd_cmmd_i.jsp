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
var gridMst;
var gridDtl01;
var gridDtl02;
var calMain;
$(document).ready(function(){
	ubi.init(2,[1,2,3,4,5,6],"3E");
	o = ubi.getDataSet(); 
	//생산지시등록
	o.layout.cells("b").attachObject("bootContainer");
	
	gridMst = o.slayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,요청번호,요청부서,담당,매출구분,구분,설비코드,모재코드,모재명,포장,단위,수량,납기일자,선택",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridMst.setColAlign("center,right,left,left,left,left,left,left,left,left,left,right,center,center");
	gridMst.setColTypes("ron,ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,ron,ro,ra");
	gridMst.setColSorting("int,int,str,str,str,str,str,str,str,str,str,int,date,na");
	gridMst.init();	
	o.slayout.cells("a").showHeader();
	o.slayout.cells("a").setText("코팅요청내역");

	gridDtl01 = o.slayout.cells("b").attachGrid();
	gridDtl01.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl01.setHeader("No,설비코드,8시,#cspan,9시,#cspan,10시,#cspan,11시,#cspan,12시,#cspan,13시,#cspan,14시,#cspan,15시,#cspan,16시,#cspan,17시,#cspan,"+
			"18시,#cspan,19시,#cspan,20시,#cspan,21시,#cspan,22시,#cspan,23시,#cspan,24시,#cspan,1시,#cspan,2시,#cspan,3시,#cspan,4시,#cspan,5시,#cspan,6시,#cspan,7시,#cspan",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl01.setInitWidths("100,100,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30");
	gridDtl01.setColAlign("center,left,right,right,right,right,right,right,right,1right,right,right,right,right,right,right,right,right,right,right,right,right,right,"+
			"right,right,right,right,right,right,right,right,right,right,1right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right,right");
	gridDtl01.setColTypes("ron,ro,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra,ra");
	gridDtl01.setColSorting("int,str,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na,na");
	gridDtl01.init();	
	o.slayout.cells("b").showHeader();
	o.slayout.cells("b").setText("장비사용계획");
	
	gridDtl02 = o.slayout.cells("c").attachGrid();
	gridDtl02.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl02.setHeader("No,작업자,설비,#cspan,#cspan,모재코드,모재명,포장,단위,약품,온도,진공도,에칭,어시스트,두께,Rate,에칭,방식,수량",null,
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl02.attachHeader("#rspan,#rspan,코드,시작,종료,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan",
			["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			 "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl02.setInitWidths("100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100");
	gridDtl02.setColAlign("center,left,left,right,right,left,left,left,left,left,right,right,right,right,right,right,right,left,right");
	gridDtl02.setColTypes("ron,ro,ro,ron,ron,ro,ro,ro,ro,ro,ron,ron,ron,ron,ron,ron,ron,ro,ron");
	gridDtl02.setColSorting("int,str,str,int,int,str,str,str,str,str,int,int,int,int,int,int,int,str,int");
	gridDtl02.init();	
	o.slayout.cells("c").showHeader();
	o.slayout.cells("c").setText("생산지시내역");

	
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
function fn_row_insert(){
	
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
						<input type="text" class="form-control input-xs" name="stDate" id="stDate" value="" >
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
			  <div class="col-sm-2 col-md-2">
			  <input name="charge" id="charge" type="text" value="" placeholder="" class="form-control input-xs">
			  </div>
			</div>
	    </div>
	</div>
  </form>
</div>