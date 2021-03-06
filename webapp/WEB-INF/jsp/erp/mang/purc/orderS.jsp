<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(2, [1,2,3,4], "2E"); //발주등록

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //up

                subLayout.cells("a").showHeader();
                subLayout.cells("a").setText("발주내역");
                gridMst = subLayout.cells("a").attachGrid();
                gridMst.setImagePath("/component/dhtmlxGrid/imgs/"); //7 col
                gridMst.setHeader("No,품의일자,품의자,의뢰부서,의뢰자,공급업체,결재금액,발주,인쇄");
                gridMst.attachFooter("&nbsp;,합계,#cspan,#cspan,#cspan,#cspan,0");
                gridMst.setInitWidths("50,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,left,left,left,left,right,center,center");
                gridMst.setColTypes("ron,dhxCalendar,ed,ed,ed,ed,edn,ra,ra");
                gridMst.setColSorting("str,date,str,str,str,str,int,str,str");
                gridMst.init();

                //down
                subLayout.cells("b").showHeader();
                subLayout.cells("b").setText("발주상세내역");

                gridDtl = subLayout.cells("b").attachGrid();
                gridDtl.setImagePath("/component/dhtmlxGrid/imgs/"); //9col
                gridDtl.setHeader("No,품명,규격,단위,수량,단가,금액,납기일자,납품장소", null, []);
                gridDtl.attachFooter("&nbsp;,합계,#cspan,#cspan,0,0,0");
                gridDtl.setInitWidths("50,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,right,right,right,center,center");
                gridDtl.setColTypes("ron,ed,ed,ed,edn,edn,edn,dhxCalendarA,ed");
                gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,");
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
                    if (id == "btn2") {
                        fn_insert();
                    }

                });
                //edit cell
                gridDtl.attachEvent("onRowSelect", function(id, ind) {
                    gridDtl.editCell();
                });
                gridMst.attachEvent("onRowSelect", function(id, ind) {
                    gridMst.editCell();
                });
                

                gridMst.attachEvent("onCheck", doOnCheck);

                function doOnCheck(rowId, colId) {
                    if (colId == 7) {
                        gridDtl.addRow(gridDtl.getUID(), "TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST,TEST", 1);
                    }
                }
            })

            function fn_insert() {
                gridMst.addRow(gridMst.getUID(), "TEST,TEST,TEST,TEST,TEST,TEST,TEST,,", 1);

            }
        </script>
        <style>
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 일자 </label>
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
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 등록자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="regName" id="regName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>