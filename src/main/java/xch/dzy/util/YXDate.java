package xch.dzy.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class YXDate {
	private static Calendar getCalendar() {
		TimeZone tz = TimeZone.getDefault();
		return Calendar.getInstance(tz);
	}

	public static String getYear() {
		return String.valueOf(getCalendar().get(1));
	}

	public static String getMonth() {
		return strFormat(getCalendar().get(2) + 1);
	}

	public static String getDay() {
		return strFormat(getCalendar().get(5));
	}

	public static String getFormatDate(String separator) {
		return getYear() + separator + getMonth() + separator + getDay();
	}

	public static String getHour() {
		return strFormat(getCalendar().get(11));
	}

	public static String getMinute() {
		return strFormat(getCalendar().get(12));
	}

	public static String getSecond() {
		return strFormat(getCalendar().get(13));
	}

	public static String getDateTime(String s1, String s2) {
		return getYear() + s1 + getMonth() + s1 + getDay() + " " + getHour()
				+ s2 + getMinute() + s2 + getSecond();
	}

	public static String getDateTime2(String s1, String s2) {
		return getYear() + s1 + getMonth() + s1 + getDay() + getHour() + s2
				+ getMinute() + s2 + getSecond();
	}

	public static String getTime(String s1) {
		return getHour() + s1 + getMinute() + s1 + getSecond();
	}

	public static String getTime() {
		return String.valueOf(System.currentTimeMillis() / 1000L);
	}

	public static String getTimeToday() {
		long now = System.currentTimeMillis() / 1000L;

		return String.valueOf(now);
	}

	private static String strFormat(int data) {
		String str = String.valueOf(data);
		if (data <= 9) {
			str = "0" + str;
		}
		return str;
	}

	public static String TimeStamp2DateTime(String timestampString) {
		Long timestamp = Long.valueOf(timestampString.length() < 13 ? Long
				.parseLong(timestampString) * 1000L : Long
				.parseLong(timestampString));
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date(timestamp.longValue()));
		return date;
	}

	public static String TimeStamp2Date(String timestampString) {
		Long timestamp = Long.valueOf(timestampString.length() < 13 ? Long
				.parseLong(timestampString) * 1000L : Long
				.parseLong(timestampString));
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date(
				timestamp.longValue()));
		return date;
	}

	public static String TimeStamp2Date_month(String timestamp2String) {
		Long timestamp = Long.valueOf(Long.parseLong(timestamp2String) * 1000L);
		String date = new SimpleDateFormat("yyyy-MM").format(new Date(timestamp
				.longValue()));
		return date;
	}

	public static String timestampFormat(String timestampString, String format){
		Long timestamp = Long.valueOf(timestampString.length() < 13 ? Long
				.parseLong(timestampString) * 1000L : Long
				.parseLong(timestampString));
		return new SimpleDateFormat(format).format(new Date(timestamp.longValue()));
	}
	
	public static String date2TimeStamp(String date) {
		try {
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
			Date s = dateformat.parse(date);
			return String.valueOf(s.getTime() / 1000L);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String dateTime2TimeStamp(String date) {
		try {
			SimpleDateFormat dateformat = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			Date s = dateformat.parse(date);
			return String.valueOf(s.getTime() / 1000L);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getTimeDayLastSecond() {
		return dateTime2TimeStamp(TimeStamp2Date(String.valueOf(System
				.currentTimeMillis())) + " 23:59:59");
	}

	public static String getMonthTime(int month) {
		Calendar cal = Calendar.getInstance();
		cal.add(2, month);
		String timeStamp = String.valueOf(cal.getTimeInMillis() / 1000L);
		return timeStamp;
	}
	
	public static String getMonthTime1(int month) {
		Calendar cal = Calendar.getInstance();
		cal.add(2, month);
		cal.add(Calendar.MINUTE, -20);
		String timeStamp = String.valueOf(cal.getTimeInMillis() / 1000L);
		return timeStamp;
	}

	public static String getDayTime(int days) {
		Calendar cal = Calendar.getInstance();
		cal.add(6, days);
		String timeStamp = String.valueOf(cal.getTimeInMillis() / 1000L);
		return timeStamp;
	}

	public static String getYearTime(int years) {
		Calendar cal = Calendar.getInstance();
		cal.add(1, years);
		String timeStamp = String.valueOf(cal.getTimeInMillis() / 1000L);
		return timeStamp;
	}

	public static String getYearTime(long timeStamp1, int years) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(timeStamp1 * 1000L);
		cal.add(1, years);
		String timeStamp = String.valueOf(cal.getTimeInMillis() / 1000L);
		return timeStamp;
	}

	public static int lateDays(long time) {
		Calendar c = Calendar.getInstance();
		Calendar nowTime = Calendar.getInstance();
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = format.parse(format.format(Long.valueOf(String.valueOf(
					time).length() < 13 ? time * 1000L : time)));
			c.setTime(date);
			long now = System.currentTimeMillis();
			Date date2 = format.parse(format.format(Long.valueOf(now)));
			nowTime.setTime(date2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return countDays(c, nowTime);
	}

	public static int lateDays(long time1, long time2) {
		Calendar c = Calendar.getInstance();
		Calendar nowTime = Calendar.getInstance();
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = format.parse(format.format(Long.valueOf(String.valueOf(
					time1).length() < 13 ? time1 * 1000L : time1)));
			c.setTime(date);

			Date date2 = format.parse(format.format(Long.valueOf(String
					.valueOf(time2).length() < 13 ? time2 * 1000L : time2)));
			nowTime.setTime(date2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return countDays(c, nowTime);
	}

	public static int countDays(Calendar c_b, Calendar c_e) {
		int days = 0;
		while (c_b.before(c_e)) {
			days++;
			c_b.add(6, 1);
		}
		return days;
	}

	public static String getOffsetMonthDate(Date protoDate, int monthOffset) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(protoDate);
		cal.add(2, -monthOffset);
		System.out.println(cal.get(2));
		Date date = cal.getTime();
		return new SimpleDateFormat("yyyy-MM").format(date);
	}

	public static String getLastMonth(int month) {
		return getYear() + "-" + strFormat(getCalendar().get(2) + 1 - month);
	}

	public static void main(String[] args) {
		System.out.println(getTime() + "+11111111+" + (new Date().getTime())
				/ 1000);
		System.out.println(new SimpleDateFormat("yyyyMMdd HHmmss")
				.format(new Date()));
		System.out
				.println(date2TimeStamp(TimeStamp2Date_month(getMonthTime(-1))
						+ "-01"));
		System.out.println(TimeStamp2Date("1362067200000"));
		System.out.println(lateDays(1365375608L));

		System.out.println(getDateTime("", ""));
	}
}
