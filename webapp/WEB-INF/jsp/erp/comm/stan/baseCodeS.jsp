<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMst, gridDtl;
var gridMstCode;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"2U");
	//제코드등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout(); 
	
	layout.cells("b").attachObject("bootContainer");//attach search Condition div
	
	//좌측 그리드 config
	subLayout.cells("a").setWidth(250);
	gridMst = new dxGrid(subLayout.cells("a"), false);
	gridMst.addHeader({name:"코드", colId:"code", width:"30", align:"center",type:"ed"});
	gridMst.addHeader({name:"코드명", colId:"codeName", width:"70", align:"left",type:"ed"});
	gridMst.setColSort("str");
	gridMst.setUserData("","pk","code");
	gridMst.init();

	
	//우측 그리드 config
	gridDtl = new dxGrid(subLayout.cells("b"), false);
	/* gridDtl.addHeader({name:"No", colId:"rowNo", width:"10", type:"ro"}); */
	gridDtl.addHeader({name:"내부코드", colId:"interCode", width:"5", align:"center",type:"ed"});
	gridDtl.addHeader({name:"내부코드명", colId:"interName", width:"10", type:"ed"});
	gridDtl.addHeader({name:"변수", colId:"addVar", width:"5", align:"center",type:"ed"});
	gridDtl.addHeader({name:"비고", colId:"descRmk", width:"5", align:"center",type:"ed"});
	gridDtl.setColSort("str");
	gridDtl.setUserData("","pk","");
	gridDtl.init();	
	
	fn_loadGridMst(1);
	fn_gridMstEdit("off");

 	gridDtl.attachEvent("onRowSelect", function(id,ind){
		gridDtl.editCell();
  	});
});
//doc Ready End
/* function getFirstParam(){
	var FirstP = gridMst.getCellValue(gridMst.getRowId(0),0);
	fn_loadGridDtl(FirstP);
} */
	//그리드 onRowSelect edit
