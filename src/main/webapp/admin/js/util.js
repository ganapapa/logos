// 필수항목체크
function gf_validation(oForm) {
	for(var i=0;i<oForm.elements.length; i++) {
		el = oForm.elements[i];

		if(el.getAttribute("required") != null) {
			if(el.alt != null) {
				sCommnet = el.alt;
			} else if(el.title != null) {
				sCommnet = el.title;
			}

			if(el.getAttribute("radio") != null) {
				sText = getRadioValue(eval("oForm." + el.name));
			} else if(el.getAttribute("checkbox") != null) {
				sText = joinCheckBoxArr(eval("oForm." + el.name),"");
			} else {
				sText = el.value;
			}

			if(sText == "") {
				alert(sCommnet+"은(는) 필수입력 정보입니다.");

				if(el != null) {
					el.focus();
				}

				return false;
			}
		}

		// 주민등록번호
		if(el.getAttribute("regno") != null) {
			sText = el.value;
			sText = sText.replace(/\-/gi, "");

			if(sText != "") {
				if(sText.length != 13) {
					alert("주민등록번호는 13자리로 입력해주세요.");

					if(el != null) {
						el.focus();
					}

					return false;
				}

				if(!gf_check_ssn(sText)) {
					alert("올바른 주민등록번호를 입력해주세요.");

					if(el != null) {
						el.focus();
					}

					return false;
				}
			}
		}

		// 사업자번호
		if(el.getAttribute("bizno") != null) {
			sText = el.value;
			sText = sText.replace(/\-/gi, "");

			if(sText != "") {
				if(sText.length != 10) {
					alert("사업자번호는 10자리로 입력해주세요.");

					if(el != null) {
						el.focus();
					}

					return false;
				}

				if(!gf_check_busino(sText)) {
					alert("올바른 사업자번호를 입력해주세요.");

					if(el != null) {
						el.focus();
					}

					return false;
				}
			}
		}

		// 이메일
		if(el.getAttribute("email") != null) {
			sText = el.value;

			if(sText != "") {
				if(!gf_validEmail(sText)) {
					alert("올바른 E-MAIL형식으로 입력해주세요. (예:koddi@master.com)");

					if(el != null) {
						el.focus();
					}

					return false;
				}
			}
		}

		// 일반전화
		if(el.getAttribute("phone") != null) {
			sText = el.value;

			if(sText != "") {
				if(!gf_validPhone(sText)) {
					alert("올바른 전화번호형식으로 입력해주세요. (예:02-1234-5678)");

					if(el != null) {
						el.focus();
					}

					return false;
				}
			}
		}

		// 휴대폰
		if(el.getAttribute("hp") != null) {
			sText = el.value;

			if(sText != "") {
				if(!gf_validHp(sText)) {
					alert("올바른 휴대폰형식으로 입력해주세요. (예:010-1234-5678)");

					if(el != null) {
						el.focus();
					}

					return false;
				}
			}
		}

		// 날자
		if(el.getAttribute("date") != null) {
			sText = el.value;
			sText = sText.replace(/\-/gi, "");

			if(sText != "") {
				if(!gf_isValidDate(sText)) {
					alert("올바른 날짜 형식으로 입력해주세요. (예:2012-01-01)");

					if(el != null) {
						el.focus();
					}

					return false;
				}
			}
		}

		// 분체크
		if(el.getAttribute("hm") != null) {
			sText = el.value;

			if(sText != "") {
				if(!gf_chkMin(sText)) {
					alert("분은 0 ~ 59 범위로 입력해 주십시요.");

					if(el != null) {
						el.focus();
					}

					return false;
				}
			}
		}
	}

	return true;
}

//window open
function gf_openDialog(argPage, argWidth, argHeight, argScroll, argResizable) {
	var openWin = window.open(argPage,"win","width="+argWidth+",height="+argHeight+",scrollbars="+argScroll+",resizable="+argResizable+",copyhistory=no,toolbar=no,status=no");

	openWin.focus();
}

