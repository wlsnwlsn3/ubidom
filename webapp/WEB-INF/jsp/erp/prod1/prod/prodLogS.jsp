<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;   
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"2E");
	//생산일지등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");

	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,지시일자,품목코드,품명,포장,단위,납기일자,재고,안전재고,수주수량,"+
			          "지시수량,선택",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100");
	gridMst.setColAlign("center,center,left,left,right,left,center,right,right,right,"+
			            "right,center");
	gridMst.setColTypes("ron,ro,ro,ro,ro,ro,ro,ron,ron,ron,"+
			            "ron,ra");
	gridMst.setColSorting("int,date,str,str,str,Str,date,int,int,int,"+
			              "int,na");
	gridMst.init();	
	gridMst.attachEvent("onCheck",doOnCheck);
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("생산지시내역");
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,품목코드,품명,포장,단위,지시수량,정량,#cspan,#cspan,#cspan,"+
			          "#cspan,#cspan,함침,#cspan,#cspan,#cspan,#cspan,조립,#cspan,크램핑,"+
		 	          "#cspan,#cspan,세척,#cspan,무게선별,#cspan,#cspan,실링,#cspan",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,양품수량,불량수량,작업자,약품보관,"+
			             "#cspan,설비가동,양품수량,불량수량,작업자,약품보관,#cspan,양품수량,불량수량,양품수량,"+
			             "불량수량,설비가동,양품수량,불량수량,양품수량,불량수량,설비가동,양품수량,불량수량",
			            ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,사용전,"+
			             "사용후,#rspan,#rspan,#rspan,#rspan,사용전,사용후,#rspan,#rspan,#rspan,"+
			             "#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,#rspan",
		 	            ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			             "text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("70,70,70,70,70,70,70,70,70,70,"+
			              "70,70,70,70,70,70,70,70,70,70,"+
			              "70,70,70,70,70,70,70,70,70");
	gridDtl.setColAlign("center,left,left,left,left,right,right,right,left,right,"+
			            "right,center,right,right,left,right,right,right,right,right,"+
			            "right,center,right,right,right,right,center,right,right");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,ron,edn,ron,ron,ron,"+
			            "ron,ro,edn,ron,ron,ron,ron,edn,ron,edn,"+
			            "ron,ro,edn,ron,edn,ron,ro,edn,ron");
	gridDtl.setColSorting("int,str,str,str,str,int,int,int,int,int,"+
			              "int,na,int,int,int,int,int,int,int,int,"+
			              "int,na,int,int,int,int,ch,int,int");
	gridDtl.init();	
	gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("생산일지내역");

	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
	
	function doOnCheck(rowId,colId){
		if(colId==11){
			gridDtl.addRow(gridDtl.getUID(),"1,chkh-250,chkh-250,10,EA,2700,,,,,,,,,,,,,,,,,,,,,,,",1);
		}
	}
	
	toolbar.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			gridMst.addRow(gridMst.getUID(),"1,2014-04-20,chkh-250,chkj-250,10,EA,2014-04-20,3000,3600,2700,3000,",1);
		}
	});
	
	function doOnRowDblClicked(rowId,colId){
		if(colId==7 || colId==13 || colId==18 || colId==20 || colId==23 || colId==25 || colId==28){
		gfn_load_popup('불량유형등록창','prod1/poorTypeSPOP');
		}
		if(colId==8 || colId==14){
			gfn_load_popup('작업자 등록창','prod1/workerSPOP');
		}
		if(colId==11 || colId==21 || colId==26){
			gfn_big_load_popup(503,600,'설비가동 등록창','prod1/equiSPOP');
		}
	}
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
</div>