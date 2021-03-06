<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var gridDtl, layout, toolbar, subLayout;
var gridMst,girdDtl;
var calMain;
$( document ).ready(function() {
	
	Ubi.setContainer(2,[1,2,3,4,5,6],"2E"); //접수,배정 등록
	
    layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
	
	//form//
	layout.cells("b").attachObject("bootContainer2");
	

	
	//up
	gridMst = subLayout.cells("a").attachGrid();
	gridMst.setImagePath("/component/dhtmlxGrid/imgs/");      //10 col 
	gridMst.setHeader("No, 관리번호,납기일자,고객,요청자,품목코드,품명,사용설비,상태,선택", null, 
					["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",]);
	gridMst.setInitWidths("100,100,100,100,100,100,100,100,100,100");       
	gridMst.setColAlign("center,left,center,left,center,left,left,left,left,center");     
	gridMst.setColTypes("ro,ed,ed,ed,ed,ed,ed,ed,ed,ra"); 
	gridMst.setColSorting("str,str,str,str,str,str,str,str,str,na");
	gridMst.init();
	
	//down
	gridDtl = subLayout.cells("b").attachGrid();
	gridDtl.setImagePath("/component/dhtmlxGrid/imgs/");      //11col
	gridDtl.setHeader("No, 관리번호,고객,요청자,품목코드,품명,사용설비,상태,담당자,납기일자,완료일자", null,
						["text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;","text-align:center;vertical-align:middle;"]);
	gridDtl.setInitWidths("50,100,200,100,150,150,200,200,100,100,100");       
	gridDtl.setColAlign("center,center,left,center,left,left,left,left,center,center,center");     
	gridDtl.setColTypes("ro,ed,ed,ed,ed,ed,ed,ed,ro,ed,ed"); 
	gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
	gridDtl.init();
	
	//calRangeDate
	 calMain = new dhtmlXCalendarObject([{
         input: "stDate",
         button: "calpicker1"
     }]);
     calMain.loadUserLanguage("ko");
     calMain.hideTime();
     var t = dateformat(new Date());
     byId("stDate").value = t;
		
     //항목삽입
     toolbar.attachEvent("onClick", function(id) {
			if(id == "btn5"){
				fn_insert();
			}
		});
     //popUp
     gridDtl.attachEvent("onRowDblClicked",doOnRowDblClicked);
     function doOnRowDblClicked(rowId,colId){
			if(colId==8){
				gfn_load_popup('사원번호','common/empPOP');
			}
		} 
		
		//editcell
     gridDtl.attachEvent("onRowSelect", function(id,ind){
     	gridDtl.editCell();
     	});
     gridMst.attachEvent("onRowSelect", function(id,ind){
     	gridMst.editCell();
     	});
     	
     gridMst.attachEvent("onCheck",doOnCheck);
     function doOnCheck(rowId,colId){
		if(colId==9){
			gridDtl.addRow(gridDtl.getUID(),"1,1111,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST",1);
		}
	}
 })
     
 function fn_insert() {
 		gridMst.addRow(gridMst.getUID(),"1,1111,2015-04-27,TEST,TEST,1111,TEST,TEST,TEST,",1);
	}


</script>
<style>


</style>
<div id="container"
	style="position: relative; width: 100%; height: 100%;">
	</div>
<div id="bootContainer2">
<div class="container">

	<form class="form-horizontal"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;"
		id="frmSearch">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 일자 </label>
					<div class="col-sm-2 col-md-2">
							
								<div class="col-sm-10 col-md-10">
									<input name="stDate" id="stDate" type="text" value=""
										placeholder="" class="form-control input-xs">
								</div>
								<div class="col-sm-2 col-md-2">
									<input type="button" id="calpicker1" class="calicon form-control">
								</div>
							
						</div>
					<div class="col-sm-1 col-md-1">
						<div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
						<input name="seqNo" id="seqNo" type="text"
									value="" placeholder="" class="form-control input-xs" disabled="disabled"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class=" col-sm-2 col-md-2 control-label"
						for="textinput"> 등록자 </label>
					<div class="col-sm-2 col-md-2">
						<input name="regName" id="regName" type="text"
									value="" placeholder="" class="form-control input-xs">
					</div></div>
			</div>
		</div>
	</form>
	</div>
</div>