package cn.gx.controller;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import cn.gx.entity.Demand;
import cn.gx.entity.Project;
import cn.gx.entity.User;
import cn.gx.service.DemandService;
import cn.gx.service.ProjectService;
import cn.gx.service.UserService;
import cn.gx.util.SessionUtils;
import cn.gx.util.TimeUtils;

@Controller
@RequestMapping("/demand")
public class DemandAction {
	@Resource 
	private DemandService ds;
	@Resource
	private ProjectService ps;
	@Resource
	private UserService us;
	
	//添加需求单页面显示
	@RequestMapping(value="/addDemandUI.do", method = RequestMethod.GET)
	public String addDemandUI(Model model,Integer projectId){
		Project project=ps.getProject(projectId);
		List<User> users=us.getMembers(project.getDepartment().getId());
		model.addAttribute("users", users);
		model.addAttribute("project", project);
		return "/demand/demandUI";
	}
	
	//添加需求
	@RequestMapping(value="/addDemand.do", method = RequestMethod.POST)
	public String savedemand(HttpServletRequest request,Demand demand,Integer projectId,Integer appointPersonId){
		demand.setStarttime(TimeUtils.getTime());
		User appointPerson=us.findUserById(appointPersonId);
		demand.setAppointPerson(appointPerson);
		demand.setApplicant(SessionUtils.getUser(request));
		Project project=ps.getProject(projectId);
		demand.setProject(project);
		ds.addDemand(demand);
		return "redirect:/demand/demandList.do?projectId="+projectId;
	}
	
	
	//修改需求单
	@RequestMapping(value="/updateDemand.do", method = RequestMethod.POST)
	public String updatedemand (Demand demand,Integer appointPersonId,Integer projectId){
		demand.setUpdatetime(TimeUtils.getTime());
		User appointPerson=us.findUserById(appointPersonId);
		demand.setAppointPerson(appointPerson);
		ds.updateDemand(demand);
		return "redirect:/demand/demandList.do?projectId="+projectId;
	}
	
	
	@RequestMapping(value="/demandList.do")
	public String demandList (Integer projectId,Model model){
		List<Demand> demands = ds.getDemands(projectId);
		Project project=ps.getProject(projectId);
		List<User> users=us.getMembers(project.getDepartment().getId());
		model.addAttribute("project", project);
		model.addAttribute("users", users);
		model.addAttribute("demands", new Gson().toJson(demands));
		return "/demand/demandList";
	}
}
