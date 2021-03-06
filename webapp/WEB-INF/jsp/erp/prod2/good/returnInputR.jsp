<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C");
	//반품입고조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,일자,거래처,모재코드,모재명,규격,재질,단위,반품수량,반품사유,"+
			           "폐기",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
	                       "100");
	gridMain.setColAlign("center,center,left,left,left,left,left,left,right,left,"+
	                     "center");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ron,ro,"+
	                     "ra");
	gridMain.setColSorting("int,date,str,str,str,str,str,Str,int,str,"+
	                       "na");
	gridMain.init();	

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]);
	calMain.loadUserLanguage("ko");
	calMain.hideTime();
	var t = dateformat(new Date());
	byId("stDate").value = t;
	byId("edDate").value = t;
});
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">   
      <div class="row">  
		 <div class="form-group form-group-sm">
			<div class="col-sm-8 col-md-8">
				<label class="col-sm-2 col-md-2 control-label" for="textinput">
				 기간 
				</label>
				<div class="col-sm-6 col-md-6">
                    <div class="col-sm-4 col-md-4">
                         <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                         </div>
                         <div class="col-sm-2 col-md-2">
                              <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')">
                          </div>
                     </div>
                     <label class="col-sm-1 col-md-1 control-label" for="textinput" style="margin-right: 15px;">~</label>
                        <div class="col-sm-4 col-md-4">
                          <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="edDate" id="edDate" value="">
                          </div>
                          <div class="col-sm-2 col-md-2">
                                <input type="button" id="calpicker2" class="calicon form-control" onclick="setSens(1,'stDate', 'min')">
                          </div>
                       </div> 
                 </div>              
			</div>
		</div>
	  </div>      
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 거래처
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="supplyComp" id="supplyComp" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('거래처','common/supplyCompPOP')">
			</div>
		  </div>
	  </div>
	</div>
	<div class="row">
	     <div class="form-group form-group-sm">
	       <div class="col-sm-8 col-md-8">
		     <label class="col-sm-2 col-md-2 control-label" for="textinput">
			   구분
		      </label>
			  <div class="col-sm-3 col-md-3">
			    <div class="col-sm-4 col-md-4">
			      <input type="radio" name="gubn" id="gubn" value="1" checked="checked">전체 
			    </div>
			    <div class="col-sm-4 col-md-4">
			      <input type="radio" name="gubn" id="gubn" value="2" >폐기 
			    </div>
			    <div class="col-sm-4 col-md-4">
			      <input type="radio" name="gubn" id="gubn" value="3" >입고
			    </div>
			  </div>
			</div>
	    </div>
	</div>
  </form>
 </div> 
</div>