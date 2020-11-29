<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge"/> 
<meta name="viewport" content="width=1920, height=1080, user-scalable=yes"/> 
<meta name="viewport" content="width=device-width, height=device-height, user-scalable=yes"/>
-->

<%@ include file="/WEB-INF/include/include-header.jspf" %>

<title>Truth Coffee</title>

</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/include/main-header.jspf" %>

<!-- page-wrapper -->
<div id="page_wrapper">

<!-- Slide Page -->
<input id="pageInfo" type="hidden">
<div id="divSlide" style="width:99%; height:99%; margin-top: 4em;">
<%@ include file="/WEB-INF/jsp/sub/slidePage01.jsp" %>
</div>

</div>
<!-- PopUp Page -->
<%@ include file="/WEB-INF/include/machineInfo.jspf" %>

<script src="<c:url value="/js/util.js" />"></script>
<script src="<c:url value="/js/main.js" />"></script>
<script src="<c:url value="/js/jquery.sliderTabs.js" />"></script>

<script type="text/javascript" defer="defer">
var setDataSec = 0;
var setDataSecForPop = 0;
var setSlideSec = 0;
var curPage;
var timerId01 = "";
var timerId02 = "";
var xpaused = false;
var changedCheck_resultQty;
var changedCheck_okQty;
var changedCheck_badQty;

/*
 * 팝업
 */
function fn_showPopUp(id){
	if(null == $("#"+id).attr('name') || "" == $("#"+id).attr('name')){
		alert("설비데이터가 없습니다!");
		return;
	}
	
	var param = "fa_no="+$("#"+id).attr('name');
	var ajaxUrl = "<c:url value='/monitor/popUpInfo.do' />";
	
	$.ajax({
		type:"post"
		,url:ajaxUrl
		,data:param
		,dataType:"json"
		,success:function(result) {
			fn_setPopUp(result);
		}
		,error:function(e) {
			clearInterval(timerId01);
			clearInterval(timerId02);
			alert(e.responseText);
		}
 	});
	
}

/*
 * 팝업 data refresh
 */
function fn_dataRef(){
	var param = "fa_no="+$("#fa_no").val();
	var ajaxUrl = "<c:url value='/monitor/popUpInfo.do' />";
	
	$.ajax({
		type:"post"
		,url:ajaxUrl
		,data:param
		,dataType:"json"
		,success:function(result) {
			fn_setPopUpRef(result);
		}
		,error:function(e) {
			clearInterval(timerId01);
			clearInterval(timerId02);
			alert(e.responseText);
		}
 	});
	
}


