<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document).ready(function() {

            	Ubi.setContainer(4, [1, 2, 3, 4,5,6], "1C"); //운송장 등록

             	layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();
                //form//
                layout.cells("b").attachObject("bootContainer2");
                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); 
                gridMain.setHeader("No,받는사람,주소,금액,인쇄");
                gridMain.setInitWidths("100,100,100,100,100");
                gridMain.setColAlign("center,center,left,right,center");
                gridMain.setColTypes("ron,ed,txt,edn,ch");
                gridMain.setColSorting("int,str,str,int,str");
                gridMain.init();

                //setDate//
                calStDate = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }]);
                calStDate.loadUserLanguage("ko");
                calStDate.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
            })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; ">
        </div>
        <div id="bootContainer2">
        <div class="container">
	<form class="form-horizontal" id="frmMain" name="frmMain"
		style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="stDate" id="stDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker1" class="calicon form-control">
                                </div>
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <div class="col-sm-offset-1 col-md-offset-1 col-sm-11 col-md-11">
                                    <input name="seqNo" id="seqNo" type="text" value="" placeholder="" class="form-control input-xs" disabled="disabled">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">담당</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">담당자</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-8 col-md-8">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">운송회사</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="" id="" type="text" value="" placeholder="" class="form-control input-xs"ondblclick="gfn_load_popup('운송회사','common/supplyCompCodePOP')">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>