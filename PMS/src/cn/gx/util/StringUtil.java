package cn.gx.util;

import java.util.Calendar;
import java.util.Date;

public class StringUtil {
	public static boolean isNotBank(String s){
		if(s!=null&&s.trim().length()>0){
			return true;
		}
		return false;
	}
	
	public static boolean isBank(String s){
		if(s!=null&&s.trim().length()>0){
			return false;
		}
		return true;
	}
	
	public static String absolute(String s){
		return s==null?"":s;
	}
	
	
	public static String converII(int i){
		if(i<10)
			return "0"+i;
		else
			return String.valueOf(i);
	}
	
	
	public static String parseDate(Date date,int type){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		switch(type){
			case Calendar.YEAR:
				return String.valueOf(calendar.get(Calendar.YEAR));
			case Calendar.MONTH:
				return converII(calendar.get(Calendar.MONTH)+1);
			case Calendar.DAY_OF_MONTH:
				return converII(calendar.get(Calendar.DAY_OF_MONTH));
			case Calendar.HOUR_OF_DAY:
				return converII(calendar.get(Calendar.HOUR_OF_DAY));
			case Calendar.MINUTE:
				return converII(calendar.get(Calendar.MINUTE));
			default:
				return "";
		}
	}
}