function fn_setPopUp(result){
    var $modallink = '.modal-layer';
    $($modallink).slideDown('slow');
    
    $("#fa_no").val(result.data.FA_NO);
    $("#fa_nm").text(result.data.FA_NM);
    //$("#imgShow").attr("src", "<c:url value='/images/machine/mch_"+$("#fa_no").val()+".jpg'/>");
    $("#drc").text("");
    
  	//WO_NO & ITM_CD
	var woNo = '';
	var itmCd = '';
	if(null == result.data.WO_NO || "" == result.data.WO_NO){
		woNo = 'N';
    }
    if(null == result.data.ITM_CD || "" == result.data.ITM_CD){
    	itmCd = 'N';
    }
    
    if(woNo == 'N' && itmCd == 'N'){
    	//비가동현황을 보여주는 UI 로 세팅
    	drawGrid();
    	return;
    }
    
    $("#title01").text("설비작업정보");
	$("#title02").show();
	$("#table01").show();
	$("#table02").show();
	$("#myGrid").hide();
	
    //작업지시번호
    if(null == result.data.WO_NO || "" == result.data.WO_NO){
    	$("#wo_no").text("No Data");
    }else{
    	$("#wo_no").text(result.data.WO_NO);
    }
    //품명
    if(null == result.data.ITM_CD || "" == result.data.ITM_CD){
    	$("#itm_cd").text("No Item");
    }else{
    	//$("#itm_cd").text(result.data.ITM_CD);//ITM_NM
    	$("#itm_cd").text(result.data.ITM_NM);
    }
    //계획량
    if(null == result.data.PLAN_QTY || 0 == result.data.PLAN_QTY){
    	$("#plan_qty").text(0);
    }else{
    	$("#plan_qty").text(result.data.PLAN_QTY);
    }
  	//실적량
    if(null == result.data.RESULT_QTY || 0 == result.data.RESULT_QTY){
    	$("#result_qty").text(0);
    }else{
    	$("#result_qty").text(result.data.RESULT_QTY);
    }
    //result rate
    if(null == result.data.RESULT_RT || 0 == result.data.RESULT_RT){
    	$("#result_rt").text(0);
    }else{
    	$("#result_rt").text(result.data.RESULT_RT + "%");
    }
    //준비수량
    if(null == result.data.READY_QTY || 0 == result.data.READY_QTY){
    	$("#ready_qty").text(0);
    }else{
    	$("#ready_qty").text(result.data.READY_QTY);
    }
    //양품수량
    if(null == result.data.OK_QTY || 0 == result.data.OK_QTY){
    	$("#ok_qty").text(0);
    }else{
    	$("#ok_qty").text(result.data.OK_QTY);
    }
    //불량수량
    if(null == result.data.BAD_QTY || 0 == result.data.BAD_QTY){
    	$("#bad_qty").text(0);
    }else{
    	$("#bad_qty").text(result.data.BAD_QTY);
    }
  	//total
    if(null == result.data.TOT_RT || 0 == result.data.TOT_RT){
    	$("#tot_rt").text("No Data");
    }else{
    	$("#tot_rt").text(result.data.TOT_RT + " %");
    }
  	//refresh thread start
    fn_setInterval02();
}

/**
 * fn_setPopUpRef
 */
function fn_setPopUpRef(result){
    //----------- refresh 확인용 s -----------//
	var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    
    $("#drc").text("Refreshed!");
    $("#drc").css("color", color);
  	//----------- refresh 확인용 e -----------//
  
    //작업지시번호
    if(null == result.data.WO_NO || "" == result.data.WO_NO){
    	$("#wo_no").text("No Data");
    }else{
    	$("#wo_no").text(result.data.WO_NO);
    }
    //품명
    if(null == result.data.ITM_CD || "" == result.data.ITM_CD){
    	$("#itm_cd").text("No Item");
    }else{
    	$("#itm_cd").text(result.data.ITM_NM);
    }
    //계획량
    if(null == result.data.PLAN_QTY || 0 == result.data.PLAN_QTY){
    	$("#plan_qty").text(0);
    }else{
    	$("#plan_qty").text(result.data.PLAN_QTY);
    }
  	//실적량
    if(null == result.data.RESULT_QTY || 0 == result.data.RESULT_QTY){
    	$("#result_qty").text(0);
    }else{
    	$("#result_qty").text(result.data.RESULT_QTY);
    }
    //result rate
    if(null == result.data.RESULT_RT || 0 == result.data.RESULT_RT){
    	$("#result_rt").text(0);
    }else{
    	$("#result_rt").text(result.data.RESULT_RT + "%");
    }
    //준비수량
    if(null == result.data.READY_QTY || 0 == result.data.READY_QTY){
    	$("#ready_qty").text(0);
    }else{
    	$("#ready_qty").text(result.data.READY_QTY);
    }
    //양품수량
    if(null == result.data.OK_QTY || 0 == result.data.OK_QTY){
    	$("#ok_qty").text(0);
    }else{
    	$("#ok_qty").text(result.data.OK_QTY);
    }
    //불량수량
    if(null == result.data.BAD_QTY || 0 == result.data.BAD_QTY){
    	$("#bad_qty").text(0);
    }else{
    	$("#bad_qty").text(result.data.BAD_QTY);
    }
  	//total
    if(null == result.data.TOT_RT || 0 == result.data.TOT_RT){
    	$("#tot_rt").text("No Data");
    }else{
    	$("#tot_rt").text(result.data.TOT_RT + " %");
    }
  	
  	//blink check
    if(changedCheck_resultQty != result.data.RESULT_QTY){
    	blink('#result_qty');
	}
    if(changedCheck_okQty != result.data.OK_QTY){
    	blink('#ok_qty');
	}
    if(changedCheck_badQty != result.data.BAD_QTY){
    	blink('#bad_qty');
	}
    changedCheck_resultQty = result.data.RESULT_QTY;
    changedCheck_okQty = result.data.OK_QTY;
    changedCheck_badQty = result.data.BAD_QTY;
}

