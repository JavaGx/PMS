package cn.gx.util;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	public static int[] parseDate(Date date){
		if(date!=null){
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			return new int[]{
				cal.get(Calendar.YEAR),
				cal.get(Calendar.MONTH)+1,
				cal.get(Calendar.DAY_OF_MONTH),
				cal.get(Calendar.HOUR_OF_DAY),
				cal.get(Calendar.MINUTE),
				cal.get(Calendar.SECOND)
			};
	  }else{
		  return new int[]{0,0,0,0,0,0};
	  }
	}
}
