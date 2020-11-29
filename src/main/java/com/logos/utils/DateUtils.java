package com.logos.utils;

import java.text.ParseException;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtils {

	//강창순 추가
	//금일 날짜 구하기
	public static String getToday()
	{
		// 윤년 계산 그레고리안 달력
		GregorianCalendar gc = new GregorianCalendar();
		
		String result = "";
		String[] dateTmp = new String[6];

		dateTmp[0] = Integer.valueOf(gc.get(gc.YEAR)).toString();	// 년
		dateTmp[1] = Integer.valueOf(gc.get(gc.MONTH) + 1).toString();	// 월
		dateTmp[2] = Integer.valueOf(gc.get(gc.DATE)).toString();	// 일
		dateTmp[3] = Integer.valueOf(gc.get(gc.HOUR)).toString();	// 시
		dateTmp[4] = Integer.valueOf(gc.get(gc.MINUTE)).toString();	// 분
		dateTmp[5] = Integer.valueOf(gc.get(gc.SECOND)).toString();	// 초
		
		int dateSize = dateTmp.length;
		
		// 월, 일, 시 , 분, 초 날짜 자릿수가 1자리 일경우 2자리로 변경 ( 년(연) 은 해당안됨. )
		// 반환값에다가 넣어줌. 반환값 : 문자형으로 ( ex : 20130903110000 ) 반환 
		for(int i=0;i<dateSize;i++)
		{
			// 자릿수가 2자리 미만일경우 앞에 '0'을 붙임
			if(dateTmp[i].length() < 2 && i != 0)
			{
				dateTmp[i] = "0".concat(dateTmp[i]);
			}
			
			result += dateTmp[i].toString();
			
		}
		
		return result;
	}
	
	private static String getString(String val) {
		if (val == null) {
			return "";
		} else {
			return val;
		}
	}

	public static String getTime(Date date) {
		try {
			return getString(DateUtilsE.getTime(date));
		} catch (Exception e) {
			return "";
		}
	}

	public static Date getTime(String date) {
		try {
			return DateUtilsE.getTime(date);
		} catch (Exception e) {
			return null;
		}
	}

	public static String getTime(Date date, String format) {
		try {
			return getString(DateUtilsE.getTime(date, format));
		} catch (Exception e) {
			return "";
		}
	}

	public static Date getTime(String date, String format) {
		try {
			return DateUtilsE.getTime(date, format);
		} catch (Exception e) {
			return null;
		}
	}

	public static String getTime(String date, String beforeFormat, String afterFormat) {
		try {
			return getString(DateUtilsE.getTime(date, beforeFormat, afterFormat));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getExactTime(String date, long unitMills) {
		try {
			return getString(DateUtilsE.getExactTime(date, unitMills));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getExactTime(String date, long unitMills, String format) {
		try {
			return getString(DateUtilsE.getExactTime(date, unitMills, format));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getExactTime(Date date, long unitMills) {
		try {
			return getString(DateUtilsE.getExactTime(date, unitMills));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getExactTime(Date date, long unitMills, String format) {
		try {
			return getString(DateUtilsE.getExactTime(date, unitMills, format));
		} catch (Exception e) {
			return "";
		}
	}

	public static String addTime(Date date, long unitMills, String format) {
		try {
			return getString(DateUtilsE.addTime(date, unitMills, format));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getCurrentTime() {
		try {
			return getString(DateUtilsE.getCurrentTime());
		} catch (Exception e) {
			return "";
		}
	}

	public static String getCurrentTime(String format) {
		try {
			return getString(DateUtilsE.getCurrentTime(format));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getWeek(String date) {
		try {
			return getString(DateUtilsE.getWeek(date));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getWeekFirstDay(String date) {
		try {
			return getString(DateUtilsE.getWeekFirstDay(date));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getWeekFirstDay(String date, boolean isSameMonth) {
		try {
			return getString(DateUtilsE.getWeekFirstDay(date, isSameMonth));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getWeekLastDay(String date) throws ParseException {
		try {
			return getString(DateUtilsE.getWeekLastDay(date));
		} catch (Exception e) {
			return "";
		}
	}

	public static String getWeekLastDay(String date, boolean isSameMonth) {
		try {
			return getString(DateUtilsE.getWeekLastDay(date, isSameMonth));
		} catch (Exception e) {
			return "";
		}
	}

	public static String addTime(String date, long mills) {
		try {
			return getString(DateUtilsE.addTime(date, mills));
		} catch (Exception e) {
			return "";
		}
	}

	public static String addTime(String date, long mills, String format) {
		try {
			return getString(DateUtilsE.addTime(date, mills, format));
		} catch (Exception e) {
			return "";
		}
	}

	public static int calcAge(String date, String format) {
		try {
			return DateUtilsE.calcAge(date, format);
		} catch (Exception e) {
			return -1;
		}
	}

	public static String getMonthLastDay(String date, String format) {
		try {
			return getString(DateUtilsE.getMonthLastDay(date, format));
		} catch (Exception e) {
			return "";
		}
	}

	public static long getDiff(String date1, String date2, String format) {
		try {
			return DateUtilsE.getDiff(date1, date2, format);
		} catch (Exception e) {
			return 0;
		}
	}

	public static int getDiffDay(String date1, String date2, String format) {
		try {
			return DateUtilsE.getDiffDay(date1, date2, format);
		} catch (Exception e) {
			return 0;
		}
	}

	public static String addDate(String date, int days) {
		try {
			return getString(DateUtilsE.addDate(date, days));
		} catch (Exception e) {
			return "";
		}
	}

	public static String addDate(String date, int days, String format) {
		try {
			return getString(DateUtilsE.addDate(date, days, format));
		} catch (Exception e) {
			return "";
		}
	}

	public static String addMonth(String date, int months) {
		try {
			return getString(DateUtilsE.addMonth(date, months));
		} catch (Exception e) {
			return "";
		}
	}

	public static String addMonth(String date, int months, String format) {
		try {
			return getString(DateUtilsE.addMonth(date, months, format));
		} catch (Exception e) {
			return "";
		}
	}
}