//window open
function gf_openDialogPos(argPage, argWidth, argHeight, argScroll, argResizable) {

    var wX = (window.screen.width  - argWidth) / 2;
    var wY = (window.screen.height - argHeight) / 2;
    
    // Request Page Call
	var openWin = window.open(argPage,"win","left="+wX+",top="+wY+",width="+argWidth+",height="+argHeight+",scrollbars="+argScroll+",resizable="+argResizable+",copyhistory=no,directories=no,toolbar=no,status=no");

	openWin.focus();
}

// window moadl open
function gf_openModalDialog(argPage, argVal, argWidth, argHeight, argScroll) {
	var returnValue = window.showModalDialog(argPage, argVal,"dialogWidth:"+argWidth+"px; dialogHeight:"+argHeight+"px; center=yes; location:no; directories:no; resizable:no; status:no; help:no; scroll:" + argScroll+ "; ");

	return returnValue;
}

// 아이디 입력확인
function gf_checkValidManagerId(idObj) {
    if(idObj.value.length < 6) {
        alert("아이디를 6자이상 입력하세요.");
        idObj.focus();
        return false;
	} else if(idObj.value.length > 10) {
        alert("아이디를 10자이하로 입력하세요.");
        idObj.focus();
        return false;
    } else if (!(/^[a-z][a-z0-9\-\_]{3,19}$/.test(idObj.value))) {
        alert("아이디는 영문소문자, 숫자, '-', '_'만 가능합니다. (첫글자는 영문)");
        idObj.select();
        return false;
    } else {
        return true;
    }
}

// 아이디 제한 확인
function gf_checkProhibitManagerId(idObj) {
    if (
        /admin/.test(idObj.value)
     || /dcdd/.test(idObj.value)
     || /bspm/.test(idObj.value)
     || /winwingrowth/.test(idObj.value)
     || /win\-win/.test(idObj.value)
        )
    {
        alert("사용하실수 없는 아이디 입니다.");
        idObj.focus();
        return false;
    } else {
        return true;
    }
}

/*
 * 유효한 날짜(Date) 인지 체크
 * Parameter : YYYYMMDD(년월일)
 * Return : true / false
 */
function gf_isValidDate(objValue) {
	objValue = gf_removeChar(objValue, "-");
	objValue = objValue.replace(/\-/gi, "");

	if(!gf_isNum(objValue) || objValue.length < 8) {
		return false;
	}

	year  = objValue.substring(0, 4);
	month = objValue.substring(4, 6);
	day   = objValue.substring(6, 8);

	if (parseInt(year, 10) >= 1900  && gf_isValidMonth(month) && gf_isValidDay(year, month, day)) {
		return true;
	}

	return false;
}

/**
 *	숫자인지 체크
 *  true - 숫자
 *	false - 숫자가 아님
 */
function gf_isNum(objValue) {
	var str="0123456789";

	if(objValue=="") {
		return false;
	}

	for(var i=0;i<objValue.length;i++) {
		if(str.indexOf(objValue.charAt(i))==-1) {
			return false;
		}
	}

	return true;
}

/* 유효한 월(月)인지 확인.
 * Parameter : MM(월)
 * Return : true / false
 */
function gf_isValidMonth(mm) {
	var m = parseInt(mm,10);

	return (m >= 1 && m <= 12);
}

/*
 * 유효한 일(日)인지 확인.
 * Parameter : YYYY, MM, DD(년, 월, 일)
 * Return : true / false
 */
function gf_isValidDay(yyyy, mm, dd) {
	var m = parseInt(mm,10) - 1;
	var d = parseInt(dd,10);
	var end = new Array(31,28,31,30,31,30,31,31,30,31,30,31);

	if ((yyyy % 4 == 0 && yyyy % 100 != 0) || yyyy % 400 == 0) {
		end[1] = 29;
	}

	return (d >= 1 && d <= end[m]);
}

/*
 * 문자열중에서 특정 문자만 제거한 값 return
 * Parameter : 문자열(String), 제거할 문자
 */
