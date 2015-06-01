package cn.gx.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FileNameUtils {

	public static String getFileName(String file){
		if(file!=null&&!file.equals("")){
			String fileName = file.substring(0,file.lastIndexOf("."));
			String fileExt = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");
			String newFileName = df.format(new Date()) + "_" + fileName.hashCode() + "." + fileExt;
			return newFileName;
		}else{
			return null;
		}
		
	}
}
