package cn.gx.controller;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gx.entity.Department;
import cn.gx.service.DepartmentService;
import cn.gx.util.TreeUtils;

import com.google.gson.Gson;

@Controller
@RequestMapping("/department")
public class DepartmentAction {
	@Resource
	private DepartmentService ds;
	
	@RequestMapping(value="/addDepartmentUI.do", method = RequestMethod.GET)
	public String addDepartmentUI(Model model){
		List<Department> tops=ds.getTopList();
		List<Department> departments = TreeUtils.getTree(tops,ds);
		model.addAttribute("departments", departments);
		return "/department/departmentUI";
	}
	
	@RequestMapping(value="/addDepartment.do", method = RequestMethod.POST)
	public String saveDepartment(Department department,Integer parentId){
		Department parent = ds.getDepartmentById(parentId);
		department.setParent(parent);
		ds.addDepartment(department);
		return "redirect:/department/departmentList.do";
	}
	
	
	@RequestMapping(value="/updateDepartment.do", method = RequestMethod.POST)
	public String updateDepartment(Department department,Integer parentId){
		Department parent = ds.getDepartmentById(parentId);
		department.setParent(parent);
		ds.updateDepartment(department);
		return "redirect:/department/departmentList.do";
	}
	
	
	@RequestMapping(value="/departmentList.do")
	public String departmentList (Model model){
		List<Department> tops=ds.getTopList();
		List<Department> parents = TreeUtils.getTree(tops,ds);
		model.addAttribute("parents", parents);
		List<Department> departments=ds.getDepartments();
		model.addAttribute("departments", new Gson().toJson(departments));
		return "/department/departmentList";
	}
}
