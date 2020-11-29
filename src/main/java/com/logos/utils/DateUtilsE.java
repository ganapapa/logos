package com.logos.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

public class DateUtilsE {

	private static String defaultFormatString = "yyyyMMddHHmmss";
	private static DateFormat defaultFormatter = new SimpleDateFormat(defaultFormatString);
	private static Map<String, DateFormat> formatters = new HashMap<String, DateFormat>();

	private static DateFormat getFormatter(String format) {
		DateFormat formatter = formatters.get(format);
		if (formatter == null) {
			formatter = new SimpleDateFormat(format);
			formatters.put(format, new SimpleDateFormat(format));
		}
		return formatter;
	}

	public synchronized static String getTime(Date date) {
		return defaultFormatter.format(date);
	}

	public synchronized static Date getTime(String date) throws ParseException {
		return defaultFormatter.parse(date);
	}

	public synchronized static String getTime(Date date, String format) {
		if (date == null) {
			return null;
		}
		return getFormatter(format).format(date);
	}

	public synchronized static Date getTime(String date, String format) throws ParseException {
		if (date == null || date.length() == 0) {
			return null;
		}
		return getFormatter(format).parse(date);
	}

	public synchronized static String getTime(String date, String beforeFormat, String afterFormat) throws ParseException {
		return getTime(getTime(date, beforeFormat), afterFormat);
	}

	public synchronized static String getExactTime(String date, long unitMills) throws ParseException {
		return getExactTime(defaultFormatter.parse(date), unitMills);
	}

	public synchronized static String getExactTime(String date, long unitMills, String format) throws ParseException {
		return getExactTime(getFormatter(format).parse(date), unitMills, format);
	}

	public synchronized static String getExactTime(Date date, long unitMills) {
		int offset = TimeZone.getDefault().getRawOffset();
		Date exactDate = new Date((date.getTime() + offset) / unitMills * unitMills - offset);
		return defaultFormatter.format(exactDate);
	}

	public synchronized static String getExactTime(Date date, long unitMills, String format) {
		int offset = TimeZone.getDefault().getRawOffset();
		Date exactDate = new Date((date.getTime() + offset) / unitMills * unitMills - offset);
		return getFormatter(format).format(exactDate);
	}

	public synchronized static String addTime(Date date, long unitMills, String format) throws ParseException {
		int offset = TimeZone.getDefault().getRawOffset();
		Date exactDate = new Date((date.getTime() + offset) / unitMills * unitMills - offset);
		return getFormatter(format).format(exactDate);
	}

	public synchronized static String getCurrentTime() {
		return defaultFormatter.format(new Date());
	}

	public synchronized static String getCurrentTime(String format) {
		return getFormatter(format).format(new Date());
	}

	public synchronized static String getWeek(String date) throws ParseException {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(defaultFormatter.parse(date.substring(0, 8) + "000000"));
		calendar.setMinimalDaysInFirstWeek(1);
		String strWeek = "00" + calendar.get(Calendar.WEEK_OF_MONTH);
		return date.substring(0, 6) + strWeek.substring(strWeek.length() - 2);
	}

	public synchronized static String getWeekFirstDay(String date) throws ParseException {
		return getWeekFirstDay(date, false);
	}

	public synchronized static String getWeekFirstDay(String date, boolean isSameMonth) throws ParseException {
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		calendar1.setTime(defaultFormatter.parse(date.substring(0, 8) + "000000"));
		calendar2 = (Calendar) calendar1.clone();
		calendar2.setFirstDayOfWeek(Calendar.SUNDAY);
		calendar2.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		if (isSameMonth == true && calendar1.get(Calendar.MONTH) != calendar2.get(Calendar.MONTH)) {
			calendar1.set(Calendar.DAY_OF_MONTH, 1);
			return defaultFormatter.format(calendar1.getTime()).substring(0, 8);
		} else {
			return defaultFormatter.format(calendar2.getTime()).substring(0, 8);
		}
	}

	public synchronized static String getWeekLastDay(String date) throws ParseException {
		return getWeekLastDay(date, false);
	}

	public synchronized static String getWeekLastDay(String date, boolean isSameMonth) throws ParseException {
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		calendar1.setTime(defaultFormatter.parse(date.substring(0, 8) + "000000"));
		calendar2 = (Calendar) calendar1.clone();
		calendar2.setFirstDayOfWeek(Calendar.SUNDAY);
		calendar2.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		if (isSameMonth == true && calendar1.get(Calendar.MONTH) != calendar2.get(Calendar.MONTH)) {
			calendar1.set(Calendar.DAY_OF_MONTH, calendar1.getActualMaximum(Calendar.DAY_OF_MONTH));
			return defaultFormatter.format(calendar1.getTime()).substring(0, 8);
		} else {
			return defaultFormatter.format(calendar2.getTime()).substring(0, 8);
		}
	}

	public synchronized static String addTime(String date, long mills) throws ParseException {
		return defaultFormatter.format(new Date(defaultFormatter.parse(date).getTime() + mills));
	}

	public synchronized static String addTime(String date, long mills, String format) throws ParseException {
		return getFormatter(format).format(new Date(getFormatter(format).parse(date).getTime() + mills));
	}

	public synchronized static int calcAge(String date, String format) throws ParseException {
		if (date == null || date.length() == 0) {
			return -1;
		}

		try {
			String currDate = DateUtilsE.getCurrentTime(format);
			int age = Integer.parseInt(currDate.substring(0, 4)) - Integer.parseInt(date.substring(0, 4));
			if (currDate.substring(4).compareTo(date.substring(4)) < 0) {
				--age;
			}
			return age;
		} catch (Exception e) {
			return -1;
		}
	}

	public synchronized static String getMonthLastDay(String date, String format) throws ParseException {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(getTime(date, format));
		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return getTime(calendar.getTime(), format);
	}

	public synchronized static long getDiff(String date1, String date2, String format) throws ParseException {
		Date d1 = getTime(date1, format);
		Date d2 = getTime(date2, format);
		return d2.getTime() - d1.getTime();
	}

	public synchronized static int getDiffDay(String date1, String date2, String format) throws ParseException {
		Date d1 = getTime(date1, format);
		Date d2 = getTime(date2, format);
		return (int) ((d2.getTime() - d1.getTime()) / 86400000);
	}

	public synchronized static String addDate(String date, int days) throws ParseException {
		return addDate(date, days, defaultFormatString);
	}

	public synchronized static String addDate(String date, int days, String format) throws ParseException {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(getFormatter(format).parse(date));
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) + days);
		return getFormatter(format).format(calendar.getTime());
	}

	public synchronized static String addMonth(String date, int months) throws ParseException {
		return addMonth(date, months, defaultFormatString);
	}

	public synchronized static String addMonth(String date, int months, String format) throws ParseException {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(getFormatter(format).parse(date));
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + months);
		return getFormatter(format).format(calendar.getTime());
	}
}
