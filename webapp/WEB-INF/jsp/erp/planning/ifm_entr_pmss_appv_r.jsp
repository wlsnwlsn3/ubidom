<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            var gridDtl;
            var calMain;
            $(document).ready(function() {

                ubi.init(3,[1,4,8,9], "2E"); //출입허가조회

                o = ubi.getDataSet();

                //form//
                o.layout.cells("b").attachObject("bootContainer2");



                //up

				o.slayout.cells("a").showHeader();
				o.slayout.cells("a").setText("결재내역");
                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //7 col
                gridMst.setHeader("작성일자,작성자,출입자 정보,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan" ,null,[]);
                gridMst.attachHeader("#rspan,#rspan,성명,직위,소속,시작일자,종료일자,기간,신청사유" ,[]);
                
                gridMst.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridMst.setColAlign("center,center,center,center,center,center,center,center,center");
                gridMst.setColTypes("dhxCalendar,ed,ed,ed,ed,dhxCalendar,dhxCalendar,dhxCalendar,ed");
                gridMst.init();

                //down
  				o.slayout.cells("b").showHeader();
				o.slayout.cells("b").setText("출입지역신청");

                gridDtl = o.slayout.cells("b").attachGrid();
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/"); //9col
                gridDtl.setHeader("등급,지역,허가,지역,허가,지역,허가,지역,허가", null, []);
                gridDtl.setInitWidths("100,100,100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,center,center,center,center");
                gridDtl.setColTypes("ron,ed,ra,ed,ra,ed,ra,ed,ra");
                gridDtl.setColSorting("str,str,str,str,str,str,str,str,str,str,str,str");
                gridDtl.init();

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
        <style>
 .calicon{
width: 27px;
height: 27px;
margin-top: 1px;
}
        </style>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;">
        </div>
        <div id="bootContainer2">
            <form class="form-horizontal" style="padding-top: 10px; padding-left: 5px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
					<label class=" col-sm-2 col-md-2 control-label" for="textinput">
						기간 </label>

					<div class="col-sm-6 col-md-6">
						<div class="col-sm-4 col-md-4">
							<div class="input-group date" id="date1">
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
						</div>
						<label class="col-sm-1 col-md-1 control-label" for="textinput"
							style="margin-right: 15px;">~</label>
						<div class="col-sm-4 col-md-4">
							<div class="input-group date" id="date2">
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
                </div>

                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 작성자 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="appvName" id="appvName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                            <div class="col-sm-2 col-md-2">
                                 <div class="radio_group">
							<div class="col-xs-4 col-sm-4 col-md-4">
								<label class="radio-inline"> <input type="radio"
									name="gbn" value="1" checked="checked">전체
								</label>
							</div>
							<div class="col-xs-4 col-sm-4 col-md-4">
								<label class="radio-inline"> <input type="radio"
									name="gbn" value="2">미결
								</label>
							</div>
						</div>
                            </div>
                        </div>
                    </div>
                </div>
                
               
            </form>
        </div>