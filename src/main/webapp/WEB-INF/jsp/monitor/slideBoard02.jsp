<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge"/>
<meta name="viewport" content="width=1920, height=1080, user-scalable=yes"/>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

<title>영도 스마트팩토리</title>

</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/include/main-header.jspf" %>

<!-- page-wrapper -->
<div id="page_wrapper">

<!-- Slide Page -->
<input id="pageInfo" type="hidden">
<div id="divSlide" style="width:99%; height:99%; margin-top: 4em;">
<%@ include file="/WEB-INF/jsp/sub/slidePage02.jsp" %>
</div>

</div>
<!-- PopUp Page -->
<%@ include file="/WEB-INF/include/machineInfo.jspf" %>

<script src="<c:url value="/js/util.js" />"></script>
<script src="<c:url value="/js/main.js" />"></script>
<script src="<c:url value="/js/jquery.sliderTabs.js" />"></script>

<script type="text/javascript" defer="defer">
var setDataSec = 0;
var setSlideSec = 0;
var curPage;
var timerId01 = "";
/*
 * 팝업
 */
function fn_showPopUp(id){
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
			alert(e.responseText);
		}
 	});
	
}

function fn_setPopUp(result){
    var $modallink = '.modal-layer';
    $($modallink).slideDown('slow');
    
    $("#fa_no").val(result.data.FA_NO);
    $("#fa_nm").text(result.data.FA_NM);
    
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
    	$("#itm_cd").text(result.data.ITM_CD);
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
    
}

/**
 * data select TimeSet
 */
function fn_dataTimeSet(){
	var chkSec = $("#setDataSec").val();
	if(chkSec < 3){
		alert("기본 3초 이상으로 설정해 주세요.");
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
		setDataSec = 10000; //기본 30초
	}
	timerId01 = setInterval("fn_selectMachineInfo()", setDataSec); // 1000ms = 1초 마다 함수를 실행.
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
		setSlideSec = 20000; //1분 - (300,000/5분)
	}
	
	$(".board_slide").slick({
	    slidesToShow: 1,
	    slidesToScroll: 1,
	    dots: true,
	    infinite: true,
	    cssEase: 'linear',
	    autoplay: false,
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
	
	//DB disconnect
	$("#discon").on("click", function(e){
		e.preventDefault();
		fn_discon();
	});
	
	//시작!
	fn_setInterval();
});
</script>

</body>
</html>