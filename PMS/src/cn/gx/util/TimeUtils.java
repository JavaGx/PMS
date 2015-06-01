package cn.gx.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {

	public static String getTime(){
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return d.format(new Date());
	}
}