function gf_removeChar(str, chr) {
    var src = new String(str);
    var tar = new String();
    var i, len=src.length;

    for(i=0;i<len;i++) {
        if(src.charAt(i) == chr) {
            tar += '';
        } else {
            tar += src.charAt(i);
		}
    }

    return tar;
}

// 주민등록번호 체크
function gf_check_ssn(objValue) {
	var year   = objValue.substring(0,2);
    var month  = objValue.substring(2,4);
    var day    = objValue.substring(4,6);
	var sex    = objValue.substring(6,7);
	var result = false;

	if(sex=="1" || sex=="2") {
		year="19"+year;
	} else if(sex=="3" || sex=="4") {
		year="20"+year;
	}

    if(gf_isValidMonth(month) && gf_isValidDay(year, month, day)) {
		var check   = 0;
		var frontNo = objValue.substring(0, 6);
		var rearNo  = objValue.substring(6,13);

		for(var i=0; i<= 5; i++) {
			check = check + (( i % 8 + 2 )* parseInt(frontNo.substring(i,i+1)));
		}

		for(var i=6; i<=11; i++) {
			check = check + (( i % 8 + 2 )* parseInt(rearNo.substring(i-6,i-5)));
		}

		check = 11 - (check % 11);
		check = check % 10;

		if(check == parseInt(objValue.substring(12,13))) {
			result=true;
		}
	}

	//return result;
	return true;
}

// 사업자등록번호 체크
function gf_check_busino(vencod) {
	var sum = 0;
	var getlist = new Array(10);
	var chkvalue = new Array("1","3","7","1","3","7","1","3","5");
	var result = true;

	for(var i=0; i<10; i++) {
		getlist[i] = vencod.substring(i, i+1);
	}

	for(var i=0; i<9; i++) {
		sum += getlist[i]*chkvalue[i];
	}

	sum = sum + parseInt((getlist[8]*5)/10);
	sidliy = sum % 10;
	sidchk = 0;

	if(sidliy != 0) {
		sidchk = 10 - sidliy;
	} else {
		sidchk = 0;
	}

	if(sidchk != getlist[9]) {
		result = false;
	}

	//return result;
	return true;
}

// 법인등록번호 체크
function gf_validCorpNo(corpNo) {
    var pattern = /([0-9]{6})-?([0-9]{7})/;

    if(!pattern.test(corpNo)) {
        return false;
    }

    var val1 = 0;
    var val2 = 0;
    var val3 = 0;
    var chkDigit = new Array(1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2);

    for (var i = 0; i < 12; i++) {
        val1 = parseInt(corpNo.substring(i, i+1)) * chkDigit[i];

        if(val1 >= 10) {
            val2 += val1 % 10;
        } else {
            val2 += val1;
        }
    }

    val3 = val2 % 10;

    if(val3 > 0) {
        val3 = 10 - val3;
    } else {
        val3 = 0;
    }

    if(corpNo.substring(12, 13) != val3) {
        return false;
    } else {
        return true;
    }
}

// 이메일 체크
function gf_validEmail(arg_v) {
	var emailMatch = new RegExp(/^[_a-zA-Z0-9-.]+@[._a-zA-Z0-9-]+.[a-zA-Z]+$/);

	if(emailMatch.test(arg_v)) {
		return true;
	} else {
		return false;
	}
}

// 전화번호 체크
function gf_validPhone(sPhone) {
	var phonestr = /0\d{1,2}-\d{3,4}-\d{4}/;   // 전화번호 관련 체크 변수 정의

	if(sPhone.match(phonestr)) {
		return true;
	} else {
		return false;
	}
}

// 휴대폰 체크
function gf_validHp(arg_v) {
	var regExp = new RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);

	if(regExp.test(arg_v)) {
		return true;
	} else {
		return false;
	}
}

// 숫자만 입력하기
function gf_num_only() {
	e = window.event;

	if((48 <= e.keyCode && e.keyCode <= 57 || 96 <= e.keyCode && e.keyCode <= 105 || e.keyCode == 8 || e.keyCode == 46) ||
		 e.keyCode == 37 || e.keyCode == 39 || e.keyCode == 27 || e.keyCode == 8 || e.keyCode == 9) {
		return;
	} else {
		e.returnValue = false;
	}
}

