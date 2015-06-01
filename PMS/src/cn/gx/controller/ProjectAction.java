package cn.gx.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.gx.entity.Demand;
import cn.gx.entity.Department;
import cn.gx.entity.Project;
import cn.gx.service.DemandService;
import cn.gx.service.DepartmentService;
import cn.gx.service.ProjectService;
import cn.gx.util.SessionUtils;

import com.google.gson.Gson;

@Controller
@RequestMapping("/project")
public class ProjectAction {
	
	@Resource
	private ProjectService ps;
	@Resource
	private DepartmentService ds;
	@Resource
	private DemandService demandService;

	@RequestMapping("/addProjectUI.do")
	public String projectUI(Model model){
		List<Department> departments = ds.getDepartments();
		model.addAttribute("departments", departments);
		return "project/projectUI";
	}
	
	//上传附件
	@RequestMapping(value="/uploadFile.do")
	public void uploadImage (HttpServletRequest request,HttpServletResponse response){
		//文件保存目录路径
		//String savePath =request.getServletContext().getRealPath("/")+"userImages";
		String savePath ="D:/study/nginx/style/file";
		File saveurl=new File(savePath);
		if(!saveurl.exists()&&!saveurl.isDirectory()){
			saveurl.mkdirs();
		}
		

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
			//long fileSize = item.getSize();
			if (!item.isFormField()) {
				
				//String file = fileName.substring(0,fileName.lastIndexOf("."));
				//检查扩展名
				//String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");
				String newFileName = df.format(new Date()) + "_" + fileName;
				try{
					File uploadedFile = new File(savePath, newFileName);
					
					item.write(uploadedFile);
				}catch(Exception e){
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
	
	@RequestMapping("/addProject.do")
	public String addProject(Project project,HttpServletRequest request,Integer departmentId,Model model){
		Department department = ds.getDepartmentById(departmentId);
		project.setDepartment(department);
		project.setApplicant(SessionUtils.getUser(request));
		String file = project.getFile();
		if(file!=null&&!file.equals("")){
			String[] arr = file.split("/");
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHH");
			String newFileName = df.format(new Date()) + "_" + arr[arr.length-1];
			file="file/"+newFileName;
			project.setFile(file);
		}
		
		ps.addProject(project);
		return "redirect:/project/projectList.do";
	}
	
	@RequestMapping("/detailedProject.do")
	public String detailedProject(Model model,Integer projectId){
		List<Demand> demands = demandService.getDemands(projectId);
		Project project = ps.getProject(projectId);
		model.addAttribute("project", project);
		model.addAttribute("demands", demands);
		return "project/detailedProject";
	}
	
	
	@RequestMapping("/downFile.do")
	public void downFile(HttpServletResponse response,Integer projectId) throws IOException{
		Project project = ps.getProject(projectId);
		String file = project.getFile();
		String suffix=file.substring(file.indexOf(".")+1, file.length());
		file=file.substring(0, file.indexOf("."));
		String[] str=file.split("/");
		String fileName=str[1].split("_")[1];
		String newFileName="D:/study/nginx/style/"+project.getFile();
		 File f = new File(newFileName);
	        if (!f.exists()) {
	            response.sendError(404, "File not found!");
	            return;
	        }
	        BufferedInputStream br = new BufferedInputStream(new FileInputStream(f));
	        byte[] buf = new byte[1024];
	        int len = 0;

	        response.reset(); // 非常重要
            response.setContentType("application/x-msdownload;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment; filename=" +new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"."+suffix);
	        OutputStream out = response.getOutputStream();
	        while ((len = br.read(buf)) > 0)
	            out.write(buf, 0, len);
	        br.close();
	        out.close();
	}
	
	@RequestMapping("/projectList.do")
	public String projectList(Model model){
		List<Project> projects = ps.getProjects();
		model.addAttribute("projects", new Gson().toJson(projects));
		return "project/projectList";
	}
	
	@RequestMapping("/updateProject.do")
	public String updateProject(Project project){
		ps.updateProject(project);
		return "redirect:/project/projectList.do";
	}
	
	@RequestMapping("/searchProject.do")
	public String searchProject(Project project,Model model){
		List<Project> projects=ps.searchProject(project);
		model.addAttribute("projects", new Gson().toJson(projects));
		return "project/projectList";
	}
}
