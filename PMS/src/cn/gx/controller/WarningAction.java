package cn.gx.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gx.entity.PageBean;
import cn.gx.entity.Reply;
import cn.gx.entity.State;
import cn.gx.entity.Warning;
import cn.gx.service.CommentService;
import cn.gx.service.DemandService;
import cn.gx.service.ReplyService;
import cn.gx.service.WarningService;
import cn.gx.util.FileNameUtils;
import cn.gx.util.SessionUtils;

import com.google.gson.Gson;



@Controller
@RequestMapping("/warn")
public class WarningAction {
	@Resource 
	private WarningService warningService;
	@Resource
	private ReplyService replyService;
	@Resource
	private DemandService demandService;
	@Resource
	private CommentService cs;
	
	//显示故障单（除了已关闭的）
	@RequestMapping(value="/lookWarn.do")
	public String list (HttpServletRequest request,Model model){
		List<Warning> list=warningService.selectWarning(State.CLOSED);
		model.addAttribute("warnNum", list.size());
		model.addAttribute("warnlist",new Gson().toJson(list));
		return "/warn/lookWarn";
	}
	
	//添加故障单页面显示
	@RequestMapping(value="/addUI.do", method = RequestMethod.GET)
	public  String  newWarning(HttpServletRequest request){
		return "/warn/addUI";
	}
	
	
	@RequestMapping(value = "/warnList.do")
	public String ownWarn(Model model,int num){
		
		PageBean pageBean = warningService.findWarningsByPageIndex(num);
		
		List<Warning> warnings=pageBean.getRecords();
		
		Map<Integer,Integer> replyNum=new HashMap<Integer,Integer>();
		for(Warning warning:warnings){
			List<Reply> list = replyService.selectReplyByWarnId(warning.getId());
			replyNum.put(warning.getId(), list.size());
		}
		model.addAttribute("replyNum", replyNum);
		model.addAttribute("warnings", warnings);
		model.addAttribute("num", num);
		model.addAttribute("totalPages", pageBean.getTotalPages());
		
		return "/warn/warnList";
	}
	
	//查询某个故障单
	@RequestMapping(value="/selectone.do")
	public String selectone(Integer id,Model model){
		warningService.addBrowseNumber(id);
	    Warning  warning=warningService.selectoneWarning(id);
	    List<Reply> list =replyService.selectReplyByWarnId(id);
	    Map<Integer,List<Map.Entry<Reply, String>>> allComments=new LinkedHashMap<Integer, List<Map.Entry<Reply, String>>>();
	    
	    Map<Integer, Integer> commentNums=new LinkedHashMap<Integer, Integer>();
	    if(list.size()>0){
	    	for(Reply reply:list){
	    		HashMap<Reply, String> comments =replyService.getAllComments(reply.getId());

	    		List<Map.Entry<Reply, String>> mapList=new ArrayList<Map.Entry<Reply, String>>(comments.entrySet());
	    		Collections.sort(mapList, new Comparator<Map.Entry<Reply, String>>() {

	    			@Override
	    			public int compare(Entry<Reply, String> o1, Entry<Reply, String> o2) {
	    				
	    				return o1.getKey().getReplytime().compareTo(o2.getKey().getReplytime());
	    			}
	    			
	    		});
	    		
	    		allComments.put(reply.getId(),mapList);
	    		commentNums.put(reply.getId(), mapList.size());
	    	}
	    	
	    	model.addAttribute("commentNums",commentNums );
	    	model.addAttribute("allComments", allComments);
	    	Collections.sort(list, new Comparator<Reply>(){

				@Override
				public int compare(Reply o1, Reply o2) {
					return o1.getReplytime().compareTo(o2.getReplytime());
				}
	    		
	    	});
	    	model.addAttribute("replylist",list);
	    }
	    
	    model.addAttribute("warning", warning);
	    return "/warn/warning";
	    
	}
	
	//查看详情后更改状态
	@RequestMapping(value="/update.do", method = RequestMethod.GET)
	public String update (Integer id){
		warningService.updateWarningState(id);
		return "redirect:/warn/lookWarn.do";
	}
	
	//修改报障单
	@RequestMapping(value="/updateWarn", method = RequestMethod.POST)
	public String bestreply (Warning warn){
		String image = warn.getImage();
		if(image!=null&&!image.equals("")){
			String[] arr = image.split("/");
			image="userImages/"+FileNameUtils.getFileName(arr[arr.length-1]) ;
			warn.setImage(image);
		}
		warningService.updateWarn(warn);
		return "redirect:/warn/lookWarn.do";
	}
	
	//最佳回复
	@RequestMapping(value="/bestreply.do")
	public String bestreply (Integer replyId,Integer warnId){
		warningService.bestReply(replyId,warnId);
//		Warning warning = warningService.selectoneWarning(warnId);
//		Comment comment=new Comment(0,warning.getApplicant());
//		cs.sendCommentInfo(comment,warnId);
		return "redirect:/warn/selectone.do?id="+warnId;
	}
	
	
	//上传图片
	@RequestMapping(value="/uploadImage.do")
	public void uploadImage (HttpServletRequest request,HttpServletResponse response){
		//文件保存目录路径
		//String savePath =request.getServletContext().getRealPath("/")+"userImages";
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
	
	
	//添加故障单
	@RequestMapping(value="/saveWarning.do", method = RequestMethod.POST)
	public String saveWarning(Warning warning,HttpServletRequest request){
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String starttime = d.format(new Date());
		warning.setStarttime(starttime);
		warning.setState(State.NOT_SOLVE);
		warning.setApplicant(SessionUtils.getUser(request));
		String image = warning.getImage();
		if(image!=null&&!image.equals("")){
			String[] arr = image.split("/");
			image="userImages/"+FileNameUtils.getFileName(arr[arr.length-1]) ;
			warning.setImage(image);
		}
		
		warningService.saveWarning(warning);
		return "redirect:/warn/lookWarn.do";
	}
	
	//关闭
	@RequestMapping(value="/closeWarning.do") 
	public String closeWarning(Integer id){
		warningService.closeWarning(id);
		return "redirect:/warn/lookWarn.do";
	}
	
}