/**
 * data select TimeSet
 */
function fn_dataTimeSet(){
	var chkSec = $("#setDataSec").val();
	if(chkSec < 2){
		alert("기본 2초 이상으로 설정해 주세요.");
		return;
	}else{
		clearInterval(timerId01);
		fn_setInterval();
	}
}
/**
 * slide TimeSet 
 */
function fn_slideTimeSet(){
	var slideSec = $("#setSlideSec").val();
	if(slideSec < 5){
		alert("기본 5초 이상으로 설정해 주세요.");
		return;
	}else{
		slideSec = slideSec * 1000;
		$(".board_slide").slick("setOption", "autoplaySpeed", slideSec);
	}
}

/**
 * disconnection
 */
function fn_discon(){
    clearInterval(timerId01);
    clearInterval(timerId02);
    alert("DB 연결을 해제하였습니다.");
}

/*
 * fn_setInterval
 */
function fn_setInterval(){
	//1. kill the process already started
	if(timerId01 != null || timerId01 != ""){
		clearInterval(timerId01);
	}
	//2. timeSet and execute setInterval loop 
	setDataSec = $("#setDataSec").val() * 1000;
	if(setDataSec == 0 || setDataSec == null){
		setDataSec = 10000; //기본 10초
	}
	timerId01 = setInterval("fn_selectMachineInfo()", setDataSec); // 1000ms = 1초 마다 함수를 실행.
}

/*
 * fn_setInterval02
 */
function fn_setInterval02(){
	//1. kill the process already started
	if(timerId02 != null || timerId02 != ""){
		clearInterval(timerId02);
	}
	//2. timeSet and execute setInterval loop 
	setDataSecForPop = 2000;
	timerId02 = setInterval("fn_dataRef()", setDataSecForPop); // 1000ms = 1초 마다 함수를 실행.
}

/*
 * 반별 조회
 */
function fn_selectMachineInfo(){
	//Current page check
	if(curPage == "" || curPage < 1){
		alert("현재페이지 설정이 제대로 되지 않았습니다! \n관리자에게 문의하세요.");
		return;
	}
	
	var param = "";
	var ajaxUrl = "";
	
	switch (curPage) {
        case 1:
        	param = "wc_cd=WC010"; //가공 & 단조
        	ajaxUrl = "<c:url value='/monitor/pressInfo.do' />";
            break;
        case 2:
        	param = "wc_cd=WC020"; //자동반
        	ajaxUrl = "<c:url value='/monitor/autoInfo.do' />";
            break;
    }
	
	
	$.ajax({
		type:"post"
		,url:ajaxUrl
		,data:param
		,dataType:"json"
		,success:function(result) {
			fn_refresh(result, curPage);
		}
		,error:function(e) {
			clearInterval(timerId01);
			alert(e.responseText);
		}
 	});
}

/*
 * 화면변경
 */
