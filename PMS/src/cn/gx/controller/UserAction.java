package cn.gx.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gx.entity.Department;
import cn.gx.entity.PageBean;
import cn.gx.entity.Privilege;
import cn.gx.entity.Reply;
import cn.gx.entity.Role;
import cn.gx.entity.User;
import cn.gx.entity.Warning;
import cn.gx.service.DepartmentService;
import cn.gx.service.ReplyService;
import cn.gx.service.RoleService;
import cn.gx.service.UserService;
import cn.gx.util.SessionUtils;
import cn.gx.util.TreeUtils;

import com.google.gson.Gson;

@Controller
@RequestMapping("/user")
public class UserAction {
	
	@Resource
	private UserService us;
	@Resource
	private RoleService rs;
	@Resource
	private DepartmentService ds;
	@Resource
	private ReplyService replyService;
	//登录成功
	@RequestMapping(value = "/index.do")
	public String index(){
		return "main/main";
	}
	
	//登录认证
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(User user,HttpServletRequest request, Model model){
			int code=0;
			User currentuser = us.selectUserByUsername(user.getUsername());
			if(currentuser == null){
				code=1;
			}else if(user.getPassword() == null || !currentuser.getPassword().equals(user.getPassword())){
				code=2;
			}else{
				List<Privilege> old= rs.getPrivileges(currentuser.getRole().getId());
				String[] urls=new String[old.size()];
				int index=0;
				for(Privilege p:old){
					urls[index]=p.getUrl();
					index++;
				}
				currentuser.setUserUrls(urls);
				request.getSession().setAttribute("user", currentuser);
			}
		
		if(code != 0){
			model.addAttribute("errcode",code);
			return "/user/login";
		}else{
			return "redirect:/user/index.do"; 
		}
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(User user){
		if(user!=null){
			user.setImage("userImages/1.jpg");
			
			Integer userId = us.register(user);
			Role role = rs.findRoleById(20);
			user.setId(userId);
			user.setRole(role);
			us.assignGuest(user);
		}
		return "/user/login";
	}
	
	@RequestMapping(value = "/home.do")
	public String home(){
		return "/user/home";
	}
	
	@RequestMapping(value = "/info.do")
	public String info(){
		return "/user/info";
	}
	
	@RequestMapping(value = "/detailedUser.do")
	public String detailedUser(Integer id,Model model){
		User user = us.findUserById(id);
		model.addAttribute("pointUser", user);
		return "/user/pointUserInfo";
	}
	
	@RequestMapping(value = "/ownWarn.do")
	public String ownWarn(Model model,int num,HttpServletRequest request){
		User user = SessionUtils.getUser(request);
		PageBean page=us.findPageWarn(num,user.getId());
		List<Warning> warnings=page.getRecords();
		Map<Integer,Integer> replyNum=new HashMap<Integer,Integer>();
		for(Warning warning:warnings){
			List<Reply> list = replyService.selectReplyByWarnId(warning.getId());
			replyNum.put(warning.getId(), list.size());
		}
		model.addAttribute("replyNum", replyNum);
		model.addAttribute("warnings", warnings);
		model.addAttribute("num", num);
		model.addAttribute("totalPages", page.getTotalPages());
		return "/user/ownWarn";
		
	}

	//我的回复
	@RequestMapping(value="/ownReply.do")
	public String ownReply(int num,HttpServletRequest request,Model model){
		PageBean page=replyService.findOwnReply(SessionUtils.getUser(request).getId(),num);
		List<Reply> replies=page.getRecords();
		Collections.sort(replies, new Comparator<Reply>(){
			@Override
			public int compare(Reply o1, Reply o2) {
				return o2.getWarning().getStarttime().compareTo(o1.getWarning().getStarttime());
			}
		});
		model.addAttribute("replies", replies);
		model.addAttribute("num", num);
		model.addAttribute("totalPages", page.getTotalPages());
		return "/user/ownReply";
	}
	
	@RequestMapping(value = "/updateUserUI.do")
	public String updateUserUI(){
		return "/user/infoUI";
	}
	
	
	@RequestMapping(value = "/updateUser.do")
	public String updateUser(User user,HttpServletRequest request,Model model){
		us.updateUser(user);
		User currentuser = us.findUserById(user.getId());
		request.getSession().setAttribute("user", currentuser);
		model.addAttribute("msg", "<font color='red'>保存成功</font>");
		return "/user/info";
	}
	
	@RequestMapping(value = "/assignUser.do")
	public String assignUser(User user,Integer roleId,Integer departmentId){
		Role role=rs.findRoleById(roleId);
		Department department = ds.getDepartmentById(departmentId);
		user.setRole(role);
		user.setDepartment(department);
		us.assignUser(user);
		return "redirect:/user/userList.do";
	}
	
	@RequestMapping(value = "/deleteUser.do")
	public String deleteUser(Integer userId){
		us.deleteUser(userId);
		return "redirect:/user/userList.do";
	}
	
	@RequestMapping(value = "/userList.do")
	public String userList(Model model){
		List<Department> tops=ds.getTopList();
		List<Department> departments = TreeUtils.getTree(tops,ds);
		model.addAttribute("departments", departments);
		List<Role> roles = rs.getRoles();
		model.addAttribute("roles", roles);
		List<User> users = us.findUsers();
		model.addAttribute("users", new Gson().toJson(users));
		return "/user/userList";
	}
	
	//设置头像界面
	@RequestMapping(value = "/settingImageUI.do", method = RequestMethod.GET)
	public String settingImageUI() {
		return "user/settingImageUI";
	}
	
	//设置头像
	@RequestMapping(value = "/settingImage.do")
	public void settingImage(HttpServletRequest request,HttpServletResponse response) {
		String savePath ="D:/study/nginx/style/userImages";
		File saveurl=new File(savePath);
		if(!saveurl.exists()&&!saveurl.isDirectory()){
			saveurl.mkdirs();
		}
		
		//定义允许上传的文件扩展名
		String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};
		//最大文件大小
		long maxSize = 1000000;

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e2) {
			e2.printStackTrace();
		}
		
