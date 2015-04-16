<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            var layout, toolbar, subLayout;
            var gridMain;
            var calStDate;
            $(document)
                .ready(
                    function() {

                        Ubi.setContainer(1, [1, 2, 3, 4], "2U"); //제품코드등록

                        layout = Ubi.getLayout();
                        toolbar = Ubi.getToolbar();
                        subLayout = Ubi.getSubLayout();

                        //form//
                        layout.cells("b").attachObject("bootContainer2");

                        //left grid//
                        gridMain = subLayout.cells("a").attachGrid();
                        gridMain.setImagePath("/Custonent/dhtmlxGrid/imgs/");
                        gridMain.setHeader("제품코드, 제품명", null, [
                            "text-align:center;", "text-align:center;"
                        ]);
                        gridMain.setInitWidths("100,150");
                        gridMain.setColAlign("left,left");
                        gridMain.setColTypes("ro,ro");
                        gridMain.setColSorting("str,str");
                        gridMain.init();

                        //right form//
                        subLayout.cells("b").attachObject("productCodeInfo");
                        subLayout.cells("a").setWidth("252");

                        //set date//
                        calStDate = new dhtmlXCalendarObject([{
                            input: "expirationDate",
                            button: "calpicker1"
                        }, {
                            input: "regDate",
                            button: "calpicker2"
                        }, {
                            input: "stopDate",
                            button: "calpicker3"
                        }]);
                        calStDate.loadUserLanguage("ko");
                        calStDate.hideTime();
                        var t = dateformat(new Date());
                        byId("regDate").value = t;

                    })
        </script>
        <div id="container" style="position: relative; width: 100%; height: 100%;">
        </div>

        <div id="bootContainer2">
            <div class="container">
                <form class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;" id="frmSearch">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-8 col-md-8">
                                <label class="col-sm-3 col-md-2 control-label" for="textinput">
                                    제품코드 </label>
                                <div class="col-sm-2 col-md-2">
                                    <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-md-offset-1 col-sm-offset-1 col-sm-4 col-md-4">
                                    <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div id="productCodeInfo">
            <form id="frmMain" class="form-horizontal" style="padding-top: 10px; padding-bottom: 5px; margin: 0px;">
                <div class="container">
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                제품코드 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="pCode" id="pCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 구분 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>제품</option>
                                    <option>제품2</option>
                                    <option>제품3</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                대분류 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>제품</option>
                                    <option>제품2</option>
                                    <option>제품3</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                중분류 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>제품</option>
                                    <option>제품2</option>
                                    <option>제품3</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">

                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                소분류 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>제품</option>
                                    <option>제품2</option>
                                    <option>제품3</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">

                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                일련번호 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="pSeqNo" id="pSeqNo" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">

                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                제품명 </label>
                            <div class="col-sm-6 col-md-6">
                                <input name="pName" id="pName" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                규격 </label>
                            <div class="col-sm-6 col-md-6">
                                <input name="pSzie" id="pSzie" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                단위 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="pMeasure" id="pMeasure" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 포장단위 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="packMeasure" id="packMeasure" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                유통기간구분 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>1.제조일자</option>
                                    <option>2.개봉일자</option>
                                </select>
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 유효기간 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="expirationDate" id="expirationDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                 <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker1" class="calicon form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                LEAD TIME </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="leadTime" id="leadTime" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 안전재고 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="safeStock" id="safeStock" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <div class="col-sm-2 col-md-2">
                                <input type="radio" name="sfStockGbn" value="1" checked="checked">변동
                                <input type="radio" name="sfStockGbn" value="2">고정
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                순중량</label>
                            <div class="col-sm-2 col-md-2">
                                <input name="netWeight" id="netWeight" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 총중량 </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="grossWeight" id="grossWeight" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                검사유무</label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>검사</option>
                                    <option>미검사</option>
                                </select>
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 보관온도 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-4 col-md-4">
                                    <input name="fromTemp" id="fromTemp" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <label class="col-sm-4 col-md-4" style="text-align: center; vertical-align: middle;">~</label>

                                <div class="col-sm-4 col-md-4">
                                    <input name="toTemp" id="toTemp" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                            </div>
                            <label class="col-sm-2 col-md-2" style="vertical-align: middle;">
                                ˚C </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                등록일자 </label>
                            <div class="col-sm-2 col-md-2">
                                <div class="col-sm-10 col-md-10">
                                    <input name="regDate" id="regDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker2" class="calicon form-control">
                                </div>
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용구분 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>사용</option>
                                    <option>미사용</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                HS CODE </label>
                            <div class="col-sm-2 col-md-2">
                                <input name="hsCode" id="hsCode" type="text" value="" placeholder="" class="form-control input-xs">
                            </div>
                            <label class="  col-sm-2 col-md-2 control-label" for="textinput"> 사용중지일자 </label>
                            <div class="col-sm-2 col-md-2">

                                <div class="col-sm-10 col-md-10">
                                    <input name="stopDate" id="stopDate" type="text" value="" placeholder="" class="form-control input-xs">
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <input type="button" id="calpicker3" class="calicon form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 col-md-2 control-label" for="textinput">
                                회계구분 </label>
                            <div class="col-sm-2 col-md-2">
                                <select class="form-control input-xs">
                                    <option>원재료</option>
                                    <option>재료</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>