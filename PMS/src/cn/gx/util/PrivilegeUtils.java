package cn.gx.util;

import java.util.ArrayList;
import java.util.List;

import cn.gx.entity.Privilege;

public class PrivilegeUtils {

	public static List<Integer> getPrivilegeIds(List<Privilege> old){
		List<Integer> data=new ArrayList<Integer>();
		for(Privilege privilege:old){
			data.add(privilege.getId());
		}
		return data;
	}
}