function fn_refresh(result, cp){
	var resultCnt = result.data.length;
	var result_FA_NO    = new Array();
	var result_FA_NM    = new Array();
	var result_STAT_BC  = new Array();
	var result_ACH_RATE = new Array();
	var cnt = 1;
	var operation = 0, stop = 0;
	
    for(var idx=0; idx<resultCnt; idx++) {
    	result_FA_NO[idx]    = result.data[idx].FA_NO;
    	result_FA_NM[idx]    = result.data[idx].FA_NM;
    	result_STAT_BC[idx]  = result.data[idx].STAT_BC;
    	result_ACH_RATE[idx] = result.data[idx].ACH_RATE;
    }
    
  	//가공&단조반 - 자동반 set
    switch (cp) {
    	//가공&단조반
	    case 1:
	    	for(var idx=0; idx<resultCnt; idx++) {
	    		$("#1_"+cnt).text(result_FA_NM[idx]);
	    		$("#1_"+cnt+"t").text("달성률: "+result_ACH_RATE[idx]+" %");
	    		if("R" == result_STAT_BC[idx]){
	    			$("#1_"+cnt+"a").attr('class','col-3 waiting');
	    			stop++;
	    		}else{
	    			$("#1_"+cnt+"a").attr('class','col-3');
	    			operation++;
	    		}
	    		$("#1_"+cnt).attr('name',result_FA_NO[idx]);
	    		$("#1_"+cnt+"t").attr('name',result_FA_NO[idx]);
	    		cnt++;
	    	}
	    	//disabled color change
	    	for(var idx=resultCnt+1; idx<31; idx++) {
	    		$("#1_"+idx+"a").attr('class','col-3 disabled');
	    		$("#1_"+idx).text("");
	    		$("#1_"+idx+"t").text("달성률: 0 %");
	    	}
	    	
	    	$("#1_operation").text(operation);
	    	$("#1_stop").text(stop);
	    	cnt = 1;
	        break;
	    //자동반
	    case 2:
	    	for(var idx=0; idx<resultCnt; idx++) {
	    		$("#2_"+cnt).text(result_FA_NM[idx]);
	    		$("#2_"+cnt+"t").text("달성률: "+result_ACH_RATE[idx]+" %");
	    		if("R" == result_STAT_BC[idx]){
	    			$("#2_"+cnt+"a").attr('class','col-3 waiting');
	    			stop++;
	    		}else{
	    			$("#2_"+cnt+"a").attr('class','col-3');
	    			operation++;
	    		}
	    		$("#2_"+cnt).attr('name',result_FA_NO[idx]);
	    		$("#2_"+cnt+"t").attr('name',result_FA_NO[idx]);
	    		/* $("#2_"+cnt+"a").attr('name',result_FA_NO[idx]); */
	    		cnt++;
	    	}
	    	//disabled color change
	    	for(var idx=resultCnt+1; idx<31; idx++) {
	    		$("#2_"+idx+"a").attr('class','col-3 disabled');
	    		$("#2_"+idx).text("");
	    		$("#2_"+idx+"t").text("달성률: 0 %");
	    	}
	    	
	    	$("#2_operation").text(operation);
	    	$("#2_stop").text(stop);
	    	cnt = 1;
	        break;
	}
}

/**
 * text blink effect
 */
function blink(selector) {
    $(selector).fadeOut('fast', function() {
        $(this).fadeIn('fast', function() {
            //blink(this);
        });
    });
}

/**
 * drawGrid effect
 */
function drawGrid() {
	//var br = "<br/>";
	//$("#title01").after(br);
	$("#title01").text("비가동 현황");
	$("#title02").hide();
	$("#table01").hide();
	$("#table02").hide();
	$("#myGrid").show();
	
	var param = "fa_no="+$("#fa_no").val();
	var ajaxUrl = "<c:url value='/monitor/nonOperInfo.do' />";
	
	$.ajax({
		type:"post"
		,url:ajaxUrl
		,data:param
		,dataType:"json"
		,success:function(result) {
			fn_gridSet(result);
		}
		,error:function(e) {
			alert(e.responseText);
		}
 	});
}

/*
 * 화면변경
 */