// 숫자,'-'만 입력하기
function gf_phnum_only() {
	e = window.event;

	if((48 <= e.keyCode && e.keyCode <= 57 || 96 <= e.keyCode && e.keyCode <= 105 || e.keyCode == 8 || e.keyCode == 46) ||
		 e.keyCode == 37 || e.keyCode == 39 || e.keyCode == 27 || e.keyCode == 8 || e.keyCode == 9 ||
		 e.keyCode == 109 || e.keyCode == 189) {
		return;
	} else {
		e.returnValue = false;
	}
}

// O,X,/ 만 입력하기
function gf_char_only() {
	e = window.event;

	// tab, ctrl, c, v, back
	if(e.keyCode == 9 || e.keyCode == 17 || e.keyCode == 67 || e.keyCode == 86 || e.keyCode == 8
		|| e.keyCode == 79 || e.keyCode == 88 || e.keyCode == 191 || e.keyCode == 46) {
		return;
	} else {
		e.returnValue = false;
	}
}

// O,X,/ 만 입력하기
function gf_char_chk(aObj) {
	var chkData = aObj.value.toUpperCase();

	if(chkData.length == 2) {
		if(chkData!="O/" && chkData!="/O" && chkData!="/X") {
			aObj.value="";
		}
	}
}

// 2,1,0,-1,-2 만 입력하기
function gf_score_only() {
	e = window.event;

	// tab, ctrl, c, v, back
	if(e.keyCode == 9 || e.keyCode == 17 || e.keyCode == 67 || e.keyCode == 86 || e.keyCode == 8
		|| e.keyCode == 46 || e.keyCode == 48 || e.keyCode == 49 || e.keyCode == 50
		|| e.keyCode == 96 || e.keyCode == 97 || e.keyCode == 98 || e.keyCode == 109 || e.keyCode == 189) {
		return;
	} else {
		e.returnValue = false;
	}
}

// 2,1,0,-1,-2 만 입력하기
function gf_score_chk(aObj) {
	var scoreData = parseInt(aObj.value, 10);

	if(scoreData > 2 || scoreData < -2) {
		aObj.value="";
	}
}

// G,P,SN 만 입력하기
function gf_char_only2() {
	e = window.event;

	// tab, ctrl, c, v, back
	if(e.keyCode == 9 || e.keyCode == 17 || e.keyCode == 67 || e.keyCode == 86 || e.keyCode == 8
		|| e.keyCode == 46 || e.keyCode == 71 || e.keyCode == 78 || e.keyCode == 80 || e.keyCode == 83) {
		return;
	} else {
		e.returnValue = false;
	}
}

// G,P,SN 만 입력하기
function gf_char_chk2(aObj) {
	var chkData = aObj.value.toUpperCase();

	if(chkData.length == 2) {
		if(chkData!="SN") {
			aObj.value="";
		}
	}
}

// 1,2,3,4 만 입력하기
function gf_score_only2() {
	e = window.event;

	// tab, ctrl, c, v, back
	if(e.keyCode == 9 || e.keyCode == 17 || e.keyCode == 67 || e.keyCode == 86 || e.keyCode == 8
		|| e.keyCode == 46 || e.keyCode == 49 || e.keyCode == 50 || e.keyCode == 51 || e.keyCode == 52) {
		return;
	} else {
		e.returnValue = false;
	}
}

// 날짜 형식
function gf_dateFormat(obj) {
	var str  = obj.value.replace(/\-/gi, "");
	var leng = str.length;

	switch (leng) {
		case 4 : obj.value = str; break;
		case 6 : obj.value = str.substring(0, 4) + "-" + str.substring(4); break;
		case 8 : obj.value = str.substring(0, 4) + "-" + str.substring(4, 6) + "-" + str.substring(6);
		break;
	}
}

