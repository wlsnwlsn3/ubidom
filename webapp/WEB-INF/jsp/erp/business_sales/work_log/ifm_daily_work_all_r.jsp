<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
        var layout, toolbar, subLayout;
        var gridMain;
        var calMain;
        $(document).ready(function() {

            Ubi.setContainer(4, [1, 8, 9], "1C"); //업무일지조회(전체)

            layout = Ubi.getLayout();
            toolbar = Ubi.getToolbar();
            subLayout = Ubi.getSubLayout();

            //form//
            layout.cells("b").attachObject("bootContainer2");

                //grid	page19
/*                 gridMain = o.slayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //7
                gridMain.setHeader("No,담당,일자,종류,고객,내용,첨부", null, ["text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;", "text-align:center;vertical-align:middle;"]);
                gridMain.setInitWidths("50,100,100,100,150,400,50");
                gridMain.setColAlign("center,center,center,center,left,left,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str");
                gridMain.init(); */
                //grid	page20
                gridMain = subLayout.cells("a").attachGrid();
                gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9
                gridMain.setHeader("방문,유선,불량분석,견적가격조정,Test진행,기술지원,자료작성,컴프레인,계");
                gridMain.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridMain.setColAlign("center,center,center,center,center,center,center,center,center");
                gridMain.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
                gridMain.setColSorting("str,str,str,str,str,str,str,str,str");
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
            })
        </script>

        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>
        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						기간 </label>

					<div class="col-sm-6 col-md-6">
						<div class="col-sm-4 col-md-4">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="stDate"
										id="stDate" value="">
								</div>
								<div class="col-sm-2 col-md-2">
									<span> <img id="calpicker1" class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
										onclick="setSens(1,'edDate', 'max')">
									</span>
								</div>
						</div>
						<label class="col-sm-1 col-md-1 control-label" for="textinput"
							style="margin-right: 15px;">~</label>
						<div class="col-sm-4 col-md-4">
								<div class="col-sm-10 col-md-10">
									<input type="text" class="form-control input-xs" name="edDate"
										id="edDate" value="">
								</div>
								<div class="col-sm-2 col-md-2">
									<span> <img id="calpicker2" class="calicon"
										src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0"
										onclick="setSens(1,'stDate', 'min')">
									</span>
								</div>
						</div>
					</div>

				</div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 담당 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="empNo" id="empNo" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 고객 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="custName" id="custName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-7 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 종류 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>전체</option>
                                    <option>A</option>
                                    <option>B</option>
                                    <option>C</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>
        </div>