function fn_gridSet(result){
	var columns = [{
		id : "work_dt", //내부 접근 아이디
		name : "작업일자", //Grid에 표시될 컬럼명
		field : "work_dt", //연동할 데이터상의 변수명
		width : 300,
		height : 50,
		cssClass: "cell-text"
	},
	{
		id : "itm_nm",
		name : "품목",
		field : "itm_nm",
		width : 350,
		height : 50,
		cssClass: "cell-text"
	},
	{
		id : "stop_nm",
		name : "비가동 명",
		field : "stop_nm",
		width : 200,
		height : 50,
		cssClass: "cell-text"
	},
	{
		id : "fr_tm",
		name : "시작시각",
		field : "fr_tm",
		width : 100,
		height : 50,
		cssClass: "cell-text"
	},
	{
		id : "to_tm",
		name : "종료시각",
		field : "to_tm",
		width : 100,
		height : 50,
		cssClass: "cell-text"
	}];
	
	/* 
	{
		id : "rmks",
		name : "비고",
		field : "rmks",
		width : 200,
		cssClass: "cell-text"
	}
	*/
	
	//그리드 옵션들
	var options = {
		enableCellNavigation : true,
		enableColumnReorder : false, //재정렬은 jquery-ui.sortable 모듈 필요
		rowHeight: 50
		//autoHeight : true
	};

	//테스트를 위해 임의로 데이터를 생성하고,
	// SlickGrid 객체를 만들어 myGrid라는 id의 Div에 적용한다.
	$(function () {
		var data = [];
		var grid;
		
	    for (var i = 0; i < result.data.length; i++) {
	    	data[i] = {
	    		work_dt: result.data[i].work_dt,
	    		itm_nm: result.data[i].itm_nm,
	    		stop_nm: result.data[i].stop_nm,
	    		fr_tm: result.data[i].fr_tm,
	    		to_tm: result.data[i].to_tm
	    		//rmks: result.data[i].rmks
	      	};
	    }
	    grid = new Slick.Grid("#myGrid", data, columns, options);
	  });
}

/**
 * drawGraph
 */
