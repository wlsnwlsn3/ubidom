<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;   
var calMain;
$(document).ready(function(){
	Ubi.setContainer(2,[1,2,3,4,5,6],"1C");
	//업무일지등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("NO,고객,종류,내용,첨부",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100");
	gridMain.setColAlign("center,left,center,left,center");
	gridMain.setColTypes("ron,ro,coro,ed,ed");
	gridMain.setColSorting("int,str,na,str,na");	
	gridMain.init();	
	gridMain.attachEvent("onRowDblClicked",doOnRowDblClicked);
	
	calMain = new dhtmlXCalendarObject([{input:"stDate",button:"calpicker"}]); 
	calMain.loadUserLanguage("ko");
	calMain.hideTime();	   
	var t = dateformat(new Date());
	byId("stDate").value = t;
	
	 toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				gridMain.addRow(gridMain.getUID(),"1,유비덤,방문상담,추가생산,",1);
			}
		});
    
	 function doOnRowDblClicked(rowId,colId){
			if(colId==1){
			gfn_load_popup('고객코드','common/customPOP');
			}
		}
 })
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
                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 
                   담당 
                </label>
                <div class="col-sm-1 col-md-1">
                    <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                </div>
                <div class="col-sm-2 col-md-2">
                     <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                         <input name="empName" id="empName" type="text" value="" placeholder="" class="form-control input-xs">
                     </div>
                </div>
              </div>
           </div>
      </div>      
  </form>
 </div> 
</div>