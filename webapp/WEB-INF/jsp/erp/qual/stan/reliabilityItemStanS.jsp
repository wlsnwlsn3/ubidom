<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
var layout,toolbar,subLayout;
var gridMain;
$(document).ready(function(){
	Ubi.setContainer(1,[1,2,3,4,5,6],"1C"); 
	//신뢰성항목기준정보등록
	layout = Ubi.getLayout();
    toolbar = Ubi.getToolbar();
    subLayout = Ubi.getSubLayout();
    
	layout.cells("b").attachObject("bootContainer");
	
	gridMain = subLayout.cells("a").attachGrid();
	gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
	gridMain.setHeader("No,종류,항목,#cspan,세부내역,코드",null,
			          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			           "text-align:center;","text-align:center;"]);
	gridMain.attachHeader("#rspan,#rspan,한글,영문,#rspan,#rspan",
			             ["text-align:center;","text-align:center;","text-align:center;","text-align:center;",
			              "text-align:center;","text-align:center;"]);
	gridMain.setInitWidths("100,100,100,100,100,100");
	gridMain.setColAlign("center,center,center,left,center,left");
	gridMain.setColTypes("ron,coro,coro,ed,coro,ro");
	gridMain.setColSorting("int,na,na,str,na,str");
	gridMain.init();	

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