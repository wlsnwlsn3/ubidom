<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calMain;
            $(document).ready(function() {

                Ubi.setContainer(3, [1, 8, 9], "1C"); //개발결과조회

                layout = Ubi.getLayout();
                toolbar = Ubi.getToolbar();
                subLayout = Ubi.getSubLayout();

                //form//
                layout.cells("b").attachObject("bootContainer2");

                //grid	
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/component/dhtmlxGrid/imgs/"); //13
                gridMain.setHeader("보고일자,보고자,출시예정일,적용제품,과제명,계획,#cspan,#cspan,#cspan,변경,#cspan,#cspan,#cspan", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,계발예산(천원),개발기간,#cspan,#cspan,개발예산(천원),개발기간,#cspan,#cspan", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                gridMain.attachHeader("#rspan,#rspan,#rspan,#rspan,#rspan,#rspan,시작,종료,일수,#rspan,시작,종료,일수", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                gridMain.attachFooter("개발예산 Total,#cspan,#cspan,#cspan,#cspan,0,#cspan,#cspan,#cspan,0,#cspan,#cspan,#cspan", ["text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", ]);



                gridMain.setInitWidths("100,100,100,100,200,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,left,right,center,center,center,right,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str,str");
                gridMain.init();

                //calRangeDate
                calMain = new dhtmlXCalendarObject([{
                    input: "stDate",
                    button: "calpicker1"
                }, {
                    input: "edDate",
                    button: "calpicker2"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
                var t = dateformat(new Date());
                byId("stDate").value = t;
                /* byId("edDate").value = t; */

            })


            function fn_search() {

            }

            function fn_insert() {

            }

            function fn_save() {

            }

            function fn_edit() {

            }

            function fn_delete() {

            }

            function fn_close() {

            }

            function fn_popup_anonymous() {

            }

            function fn_print() {

            }

            function fn_excel() {

            }
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    기간 </label>
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
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    보고자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="reptName" id="reptName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('보고자','common/empPOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제안자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="prpsName" id="prpsName" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('제안자','common/empPOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>