function drawGraph(result) {
	var chartData = [];
	var chartData1 = [];
	var chart1;
	var chart2;
	
	if(0 < result.data[0].length){
		for (var i = 0; i < result.data[0].length; i++) {
	    	if(2 == result.data[0][i].disp_sq){
	    		chartData.push({
	    	 		rate : result.data[0][i].stop_tm,
	    	 		stop_name : result.data[0][i].stop_nm
	    	 	});
	    	}
	    }
		
		/* amchart set */
		chart1 = AmCharts.makeChart("non_oper_pie0", {
			  "type": "pie",
			  "theme": "light",
			  "titles": [{
			  	"text": "비가동정지(s)",
			  	"size": 30
			  }],
			  "autoMargins": false,
			  "marginTop": 0,
			  "marginBottom": 0,
			  "marginLeft": 5,
			  "marginRight": 5,
			  "pullOutRadius": 20,
			  "dataProvider": chartData,
			  "integersOnly":true,
			  "valueField": 'rate',
			  "titleField": "stop_name",
			  "fontSize": 20,
			  "outlineAlpha": 0.4,
			  "depth3D": 30,
			  "balloonText": "[[title]]<br><span style='font-size:20px'><b>[[value]]</b> ([[percents]]%)</span>",
			  "angle": 60,
			  "export": {
			    "enabled": false
			  }
		});
		
		/* grid set */
		var columns = [{
			id : "stop_nm", //내부 접근 아이디
			name : "중단명",
			field : "stop_nm", //연동할 데이터상의 변수명
			width : 300,
			height : 50,
			cssClass: "cell-text"
		},
		{
			id : "grp1_nm",
			name : "세부명",
			field : "grp1_nm",
			width : 350,
			height : 50,
			cssClass: "cell-text"
		},
		{
			id : "stop_tm",
			name : "정지시간(분)",
			field : "stop_tm",
			width : 250,
			height : 50,
			cssClass: "cell-text"
		}];
		
		//그리드 옵션들
		var options = {
			enableCellNavigation : true,
			enableColumnReorder : false,
			rowHeight: 50
		};

		$(function () {
			var data = [];
			var grid;
			
		    for (var i = 0; i < result.data[1].length; i++) {
		    	data[i] = {
		    		stop_nm: result.data[1][i].stop_nm,
		    		grp1_nm: result.data[1][i].grp1_nm,
		    		stop_tm: result.data[1][i].stop_tm
		      	};
		    }
		    grid = new Slick.Grid("#stopGrid0", data, columns, options);
		  });
	}else{
		//AmCharts.clear();
		$("#non_oper_pie0").empty();
		$("#stopGrid0").empty();
	}
	
    
	if(0 < result.data[2].length){
		for (var i = 0; i < result.data[2].length; i++) {
	    	if(2 == result.data[2][i].disp_sq){
	    		chartData1.push({
	    	 		rate : result.data[2][i].stop_tm,
	    	 		stop_name : result.data[2][i].stop_nm
	    	 	});
	    	}
	    }
		/* amchart set */
		chart2 = AmCharts.makeChart("non_oper_pie1", {
			  "type": "pie",
			  "theme": "light",
			  "titles": [{
			  	"text": "계획정지(p)",
			  	"size": 30
			  }],
			  "autoMargins": false,
			  "marginTop": 0,
			  "marginBottom": 0,
			  "marginLeft": 5,
			  "marginRight": 5,
			  "pullOutRadius": 20,
			  "dataProvider": chartData1,
			  "integersOnly":true,
			  "valueField": 'rate',
			  "titleField": "stop_name",
			  "fontSize": 20,
			  "outlineAlpha": 0.4,
			  "depth3D": 30,
			  "balloonText": "[[title]]<br><span style='font-size:20px'><b>[[value]]</b> ([[percents]]%)</span>",
			  "angle": 60,
			  "export": {
			    "enabled": false
			  }
		});
		
		/* grid set */
		var columns1 = [{
			id : "stop_nm", //내부 접근 아이디
			name : "중단명",
			field : "stop_nm", //연동할 데이터상의 변수명
			width : 300,
			height : 50,
			cssClass: "cell-text"
		},
		{
			id : "grp1_nm",
			name : "세부명",
			field : "grp1_nm",
			width : 350,
			height : 50,
			cssClass: "cell-text"
		},
		{
			id : "stop_tm",
			name : "정지시간(분)",
			field : "stop_tm",
			width : 250,
			height : 50,
			cssClass: "cell-text"
		}];
		
		//그리드 옵션들
		var options1 = {
			enableCellNavigation : true,
			enableColumnReorder : false, //재정렬은 jquery-ui.sortable 모듈 필요
			rowHeight: 50
		};

		$(function () {
			var data1 = [];
			var grid1;
			
		    for (var i = 0; i < result.data[3].length; i++) {
		    	data1[i] = {
		    		stop_nm: result.data[3][i].stop_nm,
		    		grp1_nm: result.data[3][i].grp1_nm,
		    		stop_tm: result.data[3][i].stop_tm
		      	};
		    }
		    grid1 = new Slick.Grid("#stopGrid1", data1, columns1, options1);
		  });
	}else{
		//var chart2 = AmCharts.clear();
		//chart2 = AmCharts.clear();
		$("#non_oper_pie1").empty();
		$("#stopGrid1").empty();
	}
    
}


