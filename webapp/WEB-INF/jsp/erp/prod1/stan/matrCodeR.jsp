<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var layout,toolbar,subLayout;
	var gridMain;
	$(document).ready(function() {
		Ubi.setContainer(1,[1,8,9],"1C");
	    //자재코드조회
	    layout = Ubi.getLayout();
        toolbar = Ubi.getToolbar();
        subLayout = Ubi.getSubLayout(); 
					
	    layout.cells("b").attachObject("bootContainer");

		gridMain = subLayout.cells("a").attachGrid();
		gridMain.setImagePath("/component/dhtmlxGrid/imgs/");
		gridMain.setHeader("구분,자재코드,자재명,규격,단위,포장단위,발주단위,입고단위", null,
				          ["text-align:center;","text-align:center;","text-align:center;","text-align:center;","text-align:center;",
				           "text-align:center;","text-align:center;","text-align:center;"]);
		gridMain.setInitWidths("100,100,100,100,100,100,100,100");
		gridMain.setColAlign("center,left,left,left,left,left,left,left");
		gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro");
		gridMain.setColSorting("str,str,str,str,str,str,str,str");
		gridMain.init();
})
</script>
<div id="container" style="position: relative; width: 100%; height: 100%;"></div>
<div id="bootContainer" style="position: relative;">
 <div class="container">
	<form class="form-horizontal" name="frmSearch" id="frmSearch" style="padding-top: 10px;padding-bottom: 5px; margin: 0px;">
		<div class="row">
			<div class="form-group form-group-sm">
				<div class="col-sm-8 col-md-8">
					<label class="col-sm-2 col-md-2 control-label" for="textinput">
						자재코드
					 </label>
					<div class="col-sm-1 col-md-1">
						<input name="mtrlCode" id="mtrlCode" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<div class="col-sm-2 col-md-2" style="margin-left: 10px;">
						<input name="mtrlName" id="mtrlName" type="text" value="" placeholder="" class="form-control input-xs">
					</div>
					<label class="col-sm-2 col-md-2 control-label" for="textinput">
					 구분 
					 </label>
					<div class="col-sm-2 col-md-2">
						<select class="form-control input-xs">
							<option>자재</option>
							<option>자재2</option>
							<option>자재3</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>
  </div>	
</div>