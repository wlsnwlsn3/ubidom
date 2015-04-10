<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var o;
            var gridMst;
            $(document).ready(function() {

                ubi.init(1, [1, 2, 3, 4], "3L");
                o = ubi.getDataSet();
                

                o.layout.cells("b").attachObject("bootContainer");
               
                gridMst = o.slayout.cells("a").attachGrid();
                gridMst.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                gridMst.setHeader("장비코드, 장비명", null, []);
                gridMst.setInitWidths("100,100");
                gridMst.setColAlign("left,left");
                gridMst.setColTypes("ro,ro");
                gridMst.setColSorting("str,str");
                gridMst.init();
                
                gridDtl = o.slayout.cells("c").attachGrid();//col7
                gridDtl.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                gridDtl.setHeader("No,항목코드,주기,주기단위,교정기간,최초점검일", null, []);
                gridDtl.setInitWidths("100,100,100,100,100,100,100");
                gridDtl.setColAlign("center,center,center,center,center,center,center");
                gridDtl.setColTypes("ron,ed,ed,ed,edn,ed");
                gridDtl.setColSorting("int,str,str,str,str,str,str");
                gridDtl.init();

                o.slayout.cells("a").setWidth(202);

                o.slayout.cells("b").attachObject("bootContainer2");
                o.slayout.cells("b").setHeight(280);
                
                //date
                calMain = new dhtmlXCalendarObject([{
                    input: "prDate",
                    button: "calpicker1"
                }, {
                    input: "phDate",
                    button: "calpicker2"
                }, {
                    input: "exDate",
                    button: "calpicker3"
                }]);
                calMain.loadUserLanguage("ko");
                calMain.hideTime();
           		
                //toolbar
                subToolbar(o.slayout.cells("c"),[1,3,5,6]);
            })
                //set tool bar//
            var subToolbar = function(sublayout, btn_id_array) {

                var toolbar = sublayout.attachToolbar();

                /* var size = 18; */
                toolbar.clearAll();
                toolbar.setIconSize(18);
                toolbar.setIconsPath("/images/button/dhtmlx/");
                toolbar.loadStruct("/common/json/button.json", fn_onLoad);

                function fn_onLoad() {
                    var item_id_set_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

                    for (var i = 0; i < btn_id_array.length; i++) {
                        var index = item_id_set_arr.indexOf(btn_id_array[i]);
                        if (index > -1) {
                            item_id_set_arr.splice(index, 1);
                        }
                    }
                    for (var i = 0; i < item_id_set_arr.length; i++) {

                        toolbar.removeItem("btn" + item_id_set_arr[i]); // item
                        toolbar.removeItem("sep" + item_id_set_arr[i]); // seperator
                    }
                }
            }
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%; overflow: auto;"></div>
        <div id="bootContainer" style="position: relative; width: 100%; height: 100%; ">
            <form class="form-horizontal" id="frmSearch" name="frmSearch" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12 col-md-7">
                            <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                                교정장비
                            </label>
                            <div class="col-sm-2 col-md-2">
                                <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-offset-1 col-md-offset-1 col-sm-4 col-md-4">
                                <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="bootContainer2" style="position: relative; width: 100%; height: 100%; ">
            <form class="form-horizontal" id="frmMain" name="frmMain" style="padding-top:10px;padding-left:5px;padding-bottom:5px;margin:0px;">
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            장비코드
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            장비명
                        </label>
                        <div class="col-sm-6 col-md-6">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            규격
                        </label>
                        <div class="col-sm-6 col-md-6">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            용도
                        </label>
                        <div class="col-sm-6 col-md-6">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            제작처
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            구입처
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 제작일자 </label>
                        <div class="col-sm-2 col-md-2">

                            <div class="col-sm-9 col-md-11">
                                <input name="prDate" id="prDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <span>
						       <img id="calpicker1" style=" width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                            </div>
                        </div>
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 구입일자 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-9 col-md-11">
                                <input name="phDate" id="phDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <span>
						       <img id="calpicker2" style=" width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
						     </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            구입금액
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput"> 사용기한 </label>
                        <div class="col-sm-2 col-md-2">
                            <div class="col-sm-9 col-md-11">
                                <input name="exDate" id="exDate" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-1 col-md-1">
                                <span>
					       <img id="calpicker3" style=" width:27px;height:27px; " class="calicon" src="/component/dhtmlxCalendar/imgs/calendar.gif" border="0">
					     </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group form-group-sm">
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            전화번호
                        </label>
                        <div class="col-sm-2 col-md-2">
                            <input name=" " id=" " type="text" value="" placeholder="" class="form-control input-xs">
                        </div>
                        <label class=" col-sm-2 col-md-2 control-label" for="textinput">
                            사용유무
                        </label>
                        <div class="col-sm-4 col-md-4">
                            <div class="col-sm-4 col-md-3">
                                <input type="radio" name="useGbn" id="dealGbn" value="거래">사용
                            </div>
                            <div class="col-sm-4 col-md-3">
                                <input type="radio" name="useGbn" id="dealGbn" value="거래중지">미사용
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>