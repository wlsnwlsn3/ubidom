/*######################################
 * dhtmlx Common Variables & Function
*#####################################*/
var editCol = "";
var delCol = "";
var chkCol = "chk";
var editStatCol = "editStat";
var cudKeyCol = "cudKey";
var actInsert = "INSERT";
var actUpdate = "UPDATE";
var actDelete = "DELETE";
var gAutoHeight = true;
var gridHeight = -50;
var editIcon = "<img src=/images/common/caution01.png>";
// fn editing
function gfn_gridEditCell(stage,rId,cInd,nValue,oValue) {
	if(stage==0) { // Before Editing
		var pk = this.getUserData("","pk");
	
		var cudKeyColIdx = this.getColIndexById(cudKeyCol);
     
		if(pk!=null && pk!="") {
			var arr = pk.split(",");
			for(var i = 0; i < arr.length; i++) {
				var pkColIdx = this.getColIndexById(arr[i]);
				if(this.cells(rId, cudKeyColIdx).getValue()!=actInsert) {
					if(pkColIdx >= 0 && pkColIdx==cInd) {
						MsgManager.alertMsg("WRN003"); // 키컬럼 수정불가
						return false;
					}
				}
			}
		}
	} else if(stage==1){ // Progressing Editing
		if(this.getColType(cInd)=="ed") {
			$(".dhx_combo_edit").select();
		} else if(this.getColType(cInd)=="coro") {
			$("td.cellselected").css("background","url('/component/dhtmlxGrid/imgs/dhxcombo_arrow_down.gif') no-repeat 97% center #ffffff; border:1px solid #e9e9e9;");			
		}else if(this.getColType(cInd)=="ch"){
			setUpdateAcType(this, rId);
		}
	} else if((stage == 2)) { // After Editing
        var colId = this.getColumnId(cInd);
        var className1 = this.getUserData("","pk");
        var className2 = this.getUserData("",colId);

		$("td").css("background","");
		if((oValue != nValue)) {
			setUpdateAcType(this, rId);
		}
	}
	return true;
}
// set crud status
function setUpdateAcType(obj, rowId){
	var cudKeyColIdx = obj.getColIndexById(cudKeyCol);
	if (cudKeyColIdx >= 0) {
		var cell = obj.cells(rowId, cudKeyColIdx);
		if(cell.getValue() != actInsert && cell.getValue() != actUpdate) {
			cell.setValue(actUpdate);
			editCol = editCol + (rowId-1) + ";";
			var editStatColIdx = obj.getColIndexById(editStatCol);
			if(editStatColIdx >= 0) {
				var x = obj.cells(rowId, editStatColIdx);
				x.setValue(editIcon);
			}
		}
	}
}


/**
 * dhtmlx Tree Grid
 */

/* 형제 리스트의 순번을 다시 셋팅 */
function resetSiblingSeq(obj, currRow, viewSeqColIdx) {
	//Parent Row Info
	var parentId = obj.getParentId(currRow);		//부모 ID
	var subItems = obj.getSubItems(parentId);		//부모의 자식리스트
	if (gfn_isEmpty(subItems)) return 1;
	var subItemsArray = subItems.split(',');
	if (gfn_isEmpty(subItemsArray)) return 1;

	//현재컬럼이 형제리스트 중 최고상단 or 최고하단 일 경우 순번입력 하지않고 리턴.
	//if (currRow == subItemsArray[0] || currRow == subItemsArray[subItemsArray.length-1]) return;
	
	for (var i=0; i<subItemsArray.length; i++) {
		var targetCell = obj.cells(subItemsArray[i], viewSeqColIdx);
		targetCell.setValue(eval(i + '+' + 1));
		setUpdateAcType(obj, subItemsArray[i]);
	}
}

/*
 * 드래그로 상위 폴더 변경시 동작
 * 상위폴더ID 를 변경한다.
 * 
 * sId - id of the source item;
 * tId - id of the target item;
 * sObj - source grid object;
 * tObj - target grid object;
 * sInd - index of the column from which drag started;
 * tInd - index of the column in which drop occurs.
 */
function gfn_onDrag(sId,tId,sObj,tObj,sInd,tInd) {
	//alert(sId + " / " + tId + " / " + sObj + " / " + tObj + " / " + sInd + " / " + tInd);
	
	var colIdx = this.getColIndexById('menuId');
	var colIdx2 = this.getColIndexById('upMenuId');

	var uppMenuId = this.cells(tId, colIdx).getValue();	//최종 부모 폴더 아이디
	this.cells(sId, colIdx2).setValue(uppMenuId);
	setUpdateAcType(this, sId);	//Setting 상태값(actUpdate : UPDATE)
	
	return true;
	
}

function setGridHeight() {
	if(gAutoHeight == false) {
		if($('#gridDiv').position()!=null){
			var h = $(window).height();
			h -= Math.round($('#gridDiv').position().top);
			h += gridHeight;
			$('#gridDiv').css("height",h);
	
			var w = $(window).width();
			w -= Math.round($('#gridDiv').position().left);
			$('#gridDiv').css("width",w);
		}
	}
}

var _resize_timer;
$(window).resize(function(){
	if (gAutoHeight == false) {
		window.clearTimeout(_resize_timer);
		_resize_timer=window.setTimeout(function(){
			setGridHeight();
		}, 100);
	}
});

