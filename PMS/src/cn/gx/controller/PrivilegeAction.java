package cn.gx.controller;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gx.entity.Privilege;
import cn.gx.service.PrivilegeService;
import cn.gx.util.TreeUtils;

import com.google.gson.Gson;

@Controller
@RequestMapping("/privilege")
public class PrivilegeAction {
	@Resource
	private PrivilegeService ps;
	
	@RequestMapping(value="/addPrivilegeUI.do", method = RequestMethod.GET)
	public String addPrivilegeUI(Model model){
		List<Privilege> tops=ps.getTopList();
		List<Privilege> privileges = TreeUtils.getTree(tops,ps);
		model.addAttribute("privileges", privileges);
		return "/privilege/privilegeUI";
	}
	
	@RequestMapping(value="/addPrivilege.do", method = RequestMethod.POST)
	public String addPrivilege(Privilege privilege,Integer parentId){
		Privilege parent = ps.getPrivilegeById(parentId);
		privilege.setParent(parent);
		ps.addPrivilege(privilege);
		return "redirect:/privilege/privilegeList.do";
	}
	
	
	@RequestMapping(value="/updatePrivilege.do", method = RequestMethod.POST)
	public String updatePrivilege(Privilege privilege,Integer parentId){
		Privilege parent = ps.getPrivilegeById(parentId);
		privilege.setParent(parent);
		ps.updatePrivilege(privilege);
		return "redirect:/privilege/privilegeList.do";
	}
	
	
	@RequestMapping(value="/privilegeList.do")
	public String privilegeList (Model model){
		List<Privilege> tops=ps.getTopList();
		List<Privilege> parents = TreeUtils.getTree(tops,ps);
		model.addAttribute("parents", parents);
		List<Privilege> privileges=ps.getPrivileges();
		model.addAttribute("privileges", new Gson().toJson(privileges));
		return "/privilege/privilegeList";
	}
}
