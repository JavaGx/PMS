package cn.gx.controller;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gx.entity.Department;
import cn.gx.entity.Privilege;
import cn.gx.entity.Role;
import cn.gx.service.DepartmentService;
import cn.gx.service.PrivilegeService;
import cn.gx.service.RoleService;
import cn.gx.util.TreeUtils;

import com.google.gson.Gson;

@Controller
@RequestMapping("/role")
public class RoleAction {
	@Resource 
	private RoleService rs;
	@Resource
	private DepartmentService ds;
	@Resource
	private PrivilegeService ps;
	
	@RequestMapping(value="/addRoleUI.do", method = RequestMethod.GET)
	public String addRoleUI(Model model){
		List<Department> tops=ds.getTopList();
		List<Department> departments = TreeUtils.getTree(tops,ds);
		model.addAttribute("departments", departments);
		return "/role/roleUI";
	}
	
	@RequestMapping(value="/addRole.do", method = RequestMethod.POST)
	public String saveRole(Role role,Integer departmentId){
		Department department = ds.getDepartmentById(departmentId);
		role.setDepartment(department);
		rs.addRole(role);
		return "redirect:/role/roleList.do";
	}
	
	
	@RequestMapping(value="/updateRole.do", method = RequestMethod.POST)
	public String updateRole(Role role,Integer departmentId){
		Department department = ds.getDepartmentById(departmentId);
		role.setDepartment(department);
		rs.updateRole(role);
		return "redirect:/role/roleList.do";
	}
	
	
	@RequestMapping(value="/roleList.do")
	public String roleList (Model model){
		List<Department> tops=ds.getTopList();
		List<Department> departments = TreeUtils.getTree(tops,ds);
		model.addAttribute("departments", departments);
		List<Role> roles=rs.getRoles();
		model.addAttribute("roles", new Gson().toJson(roles));
		return "/role/roleList";
	}
	
	@RequestMapping(value="/setPrivilegeUI.do")
	public String setPrivilegeUI (Integer roleId,Model model){
		List<Privilege> plist=rs.getPrivileges(roleId);
		String privilegeIds="";
		for(Privilege p:plist){
			privilegeIds+=p.getId();
		}
		Role role = rs.findRoleById(roleId);
		List<Privilege> tops=ps.getCascadeList();
		model.addAttribute("topMenu",tops);
		model.addAttribute("role", role);
		model.addAttribute("privilegeIds", privilegeIds);
		return "/role/privilegeUI";
	}
	
	@RequestMapping(value="/setPrivilege.do")
	public String setPrivilege(Integer roleId,Integer[] privilegeIds){
		Role role = rs.findRoleById(roleId);
		rs.setPrivilege(role,privilegeIds);
		return "redirect:/role/setPrivilegeUI.do?roleId="+roleId;
	}
}