// 주민등록번호형식
function gf_regNoFormat(obj) {
	var str  = obj.value.replace(/\-/gi, "");
	var leng = str.length;

	switch (leng) {
		case 6 : obj.value = str; break;
		case 13 : obj.value = str.substring(0, 6) + "-" + str.substring(6);
		break;
	}
}

// 사업자번호형식
function gf_bizNoFormat(obj) {
	var str  = obj.value.replace(/\-/gi, "");
	var leng = str.length;

	switch (leng) {
		case 5 : obj.value = str.substring(0, 3) + "-" + str.substring(3); break;
		case 10 : obj.value = str.substring(0, 3) + "-" + str.substring(3, 5) + "-" + str.substring(5); break;
		default : obj.value = str;
	}
}

// 콤마처리-KEYDOWN
function gf_setComma(obj) {
	var new_num = "";
	var num = gf_removeChar(obj.value, ",") + new_num;

	for(var i=0;i<num.length;i++) {
		new_num = num.substr(num.length-i-1,1) + new_num;

		if(num.substr(num.length-i-2, 1) !=  "-") {
			if(((i + 1) % 3 == 0) && (((i + 1) != num.length))) {
				new_num = "," + new_num;
			}
		}
	}

	obj.value = new_num;
}

// 콤마처리
function gf_makeComma(value) {
	var new_num = "";
	var num = gf_removeChar(value, ",") + new_num;

	for(var i=0;i<num.length;i++) {
		new_num = num.substr(num.length-i-1,1) + new_num;

		if(num.substr(num.length-i-2, 1) !=  "-") {
			if(((i + 1) % 3 == 0) && (((i + 1) != num.length))) {
				new_num = "," + new_num;
			}
		}
	}

	return new_num;
}

// Data사이비교
function gf_ranageData(data1, data2) {
	var value1 = gf_removeChar(data1, "-");
	var value2 = gf_removeChar(data2, "-");

	if(parseInt(value1, 10) > parseInt(value2, 10)) {
		return false;
	}

	return true;
}

// Data사이비교
function gf_ranageData2(data1, data2) {
	var value1 = gf_removeChar(data1, "-");
	var value2 = gf_removeChar(data2, "-");

	if(parseInt(value1, 10) >= parseInt(value2, 10)) {
		return false;
	}

	return true;
}

// 분의범위를 체크한다
function gf_chkMin(aUseData, chkFieldNm) {
	if(aUseData == "") {
		return true;
	}

	var chkData = aUseData;

	if(aUseData.length==1) {
		chkData = "0" + aUseData;
	}

	chkData = parseInt(chkData, 10);

	if(chkData < 0 || chkData > 59) {
		return false;
	}

	return true;
}

// 두 날짜간 일수/개월수 차이 구하기
function gf_datedff(pStartDate, pEndDate, pType) {
	var strDt1 = gf_removeChar(pStartDate, "-");
	var strDt2 = gf_removeChar(pEndDate, "-");

	var strSDT = new Date(strDt1.substring(0,4),strDt1.substring(4,6)-1,strDt1.substring(6,8));
	var strEDT = new Date(strDt2.substring(0,4),strDt2.substring(4,6)-1,strDt2.substring(6,8));
	var strGapDT = 0;

	if(pType == "D") {  //일수 차이
	    strGapDT = (strEDT.getTime()-strSDT.getTime())/(1000*60*60*24);
	} else {            //개월수 차이
        // strGapDT = Math.floor((strEDT.getTime()-strSDT.getTime())/(1000*60*60*24*365.25/12));
		var yyyy1 = parseInt(strDt1.substring(0,4),10);
		var mm1 = parseInt(strDt1.substring(4,6),10);
		var dd1 = parseInt(strDt1.substring(6,8),10);
		var yyyy2 = parseInt(strDt2.substring(0,4),10);
		var mm2 = parseInt(strDt2.substring(4,6),10);
		var dd2 = parseInt(strDt2.substring(6,8),10);

	    // 년월이 같은경우
	    if(strDt1.substring(0,6) == strDt2.substring(0,6)) {
	    	if(dd1 == 1 && dd2 == gf_isLastDay(strDt2)) {
	    		strGapDT = 1;
	    	}
	    }
	    // 년도가 같은경우
	    else if(strDt1.substring(0,4) == strDt2.substring(0,4)) {
	    	strGapDT = mm2 - mm1;

	    	if(dd1 == 1 && dd2 == gf_isLastDay(strDt2)) {
	    		strGapDT = strGapDT + 1;
	    	} else if((dd1 - 1) > dd2) {
	    		strGapDT = strGapDT - 1;
	    	}
	    } else {
	    	strGapDT = (yyyy2 - yyyy1 - 1) * 12;

			// 1일부터 시작
			if(dd1 == 1) {
				strGapDT = strGapDT + 13 - mm1;
			} else {
				strGapDT = strGapDT + 12 - mm1;
			}

			strGapDT = strGapDT + mm2;

			if((dd1 - 1) > dd2) {
				strGapDT = strGapDT - 1;
			}
	    }
	}

	return strGapDT;
}