//삭제될 popup 로직
function gfn_load_popup(subject,view_path){
	var w1;
	var eleId = "container";
	dhxWins = new dhtmlXWindows();
	dhxWins.attachViewportTo(eleId);
	w1 = dhxWins.createWindow(eleId, 50, 80, 320, 300);
	     dhxWins.window(eleId).setText(subject);
	// iframe, get
	w1.attachURL("/erp/popup/"+view_path+".do");
	return w1;
}
//삭제될 popup 로직
function gfn_big_load_popup(width,height,subject,view_path){
	var w1;
	var eleId = "container";
	dhxWins = new dhtmlXWindows();
	dhxWins.attachViewportTo(eleId);	
	w1 = dhxWins.createWindow(eleId, 50, 80, width, height);
	     dhxWins.window(eleId).setText(subject);
	// iframe, get
	w1.attachURL("/erp/popup/"+view_path+".do");
	return w1;
}

var subToolbar = function(toolbar,sublayout,btn_id_array){
	toolbar = sublayout.attachToolbar();
		
	var size = 18;
	toolbar.setIconSize(18);
	toolbar.setIconsPath("/images/button/dhtmlx/");
	toolbar.loadStruct("/common/json/button.json",fn_onLoad);

	function fn_onLoad(){
	  var item_id_set_arr = [1,2,3,4,5,6,7,8,9,10];
	    	
	  for(var i=0; i< btn_id_array.length; i++){
	       var index = item_id_set_arr.indexOf(btn_id_array[i]);
	       if (index > -1){
	             item_id_set_arr.splice(index, 1);
	          }
	      }
	  for(var i=0; i<item_id_set_arr.length; i++){
	      toolbar.removeItem("btn"+item_id_set_arr[i]);	
	      toolbar.removeItem("sep"+item_id_set_arr[i]);
	     }	
	 } 
	return toolbar;
}	

function gfn_load_pop(eleId,view_path,isModal,param) {

    var pLayout;
    var default_bln = false;
    if (isModal) {
        default_bln = true;
    }
    
    dhxWins = new dhtmlXWindows();
    if (!$('#' + eleId).length) {
        if (dhxWins.isWindow(eleId)) {
            while (dhxWins.isWindow(eleId)) {
                var number = eleId.replace(/[^0-9]/g, '');
                eleId = eleId.replace(/\d+/g, '') + number++;
            }
        }
        var $div = $('<div/>').appendTo('#container');
        $div.attr('id', eleId);
    }
    
    w1 = dhxWins.createWindow(eleId, 20, 30, 800, 500);
    
    dhxWins.window(eleId).setModal(default_bln);
    pLayout = w1.attachLayout("1C");
    pLayout.attachEvent("onContentLoaded", function(id) {
    
        pLayout.cells(id).hideHeader();
        ifr = pLayout.cells(id).getFrame();
        dhxWins.window(eleId).setDimension(ifr.contentWindow.config.width, ifr.contentWindow.config.height);
        w1.setText(ifr.contentWindow.config.title);
    	$.each(param,function(key,val){
    		$(ifr).contents().find("#"+key).val(val);
    	});
        pLayout.cells(id).setSizes();
    });
    
    pLayout.cells("a").attachURL("/erp/popup/" + view_path + ".do");

}

function gfn_setNumberFormat(grid,colArr,format) {
	 var defaultFormat = "0,000";
	                if(format == undefined)
	 format = defaultFormat;
	 for (var i = 0; i < colArr.length; i++) {
	                    var colIndex = grid.getColIndexById(colArr[i]);
	                    
	   grid.setNumberFormat(format, colIndex);
	                }
}
function execDaumPostcode(postName,addressName) {
	 var width = 500;
	 var height = 600;
	 var name = '우편번호 검색';
    new daum.Postcode({
        oncomplete: function(data) {
       	 //fullRoadAddress -> 도로명 주소
            var fullRoadAddr = data.roadAddress; 
            var extraRoadAddr = ''; 

            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            document.getElementById(postName).value = data.postcode1+"-"+data.postcode2;
            
            document.getElementById(addressName).value = data.jibunAddress;
        }
    }).open({
   	    q: $("#"+postName).val(),
   	    left: (window.screen.width / 2) - (width / 2),
   	    top: (window.screen.height / 2) - (height / 2),
   	    popupName: name
    });
}

//임시로 파일 업로드 공통부분 추가
function fileupload(tagId,imgId){
	 $('#'+tagId).fileupload({
	        dataType: 'json',
	        add: function (e, data) {
	   
	            if ((/\.(gif|jpg|jpeg|tiff|png)$/i).test(data.files[0].name)) {
	                if (data.files && data.files[0]) {
	                    var reader = new FileReader();
	                    reader.onload = function(e) {
	                        $('#'+imgId).attr('src', e.target.result);
	                    }
	                    reader.readAsDataURL(data.files[0]);
	                    data.submit();
	                }
	            }

	        },
	        
	        done: function (e, data) {
	        	$("tr:has(td)").remove();
	            $.each(data.result, function (index, file) {
	            	
	            	
	                $("#uploaded-files").append(
	                		$('<tr/>')
	                		.append($('<td/>').text(file.fileName))
	                		.append($('<td/>').text(file.fileSize))
	                		.append($('<td/>').text(file.fileType))
	                		.append($('<td/>').html("<a href='rest/controller/get/"+index+"'>Click</a>"))
	                		)//end $("#uploaded-files").append()
	            }); 
	        },
	        
	        progressall: function (e, data) {
		        var progress = parseInt(data.loaded / data.total * 100, 10);
		        $('#progress .bar').css(
		            'width',
		            progress + '%'
		        );
	   		},
	   		
			dropZone: $('#dropzone')
	    });
	 return true;
}