$(document).ready(function() {
	$(".board_slide").on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
        //currentSlide is undefined on init -- set it to 0 in this case (currentSlide is 0 based)
        var i = (currentSlide ? currentSlide : 0) + 1;
        $("#pageInfo").val(i);
        curPage = i;
        
        switch (i) {
    	    case 1:
    	        $("#lineText").text("가공 & 단조반");
    	        break;
    	    case 2:
    	    	$("#lineText").text("자동반");
    	        break;
        }
    });
	
	if(setSlideSec == 0 || setSlideSec == null){
		setSlideSec = 20000; //기본 20초 (300,000/5분)
	}
	
	$(".board_slide").slick({
	    slidesToShow: 1,
	    slidesToScroll: 1,
	    dots: true,
	    infinite: true,
	    cssEase: 'linear',
	    autoplay: true,
	    autoplaySpeed: setSlideSec,
	    pauseOnFocus: false,
	    pauseOnHover: false
    });
	
	//dynamically 1~30
	var id;
	for(var i = 1; i <= 30; i++) {
		$("#1_"+i+"a").on("click", function(e){ //팝업
			e.preventDefault();
			id = e.target.getAttribute('id');
	        if((id != '') && (id != null))  
				fn_showPopUp(id);
		});
		$("#2_"+i+"a").on("click", function(e){ //팝업
			e.preventDefault();
			id = e.target.getAttribute('id');
	        if((id != '') && (id != null))  
				fn_showPopUp(id);
		});
	}
	
	//dataTimeSet
	$("#dataTimeSet").on("click", function(e){
		e.preventDefault();
		fn_dataTimeSet();
	});
	
	//slideTimeSet
	$("#slideTimeSet").on("click", function(e){
		e.preventDefault();
		fn_slideTimeSet();
	});
	
	//slideToggle
	$("#slideToggle").on("click", function(e){
		e.preventDefault();
		if(xpaused){
			$(".board_slide").slick("play");
			$("#slideToggle").text("ON");
		}else{
		  	$(".board_slide").slick("pause");
		  	$("#slideToggle").text("OFF");
		}
		xpaused = !xpaused;
		$(this).toggleClass("paused");
	});
	
	//DB disconnect
	$("#discon").on("click", function(e){
		e.preventDefault();
		fn_discon();
	});
	
	//PopUp thread close
	$("#pop_close").on("click", function(e){
		e.preventDefault();
		clearInterval(timerId02);
	});
	
	//popUp set
	$('#dialog').dialog({
	    autoOpen: false,
	    resizable: true,
	    width: 1890,
	    height: 1000,
	    modal: true,
	    open: function (event, ui) {
			$('#dialog').css('z-index',1000);
			$('#header').css('z-index',10);
			
			//datepicker set
			$("#txtDate").datepicker({
				dateFormat: 'yy-mm',
				changeYear: true
		    });
			
			$('#txtDate').val($.datepicker.formatDate('yy-mm', new Date()));
			
			//ajax call
			var param = {fa_no: $("#fa_no").val(), yyyy_mm: $('#txtDate').val()};//plan_yn: '1' 비계획정지
			var ajaxUrl = "<c:url value='/monitor/nonOperGraphInfo.do' />";
			//비계획정지 그래프
			$.ajax({
				type:"post"
				,url:ajaxUrl
				,data:param
				,dataType:"json"
				,success:function(result) {
					drawGraph(result);
				}
				,error:function(e) {
					alert("error: " + e.responseText);
				}
		 	});
		},
		close: function (event, ui) {
			$('#dialog').css('z-index',10);
			$('#header').css('z-index',1000);
		}
		//position: {my: "left", at: "left bottom", of: window}
	});
	
	//Graph pop open
	$("#graphPop").on("click", function(e){
		e.preventDefault();
		$("#pop_close").click();
		$('#dialog').dialog('open');
	});
	
	//popUp 조회버튼 set
	$("#srch").click(function(){
		var param = {fa_no: $("#fa_no").val(), yyyy_mm: $("#txtDate").val()};//, plan_yn: '1'
		 
		var ajaxUrl = "<c:url value='/monitor/nonOperGraphInfo.do' />";
		//비계획정지 그래프
		$.ajax({
			type:"post"
			,url:ajaxUrl
			,data:param
			,dataType:"json"
			,success:function(result) {
				drawGraph(result);
			}
			,error:function(e) {
				alert("error: " + e.responseText);
			}
	 	});
	})
	
	//시작!
	fn_setInterval();
	$('#slideToggle').trigger("click");
});
</script>

</body>
</html>