// 마지막일자
function gf_isLastDay(aDate) {
	var chkDate = gf_removeChar(aDate, "-");
	var yyyy = chkDate.substring(0,4);
	var m = parseInt(chkDate.substring(4,6),10) - 1;
	var end = new Array(31,28,31,30,31,30,31,31,30,31,30,31);

	if((yyyy % 4 == 0 && yyyy % 100 != 0) || yyyy % 400 == 0) {
		end[1] = 29;
	}

	return end[m];
}

function gf_fix_data(aData) {
	if(aData=="--") {
		return "";
	}

	return aData;
}

// DSKIM ///////////////////////////////////////////////

// 라디오버튼 값 구하기
function getRadioValue(obj) {
	if (obj.length) {
		for (var i=0; i<obj.length; ++i) {
			if (obj[i].checked) {
				return obj[i].value;
			}
		}
	} else {
		if (obj.checked) {
			return obj.value;
		}
	}
	return "";
}

// 라디오버튼 초기화하기
function clearRadioValue(obj) {
	for (var i=0; i<obj.length; ++i) {
		obj[i].checked = false;;
	}
}

// input 배열 합치기
function joinInputArr(obj, seperator) {
	var tmpObj = [];
	for (var i=0; i<obj.length; ++i) {
		tmpObj[i] = obj[i].value;
	}
	return tmpObj.join(seperator);
}

//checkbox 배열 합치기
function joinCheckBoxArr(obj, seperator) {
	if (obj) {
		if (obj.length) {
			var tmpObj = [];
			for (var i=0; i<obj.length; ++i) {
				if (obj[i].checked) {
					tmpObj[tmpObj.length] = obj[i].value;
				}
			}
			return tmpObj.join(seperator);
		} else {
			if (obj.checked) {
				return obj.value;
			} else {
				return "";
			}
		}
	} else {
		return "";
	}
}

//checkbox 배열 합치기
function joinCheckBoxArrAll(obj, seperator) {
	if (obj) {
		if (obj.length) {
			var tmpObj = [];
			for (var i=0; i<obj.length; ++i) {
				if (obj[i].checked) {
					tmpObj[tmpObj.length] = obj[i].value;
				} else {
					tmpObj[tmpObj.length] = "-";
				}
			}

			return tmpObj.join(seperator);
		} else {
			if (obj.checked) {
				return obj.value;
			} else {
				return "";
			}
		}
	} else {
		return "";
	}
}

function menu_folder(menu){
	var cmenu = document.getElementById(menu);
	if(cmenu.style.display == "none"){
		cmenu.style.display ="block";
		setCookie(menu,"open", 1);
	}else{
		cmenu.style.display = "none";
		setCookie(menu,"close", 1);
	}
}

function menu_folder_init(menuName,cnt){
	var cmenu = "";
	for(var i=1;i<=cnt; i++) {
		menu =  menuName+i;
		cmenu = document.getElementById(menu);
		if(getCookie(menu) != null && getCookie(menu) != "")
	 	{
	 		if(getCookie(menu) == "close"){
	 			cmenu.style.display ="none";
	 		}
	 	}
	}

}
