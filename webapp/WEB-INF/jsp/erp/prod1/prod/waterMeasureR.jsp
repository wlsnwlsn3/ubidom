<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(3,[1,8,9],"1C"); 
	//수분측정조회
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,측정일자,입고일자,제조Lot,위치,품목코드,품명,포장,단위,무게,"+
			           "수분율,부유무게,가동회수,기준중량,밀도",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			               "100,100,100,100,100");
	gridMain.setColAlign("center,center,center,right,left,left,left,left,left,right,"+
			             "right,right,right,right,right");
	gridMain.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ro,ron,"+
			             "ron,ron,ron,ron,ron");
	gridMain.setColSorting("int,date,date,int,str,str,str,str,str,int,"+
			               "int,int,int,int,int");
	gridMain.attachFooter(",합계,,,,,,,,,"+
			              "0,,0,0,0");
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
	<form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-bottom:5px;margin:0px;">  
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
			 품목코드
			 </label>
			<div class="col-sm-2 col-md-2">
			  <input name="itemCode" id="itemCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('품목코드','common/itemCodePOP')">
			</div>
		  </div>
	  </div>
	</div>  
	<div class="row">
	   <div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			<label class="col-sm-2 col-md-2 control-label" for="textinput">
			 분류기준
			 </label>
			 <div class="col-sm-3 col-md-3">
				<div class="col-sm-4 col-md-4">
					<input type="radio" name="gubn" id="gubn" value="일자" checked="checked">일자
				</div>
				<div class="col-sm-4 col-md-4">
					<input type="radio" name="gubn" id="gubn" value="품목">품목
				</div>
			</div>
		  </div>
	  </div>
	</div> 
  </form>
 </div> 
</div>