		Map<String,Object> obj=new HashMap<String, Object>();
		Gson gson = new Gson();
		String json=null;
		obj.put("error", 1);
		
		
		if(!ServletFileUpload.isMultipartContent(request)){
			obj.put("message", "请选择文件。");
			json=gson.toJson(obj);
			writer.println(json);
			return;
		}
		//检查目录
		File uploadDir = new File(savePath);
		if(!uploadDir.isDirectory()){
			obj.put("message", "上传目录不存在。");
			json=gson.toJson(obj);
			writer.println(json);
			return;
		}
		//检查目录写权限
		if(!uploadDir.canWrite()){
			obj.put("message", "上传目录没有写权限。");
			json=gson.toJson(obj);
			writer.println(json);
			return;
		}

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		List items=null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
		Iterator itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			String fileName = item.getName();
			obj.put("url", fileName);
			long fileSize = item.getSize();
			if (!item.isFormField()) {
				//检查文件大小
				if(item.getSize() > maxSize){
					obj.put("message", "上传文件大小超过限制。");
					json=gson.toJson(obj);
					writer.println(json);
					return;
				}
				String file = fileName.substring(0,fileName.lastIndexOf("."));
				//检查扩展名
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				if(!Arrays.<String>asList(fileTypes).contains(fileExt)){
					obj.put("message", "上传文件扩展名是不允许的扩展名。");
					json=gson.toJson(obj);
					writer.println(json);
					return;
				}
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");
				String newFileName = df.format(new Date()) + "_" + file.hashCode() + "." + fileExt;
				try{
					File uploadedFile = new File(savePath, newFileName);
					
					item.write(uploadedFile);
					User user = SessionUtils.getUser(request);
					user.setImage("userImages/"+newFileName);
					us.settingImage(user);
					
				}catch(Exception e){
					e.printStackTrace();
					obj.put("message", "上传文件失败。");
					json=gson.toJson(obj);
					writer.println(json);
					return;
				}

			}
		}
		
		obj.remove("error");
		obj.put("error", 0);
		obj.put("message", "上传成功。");
		json=gson.toJson(obj);
		writer.println(json);
	}
	
	//改密界面
	@RequestMapping(value = "/modifyPasswordUI.do", method = RequestMethod.GET)
	public String password() {
		return "user/passwordUI";
	}
	
	@RequestMapping(value = "/modifyPassword.do", method = RequestMethod.POST)
	public String modifyPassword(User user,String oldPassword,HttpServletRequest request,Model model) {
		User currentUser=SessionUtils.getUser(request);
		if(user.getPassword().equals(oldPassword)){
			
			us.updatePassword(user);
			currentUser.setPassword(user.getPassword());
			request.getSession().setAttribute("user", currentUser);
			return "redirect:/user/index.do"; 
		}else{
			model.addAttribute("error", "密码不正确！");
			return "/user/asswordUI";
		}
	}
	
	//退出
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "/user/login";
	}
}