function fn_gridMstEdit(flag){
	gridMst.attachEvent("onRowSelect", function(id,ind){
	var codeMain = gridMst.setCells2(gridMst.getSelectedRowIndex(gridMst.getSelectedRowId()),0).getValue();
	if(flag=="on"){
		gridMst.editCell();
	}else if(flag=="off"){
		gridMst.editStop();
	}
		fn_loadGridDtl(codeMain);
  	});
}
//btn function Start
function fn_search(){
	fn_loadGridMst(0);
	fn_gridMstEdit("off");
}
//신규 버튼 동작
function fn_new(){
	var totalColNum = gridMst.getColumnCount();
  	var data = new Array(totalColNum);
  	var totalRowNum = gridMst.getRowsNum()-1;
    gridMst.addRow(data);
    gridMst.selectRow(totalRowNum);
	fn_gridMstEdit("on");
}
//저장 버튼 동작
function fn_save(){
	var jsonStr = gridMst.getJsonUpdated2();
    if (jsonStr == null || jsonStr.length <= 0) return;        		
        $("#jsonData").val(jsonStr);                      
        $.ajax({
           url : "/erp/rndt/baseCodeS/codeSave",
           type : "POST",
           data : $("#hiddenform").serialize(),
           async : true,
           success : function(data) {
           MsgManager.alertMsg("INF001");
           gridMst.clearAll();
           fn_loadGridMst(0);
           fn_gridMstEdit("off");
            }
       });
		var codeMain = gridMst.setCells2(gridMst.getSelectedRowIndex(gridMst.getSelectedRowId()),0).getValue();
		var jsonStr2 = gridDtl.getJsonUpdated2();
	    if (jsonStr2 == null || jsonStr2.length <= 0) return;        		
	    if (codeMain == null || codeMain.length <= 0) return;        		
        $("#jsonData2").val(jsonStr2);
        $("#gridMstCode").val(codeMain);
        console.log(jsonStr2);
        $.ajax({
           url : "/erp/rndt/baseCodeS/codeSaveDtl",
           type : "POST",
           data : $("#hiddenform").serialize(),
           async : true,
           success : function(data) {
           MsgManager.alertMsg("INF001");
           gridDtl.clearAll()
    	   fn_loadGridDtl(codeMain);
    	   gridMst.selectRow(gridMst.getSelectedRowIndex(gridMst.getSelectedRowId()));
           
            }
       });
}
//삭제 버튼 동작
function fn_remove(){
    var rodId = gridMst.getSelectedRowId();
    var rodIdx = gridMst.getSelectedRowIndex();
    if(gridMst.isDelRows(rodId)) {
       if(MsgManager.confirmMsg("INF002")) {
     	  if(gridMst.chkUnsavedRow(rodIdx,rodId)) {
     		  return;
          }else{
     		   var jsonStr = gridMst.getJsonRowDel(rodId);
               if (jsonStr == null || jsonStr.length <= 0) return;
               $("#jsonData").val(jsonStr);
                   $.ajax({
                    url : "/erp/rndt/baseCodeS/codeSave",
                    type : "POST",
                    data : $("#hiddenform").serialize(),
                    async : true,
                    success : function(data) {
                    MsgManager.alertMsg("INF003");
        			fn_loadGridMst(0);
        			fn_gridDtlDel();
                   }
               });
    	   }
        } else {
        	 MsgManager.alertMsg("WRN004");
          } 
     }else {
         MsgManager.alertMsg("WRN002");
      }
}
//한줄삽입 버튼 동작
function fn_add(){
	var totalColNum = gridDtl.getColumnCount();
  	var data = new Array(totalColNum);
  	gridDtl.addRow(data);
  	var totalRowNum = gridDtl.getRowsNum()-1;
  	gridDtl.selectRow(totalRowNum);
}
//한줄삭제 버튼 동작
function fn_delete(){
	fn_gridDtlDel();
}
//좌측 그리드 로드
function fn_loadGridMst(flag){
	var inputParams={}
	inputParams.codeName = $("#baseName").val();
	inputParams.code = $("#baseCode").val();
	var callBackGbn;
	if(flag == 1){
		callBackGbn = fn_First_loadGridMst;
	}else if(flag == 0){
		callBackGbn = fn_loadGridMstCallBack;
	}
	gfn_callAjaxForGrid(gridMst,inputParams,"/erp/rndt/baseCodeS/baseCodeMstSel",subLayout.cells("a"),callBackGbn);
	gridDtl.clearAll();
}
//우측 그리드 로드
function fn_loadGridDtl(code){
	var param = "code=" + code;
    gfn_callAjaxForGrid(gridDtl,param,"/erp/rndt/baseCodeS/baseCodeDtlSel",subLayout.cells("b"),fn_loadGridDtlCallBack);
}
//우측 그리드 삭제
function fn_gridDtlDel(){
	var rodId = gridDtl.getSelectedRowId();
    var rodIdx = gridDtl.getSelectedRowIndex();
    if(gridDtl.isDelRows(rodId)) {
       if(MsgManager.confirmMsg("INF002")) {
     	  if(gridDtl.chkUnsavedRow(rodIdx,rodId)) {
     		  return
          }else{
     		  var jsonStr = gridDtl.getJsonRowDel(rodId);
  	 		  var codeMain = gridMst.setCells2(gridMst.getSelectedRowIndex(gridMst.getSelectedRowId()),0).getValue();
  		   	  if (codeMain == null || codeMain.length <= 0) return;        		
              if (jsonStr == null || jsonStr.length <= 0) return;
  	           $("#gridMstCode").val(codeMain);
               $("#jsonData2").val(jsonStr);
               console.log('param',$("#hiddenform").serialize());
                   $.ajax({
                    url : "/erp/rndt/baseCodeS/codeSaveDtl",
                    type : "POST",
                    data : $("#hiddenform").serialize(),
                    async : true,
                    success : function(data) {
                    MsgManager.alertMsg("INF003");
                    gridDtl.clearAll()
             		fn_loadGridDtl(codeMain);
                   }
               });
    	   }
        } else {
        	 MsgManager.alertMsg("WRN004");
          } 
     }else {
         MsgManager.alertMsg("WRN002");
      }
}
//좌측 그리드 콜백함수
function fn_First_loadGridMst(data){
	fn_loadGridDtl(data[0].code);
}
function fn_loadGridMstCallBack(data){
}
//우측 그리드 콜백함수
function fn_loadGridDtlCallBack(data){
}
</script>
<form id="hiddenform" name="hiddenform" method="post">
    <input type="hidden" id="jsonData" name="jsonData" />
    <input type="hidden" id="jsonData2" name="jsonData2" />
    <input type="hidden" id="gridMstCode" name="gridMstCode" />
</form>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-bottom:5px;margin:0px;">   
      <div class="row">
		<div class="form-group form-group-sm">
		  <div class="col-sm-8 col-md-8">
			  <div class="col-sm-6 col-md-6">
			   <label class="col-sm-4 col-md-4 control-label" for="textinput"> 
					코드
			   </label>
				<div class="col-sm-2 col-md-2">
				 <input type="text" name="baseCode" id="baseCode" value="" placeholder="" class="form-control input-xs">
				</div>
				<div class="col-sm-3 col-md-3">
				<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
				 <input type="text" name="baseName" id="baseName" value="" placeholder="" class="form-control input-xs">
				</div>
				</div>
			  </div>
		  </div>
	    </div>
      </div>     
  </form>
 </div> 
</div>