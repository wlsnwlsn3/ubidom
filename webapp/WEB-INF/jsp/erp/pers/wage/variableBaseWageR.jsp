<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,3],"2U");
	//급여기본자료(유동/공제)
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,사번,성명,부서,직위,주민등록번호",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100");
	gridMst.setColAlign("center,right,left,left,left,left");
	gridMst.setColTypes("ron,ron,ro,ro,ro,ro");
	gridMst.setColSorting("int,int,str,str,str,str");
	gridMst.init();	
	subLayout.cells("a").setWidth(603);
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,지급/공제,코드,항목명,금액",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100");
	gridDtl.setColAlign("center,left,left,left,right");
	gridDtl.setColTypes("ron,ro,ro,ro,ro");
	gridDtl.setColSorting("int,str,str,str,int");
	gridDtl.attachFooter("합계,,,,0");
	gridDtl.init();		

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
    calMain.loadUserLanguage("ko");
    calMain.setDateFormat("%Y/%m");
    calMain.hideTime();	   
    var t = new Date().getFullYear();
    var m = +new Date().getMonth()+1;
    m = fn_monthLen(m);
	byId("stDate").value = t+"/"+m;
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
			  년월 
			</label>
			<div class="col-sm-2 col-md-2">
                  <div class="col-sm-10 col-md-10">
                      <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                  </div>
                  <div class="col-sm-2 col-md-2">
                     <input type="button" id="calpicker" class="calicon form-control">
                  </div>              
             </div>
		 </div>
	    </div>
      </div>  
      <div class="row">
	     <div class="form-group form-group-sm">
		    <div class="col-sm-8 col-md-8">
			   <label class="col-sm-2 col-md-2 control-label" for="textinput">
			    부서
			   </label>
			   <div class="col-sm-2 col-md-2">
			     <input name="dept" id="dept" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('부서코드','common/deptCodePOP')">
			   </div>
		    </div>
	     </div>
	 </div>
	 <div class="row">
	    <div class="form-group form-group-sm">
		   <div class="col-sm-8 col-md-8">
			 <label class="col-sm-2 col-md-2 control-label" for="textinput">
			  성명
			 </label>
			 <div class="col-sm-2 col-md-2">
			   <input name="name" id="name" type="text" value="" placeholder="" class="form-control input-xs">
			 </div>
		  </div>
	   </div>
	 </div>  
     <div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 직군
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="jobgubn" id="jobgubn" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="관리직">관리직</option>
			   <option value="생산직">생산직</option>
			   <option value="용역">용역</option>
			   <option value="외국인">외국인</option>
			   <option value="기술직">기술직</option>
			  </select>
			</div>
			<label class="col-sm-1 col-md-1 control-label" for="textinput">
			 근무
			 </label>
			<div class="col-sm-2 col-md-2">
			  <select name="work" id="work" class="form-control input-xs">
			   <option value="전체">전체</option>
			   <option value="재직">재직</option>
			   <option value="휴직">휴직</option>
			   <option value="퇴직">퇴직</option>
			  </select>
			</div>
		  </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>