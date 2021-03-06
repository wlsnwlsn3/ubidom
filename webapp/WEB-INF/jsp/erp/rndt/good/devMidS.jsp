<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMst;
            var gridDtl;
            var calMain;
            var tbar;
            $(document).ready(function() {

                    Ubi.setContainer(4, [1, 2, 3, 4], "1C"); //개발중간평가등록

                    layout = Ubi.getLayout();
                    toolbar = Ubi.getToolbar();
                    subLayout = Ubi.getSubLayout();

                    //form//
                    layout.cells("b").attachObject("bootContainer2");
                    layout.cells("b").setHeight(180);

                    //tabbar//	
                    var devPlanTabbar = subLayout.cells("a").attachTabbar({
                        tabs: [{
                            id: "a1",
                            text: "상황변화",
                            active: true
                        }, {
                            id: "a2",
                            text: "주요문제점"
                        }, {
                            id: "a3",
                            text: "해결방안"
                        }, {
                            id: "a4",
                            text: "지원요청사항"
                        }, {
                            id: "a5",
                            text: "개발일정변경"
                        }, {
                            id: "a6",
                            text: "인원계획변경"
                        }, {
                            id: "a7",
                            text: "개발목표(수준)변경"
                        }, {
                            id: "a8",
                            text: "투자계획변경"
                        }, ]

                    });

                    var tab1 = devPlanTabbar.tabs("a1").attachGrid();
                    var tab2 = devPlanTabbar.tabs("a2").attachGrid();
                    var tab3 = devPlanTabbar.tabs("a3").attachGrid();
                    var tab4 = devPlanTabbar.tabs("a4").attachGrid();
                    var tab5 = devPlanTabbar.tabs("a5").attachGrid();
                    var tab6 = devPlanTabbar.tabs("a6").attachGrid();
                    var tab7 = devPlanTabbar.tabs("a7").attachLayout("2E");
                    var tab8 = devPlanTabbar.tabs("a8").attachGrid();

                    //1번탭
                    tab1.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab1.setHeader("No,주요항목,내  용", null, ["text-align:center;", "text-align:center;", "text-align:center;"]);
                    tab1.setInitWidths("50,100,656");
                    tab1.setColAlign("left,center,left");
                    tab1.setColTypes("ro,coro,ed");
                    tab1.setColSorting("str,str,str");
                    tab1.init();

                    //2번탭
                    tab2.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab2.setHeader("No, 내  용", null, ["text-align:center;", "text-align:center;"]);
                    tab2.setInitWidths("50,756");
                    tab2.setColAlign("left,left");
                    tab2.setColTypes("ro,ed");
                    tab2.setColSorting("str,str");
                    tab2.init();

                    //3번탭
                    tab3.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab3.setHeader("No, 내  용", null, ["text-align:center;", "text-align:center;"]);
                    tab3.setInitWidths("50,756");
                    tab3.setColAlign("left,left");
                    tab3.setColTypes("ro,ed");
                    tab3.setColSorting("str,str");
                    tab3.init();

                    //4번탭
                    tab4.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab4.setHeader("No, 내  용", null, ["text-align:center;", "text-align:center;"]);
                    tab4.setInitWidths("50,756");
                    tab4.setColAlign("left,left");
                    tab4.setColTypes("ro,ed");
                    tab4.setColSorting("str,str");
                    tab4.init();

                    //5번탭
                    tab5.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab5.setHeader("계획일정,#cspan,#cspan,주관부서,#cspan,변경일정,#cspan,주관부서,#cspan,관련부서선행Role(제조/생산/마케팅),OutSourcing 계획", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                    tab5.attachHeader("구분,일자,일수,주,부,일자,일수,주,부,#rspan,#rspan", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                    tab5.setInitWidths("100,100,100,100,100,100,100,100,100,300,300");
                    tab5.setColAlign("center,center,center,center,center,center,center,center,center,left,left");
                    tab5.setColTypes("coro,ed,ed,ed,ed,ed,ed,ed,ed,ed,ed");
                    tab5.setColSorting("str,str,str,str,str,str,str,str,str,str,str");
                    tab5.init();

                    //6번탭
                    tab6.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab6.setHeader("구분,계획,#cspan,#cspan,변경,#cspan,#cspan,비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                    tab6.attachHeader("#rspan,당해년도,#cspan,Total(MM),당해년도,#cspan,Total(MM),#rspan", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                    tab6.attachHeader("#rspan,인원,MM,#rspan,인원,MM,#rspan,#rspan", ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", ]);
                    tab6.attachFooter("합계, , , , , , , ,", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
                    tab6.setInitWidths("100,75,75,150,75,75,150,300");
                    tab6.setColAlign("center,center,center,center,center,center,center,left");
                    tab6.setColTypes("coro,ed,ed,ed,ed,ed,ed,txt");
                    tab6.setColSorting("str,str,str,str,str,str,str,str");
                    tab6.init();

                    //7번탭
                    tab7.cells("a").setHeight(200);
                    tab7.cells("a").setText("1.수준");
                    tab7.cells("b").setText("2. 개발목표 주요 Spec 및 차별화 Point");
                    var tab7Grid1 = tab7.cells("a").attachGrid();
                    tab7Grid1.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab7Grid1.setHeader("구분, 계획,변경", null, ["text-align:center;", "text-align:center;", "text-align:center;"]);
                    tab7Grid1.setInitWidths("100,300,300");
                    tab7Grid1.setColAlign("left,left,left");
                    tab7Grid1.setColTypes("ro,ed,ed");
                    tab7Grid1.setColSorting("str,str,str");
                    tab7Grid1.init();
                    var tab7Grid = tab7.cells("b").attachGrid();
                    tab7Grid.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab7Grid.setHeader("No, 주요 Spec 및 차별화 Point", null, ["text-align:center;", "text-align:center;"]);
                    tab7Grid.setInitWidths("50,800");
                    tab7Grid.setColAlign("left,left");
                    tab7Grid.setColTypes("ro,ed");
                    tab7Grid.setColSorting("str,str");
                    tab7Grid.init();

                    //8번탭
                    tab8.setImagePath("/component/dhtmlxGrid/imgs/");
                    tab8.setHeader("구분,당해년도(천원),Total(천원),비고", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                    tab8.setInitWidths("100,100,100,506");
                    tab8.setColAlign("center,right,right,center,left");
                    tab8.setColTypes("coro,price,price,txt");
                    tab8.setColSorting("str,str,str,str");
                    tab8.attachFooter("계,0,0,", ["text-align:center;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;", "text-align:right;font-weight:bold;"]);
                    tab8.init();
                    //tab end

                    //setDate//
                    calMain = new dhtmlXCalendarObject([{
                        input: "stDate",
                        button: "calpicker1"
                    }]);
                    calMain.loadUserLanguage("ko");
                    calMain.hideTime();
                    var t = dateformat(new Date());
                    byId("stDate").value = t;

                    for (var i = 1; i < 9; i++) {
                        var a = tbar
                        if (i < 5 || i == 7) {
                            subToolbar(a + i, devPlanTabbar.tabs("a" + i), [3, 4, 5, 6]);
                        } else {
                            subToolbar(a + i, devPlanTabbar.tabs("a" + i), [3, 4]);
                        }
                    }

                })
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
                                <div class="col-sm-offset-4 col-md-offset-4 col-sm-3 col-md-3">
                                    <input type="button" class="btn btn-default btn-xs form-control" id="btnReportPrint" name="btnReportPrint" value="개발중간평가보고서인쇄">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 보고자 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="rptName" id="rptName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 개발번호 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="devNo" id="devNo" type="text" value="" placeholder="" class="form-control input-xs" ondblclick="gfn_load_popup('개발번호','common/devPlanPOP')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 과제명 </label>
                                <div class="col-sm-10 col-md-10">
                                    <input name="prjtName" id="prjtName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                    보고자의견 </label>
                                <div class="col-sm-8 col-md-8">
                                    <input type="radio" name="repoterOpn" value="1" checked="checked">현행계속
                                    <input type="radio" name="repoterOpn" value="2">Drop
                                    <input type="radio" name="repoterOpn" value="3">계획변경필요(수정계획서작성)
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>