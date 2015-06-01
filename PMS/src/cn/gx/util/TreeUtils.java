package cn.gx.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import cn.gx.entity.Department;
import cn.gx.entity.Privilege;
import cn.gx.service.DepartmentService;
import cn.gx.service.PrivilegeService;

public class TreeUtils {
	
	public static List<Department> getTree(List<Department> topList,DepartmentService ds){
		List<Department> list=new ArrayList<Department>();
		getTreeList(topList,"",list,ds);
		return list;
	}
	
	private static void getTreeList(Collection<Department> topList,String s,List<Department> list,DepartmentService ds){
		 
		if(topList!=null&&topList.size()>0){
			for(Department dept:topList){
				Department d=new Department();
				d.setId(dept.getId());
				d.setName(s+"┣"+dept.getName());
				list.add(d);
				Integer id = dept.getId();
				List<Department> children=ds.getDepartmentsByPid(id);
				getTreeList(children,"　"+s,list,ds);
			}
		}
	}

	public static List<Privilege> getTree(List<Privilege> tops,
			PrivilegeService ps) {
		List<Privilege> list=new ArrayList<Privilege>();
		getTreeList(tops,"",list,ps);
		return list;
	}

	private static void getTreeList(List<Privilege> tops, String s,
			List<Privilege> list, PrivilegeService ps) {
		if(tops!=null&&tops.size()>0){
			
			for(Privilege privilege:tops){
				Privilege p=new Privilege();
				p.setId(privilege.getId());
				p.setName(s+"┣"+privilege.getName());
				list.add(p);
				Integer id = privilege.getId();
				List<Privilege> children=ps.getPrivilegesByPid(id);
				getTreeList(children,"　"+s,list,ps);
			}
		}
	}
}
