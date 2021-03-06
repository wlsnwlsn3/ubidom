<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var calMain;
$(document).ready(function(){
	Ubi.setContainer(4,[1,2,3,4,5,6],"2E");
	//설비점검등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");
	
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMst.setHeader("No,설비코드,설비명,점검항목코드,점검항목명,점검주기,최종점검일자,점검예정일자,점검일자,점검결과,"+
			          "점검자,비고,선택",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;"]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100,100");
	gridMst.setColAlign("center,left,left,left,left,left,center,center,center,left,"+
			            "left,left,center");
	gridMst.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,ro,ro,"+
			            "ro,ro,ra");
	gridMst.setColSorting("int,str,str,str,str,str,date,date,date,str,"+
			              "str,str,na");
	gridMst.init();	
	gridMst.attachEvent("onRowDblClicked",doOnRowDblClicked);
	subLayout.cells("a").showHeader();
	subLayout.cells("a").setText("점검대상");
	
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");
	gridDtl.setHeader("No,설비코드,설비명,점검항목코드,점검항목명,점검주기,최종점검일자,점검예정일자,점검일자,점검결과,"+
			          "점검자,비고",null,
			         ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			          "text-align:center;","text-align:center;"]);
	gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100,100,"+
			              "100,100");
	gridDtl.setColAlign("center,left,left,left,left,left,center,center,center,left,"+
			            "left,left");
	gridDtl.setColTypes("ron,ro,ro,ro,ro,ro,ro,ro,dhxCalendarA,dhxCalendarA,"+
			            "ed,ed");
	gridDtl.setColSorting("int,str,str,str,str,str,date,date,date,date,"+
			              "str,str");
	gridDtl.init();	
	subLayout.cells("b").showHeader();
	subLayout.cells("b").setText("점검결과");
	
	calMain = new dhtmlXCalendarObject([{input:"inspDate",button:"calpicker"},{input:"stDate",button:"calpicker1"},{input:"edDate",button:"calpicker2"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("inspDate").value = t;
	byId("stDate").value = t;
	byId("edDate").value = t;
		
	toolbar.attachEvent("onClick", function(id) {
		if(id == "btn5"){
			gridMst.addRow(gridMst.getUID(),"1,,,,,,,,,,,,",1);
		  }
	});
		
	function doOnRowDblClicked(rowId,colId){
		if(colId==10){
			gfn_load_popup('점검자','common/chargePOP');
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
			     점검일자 
			    </label>
			    <div class="col-sm-2 col-md-2">
                    <div class="col-sm-10 col-md-10">
                       <input name="inspDate" id="inspDate" type="text" value="" placeholder="" class="form-control input-xs">
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
				    점검기간 
				   </label>
				   <div class="col-sm-6 col-md-6">
                       <div class="col-sm-4 col-md-4">
                           <div class="col-sm-10 col-md-10">
                              <input type="text" class="form-control input-xs" name="stDate" id="stDate" value="">
                           </div>
                           <div class="col-sm-2 col-md-2">
                               <input type="button" id="calpicker1" class="calicon form-control" onclick="setSens(1,'edDate', 'max')"/>
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
			         설비코드
			        </label>
			        <div class="col-sm-2 col-md-2">
			          <input name="equiCode" id="equiCode" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_big_load_popup(403,400,'설비코드','prod1/equiCodePOP')">
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