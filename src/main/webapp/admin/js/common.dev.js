// 팝업(no scroll)
function popsn(url, trgt, w, h) { 
	var windowLeft = (screen.width-w)/2;
	var windowTop = (screen.height-h)/2;
    var p = window.open(url,trgt,'width='+w+',height='+h+',scrollbars=no,resizable=no,copyhistory=no,toolbar=no,status=no,top=' + windowTop + ',left=' + windowLeft + '');
    p.focus();
    return p;
}

// 팝업(scroll)
function popsy(url, trgt, w, h) { 
	var windowLeft = (screen.width-w)/2;
	var windowTop = (screen.height-h)/2;
    var p = window.open(url,trgt,'width='+w+',height='+h+',scrollbars=yes,resizable=no,copyhistory=no,toolbar=no,status=no,top=' + windowTop + ',left=' + windowLeft + ''); 
    p.focus();
    return p;
}

function setComma(n) {
	n += '';
	var x = n.split('.');
	var x1 = x[0].replace(/,/g, '');
	var x2 = x.length > 1 ? '.' + x[1] : '';
	x1 = x1.replace(/^(0+)(\d+)/, '$2');
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
	    x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}

function setSelectionRange(obj, start, end) {
	if (obj.setSelectionRange) {
		obj.setSelectionRange(start, end);
	} else if (obj.createTextRange) {
		var range = obj.createTextRange();
		range.collapse(true);
		range.moveStart("character", start);
		range.moveEnd("character", end);
		range.select();

//		obj.blur();
	}
}

function toInt(n, d) {
	var v = parseInt(n.replace(/,/g, ""), 10);
	if (isNaN(v) && !isNaN(d)) {
		return d;
	} else {
		return v;
	}
}

function toDouble(n, d) {
	var v = parseFloat(n.replace(/,/g, ""), 10);
	if (isNaN(v) && !isNaN(d)) {
		return d;
	} else {
		return v;
	}
}

function defaultString(s) {
	if (s) {
		return s;
	} else {
		return "";
	}
}

function fill0(v, n) {
	var tmp = "00000000000000000000" + v;
	return tmp.substr(tmp.length - n);
}

// 쿠키 생성
function setCookie(cName, cValue, cDay){
	var expire = new Date();
	expire.setDate(expire.getDate() + cDay);
	cookies = cName + '=' + escape(cValue) + ';path=/';
	if (typeof cDay != 'undefined') {
		cookies += ';expires=' + expire.toGMTString() + ';';
	}
	document.cookie = cookies;
}

// 쿠키 가져오기
function getCookie(cName) {
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	if(start != -1){
		start += cName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1) {
			end = cookieData.length;
		}
		cValue = cookieData.substring(start, end);
	}
	return unescape(cValue);
}

function defaultSuccessHandler(data){
	try {
		var result = $.parseJSON(data);
		if (result.message && result.message != "") {
			alert(result.message);
		}
		if (result.callback && result.callback != "") {
			window[result.callback](result.data);
		}
		if (result.redirectUrl && result.redirectUrl != "") {
			document.location.href = result.redirectUrl;
		}
		return true;
	} catch(e) {
		return false;
	}
}

function defaultErrorHandler(data){
	alert("에러가 발생하였습니다.");
}

function gSubmitPost(formId, isUpload) {
	var form = $("#" + formId);
	if (isUpload == true) {
		form.attr("encoding", "multipart/form-data");
	} else if (isUpload == false){
		form.attr("encoding", "");
	}

	form.ajaxSubmit({
		type: 'post',
		debug: true,
		success: defaultSuccessHandler,
		error: defaultErrorHandler
	});
}

function gSendPost(url, param, cbSuccess, cbError) {
	if (!cbSuccess) { cbSuccess = defaultSuccessHandler; }
	if (!cbError) { cbError = defaultErrorHandler; }
	$.ajax({
		type: "post",
		url: url,
		data: param,
		success: cbSuccess,
		error: cbError
	});
}

//새로고침
function gRefreshForm() {
	document.location.href = document.location.href.replace(/#$/, '');
}

function trim(v) {
	return v.replace(/^\s+|\s+$/g,"");
}

function ltrim(v) {
	return v.replace(/^\s+/,"");
}

function rtrim(v) {
	return v.replace(/\s+$/,"");
}

function roundPrecision(v, p) {
	var po = Math.pow(10, p);
	return Math.round(v * po) / po;
}

function FIXME() {
	alert("아직 구현되지 않았습니다.");
}

var gDayOfWeek1 = {
		Mon: "월",
		Tue: "화",
		Wed: "수",
		Thu: "목",
		Fri: "금",
		Sat: "토",
		Sun: "일"
};
//2013-01-20 스마트 에디터 추가부분
var gSmartEditors = [];
function initSmartEdiotr(id){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: gSmartEditors,
		elPlaceHolder: id,
		sSkinURI: "/SE2.1.2.O8352/SmartEditor2Skin.html",
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
			}
		}, //boolean
		fOnAppLoad : function(){
		},
		fCreator: "createSEditor2"
	});
}
function updateSmartEditor() {
	for(var i=0; i<gSmartEditors.length; ++i) {
		gSmartEditors[i].exec("UPDATE_CONTENTS_FIELD", []);
	}
}
